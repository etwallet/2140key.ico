/**
 *  @file
 *  @copyright defined in eos/LICENSE.txt
 */

#include <eosio.token/eosio.token.hpp>
#include "2140key.ico.hpp"

namespace eosico {

#define TOKEN_SYMBOL    S(4,KEY)
#define PHASE_ONE       1500000000

    void ico::create( account_name issuer,
                        asset        maximum_supply )
    {
        require_auth( _self );

        auto sym = maximum_supply.symbol;
        eosio_assert( sym.is_valid(), "invalid symbol name" );
        eosio_assert( maximum_supply.is_valid(), "invalid supply");
        eosio_assert( maximum_supply.amount > 0, "max-supply must be positive");

        eosio_assert( maximum_supply.symbol == TOKEN_SYMBOL, "only can create KEY symbol");

        stats statstable( _self, sym.name() );
        auto existing = statstable.find( sym.name() );
        eosio_assert( existing == statstable.end(), "token with symbol already exists" );

        statstable.emplace( _self, [&]( auto& s ) {
           s.supply.symbol = maximum_supply.symbol;
           s.max_supply    = maximum_supply;
           s.issuer        = issuer;
        });
    }


    void ico::issue( account_name to, asset quantity, string memo )
    {
        auto sym = quantity.symbol;
        eosio_assert( sym.is_valid(), "invalid symbol name" );
        eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );

        auto sym_name = sym.name();
        stats statstable( _self, sym_name );
        auto existing = statstable.find( sym_name );
        eosio_assert( existing != statstable.end(), "token with symbol does not exist, create token before issue" );
        const auto& st = *existing;

        require_auth( st.issuer );
        eosio_assert( quantity.is_valid(), "invalid quantity" );
        eosio_assert( quantity.amount > 0, "must issue positive quantity" );

        eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
        eosio_assert( quantity.amount <= st.max_supply.amount - st.supply.amount, "quantity exceeds available supply");

        statstable.modify( st, 0, [&]( auto& s ) {
           s.supply += quantity;
        });

        add_balance( st.issuer, quantity, st.issuer );

        if( to != st.issuer ) {
           SEND_INLINE_ACTION( *this, transfer, {st.issuer,N(active)}, {st.issuer, to, quantity, memo} );
        }
    }

    void ico::transfer( account_name from,
                          account_name to,
                          asset        quantity,
                          string       memo )
    {
        require_auth( from );

        eosio_assert( from != to, "cannot transfer to self" );
        eosio_assert( is_account( to ), "to account does not exist");
        auto sym = quantity.symbol.name();
        stats statstable( _self, sym );
        const auto& st = statstable.get( sym );

        require_recipient( from );
        require_recipient( to );

        eosio_assert( quantity.is_valid(), "invalid quantity" );
        eosio_assert( quantity.amount > 0, "must transfer positive quantity" );
        eosio_assert( quantity.symbol == st.supply.symbol, "symbol precision mismatch" );
        eosio_assert( memo.size() <= 256, "memo has more than 256 bytes" );


        sub_balance( from, quantity );
        add_balance( to, quantity, from );
    }

    void ico::sub_balance( account_name owner, asset value ) {
       accounts from_acnts( _self, owner );

       const auto& from = from_acnts.get( value.symbol.name(), "no balance object found" );
       eosio_assert( from.balance.amount >= value.amount, "overdrawn balance" );

        allaccounts _allaccounts(_self, _self);
        const auto& itr = _allaccounts.get( owner, "no balance object found" );
        if(from.balance.amount == value.amount){
            _allaccounts.erase(itr);
        }else{
            _allaccounts.modify( itr, owner, [&]( auto& a ) {
                a.balance -= value;
            });
        }

       if( from.balance.amount == value.amount ) {
          from_acnts.erase( from );
       } else {
          from_acnts.modify( from, owner, [&]( auto& a ) {
              a.balance -= value;
          });
       }
    }

    void ico::add_balance( account_name owner, asset value, account_name ram_payer )
    {
       accounts to_acnts( _self, owner );
       auto to = to_acnts.find( value.symbol.name() );

        allaccounts _allaccounts(_self, _self);
        auto itr = _allaccounts.find(owner);
        if(itr == _allaccounts.end()){
            _allaccounts.emplace( ram_payer, [&]( auto& a ){
                a.account = owner;
                a.balance = value;
            });
        }else if(itr != _allaccounts.end()){
            _allaccounts.modify( itr, 0, [&]( auto& a ) {
                a.balance += value;
            });
        }


       if( to == to_acnts.end() ) {
          to_acnts.emplace( ram_payer, [&]( auto& a ){
            a.balance = value;
          });
       } else {
          to_acnts.modify( to, 0, [&]( auto& a ) {
            a.balance += value;
          });
       }
    }

    void ico::buykey(account_name to, asset quantity, string memo){
        require_auth(to);
        eosio_assert(quantity.symbol == S(4, EOS), "symbol must be EOS");

        stats statstable( _self, symbol_type(TOKEN_SYMBOL).name() );
        auto existing = statstable.find( symbol_type(TOKEN_SYMBOL).name() );
        eosio_assert( existing != statstable.end(), "token with symbol does not exist, create token before issue" );

        eosio_assert( existing->supply.amount+quantity.amount <= PHASE_ONE, "the key has been sold more than 150000.0000");

        SEND_INLINE_ACTION( *this, issue, {existing->issuer,N(active)}, {to, asset{quantity.amount, TOKEN_SYMBOL}, memo} );

        icoinfos _icoinfo(_self, _self);
        _icoinfo.emplace( to, [&]( auto& a ){
            a.id = _icoinfo.available_primary_key();
            a.account = to;
            a.quant = quantity;
            a.time = time_point_sec(now());
        });
    }
} /// namespace eosio

using namespace eosico;
#include <eosiolib/action.h>

extern "C" {

void apply( uint64_t receiver, uint64_t code, uint64_t action ) {
//    print( "\nicoapply,", name{receiver},"\n" );

    auto self = receiver;
    eosico::ico thiscontract( receiver );
    if( code == N(eosio.token) &&  action == N(transfer) ) {
        eosio::token::transfer_args tmp = unpack_action_data<eosio::token::transfer_args>();

        if(tmp.to != self){
            return;
        }

        string memo = tmp.memo;

        memo.erase(memo.begin(), find_if(memo.begin(), memo.end(), [](int ch) {
            return !isspace(ch);
        }));
        memo.erase(find_if(memo.rbegin(), memo.rend(), [](int ch) {
            return !isspace(ch);
        }).base(), memo.end());

        auto separator_pos = memo.find(' ');
        if (separator_pos == string::npos) {
            separator_pos = memo.find(':');
        }

        eosio_assert(separator_pos != string::npos, "Function name and other command must be separated with space or colon");

        string func_name_str = memo.substr(0, separator_pos);
        if(0 == func_name_str.compare("buykey")){
            thiscontract.buykey(tmp.from, tmp.quantity,tmp.memo);
        }

    }
    else if (code == self  || action == N(onerror) ){
        switch (action)
        {
            EOSIO_API( eosico::ico, (create)(issue)(transfer) )
        }
    }
}
}

//EOSIO_ABI( eosico::ico, (create)(issue)(transfer) )
