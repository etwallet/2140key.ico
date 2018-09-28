
sh /home/root1/work/ET-exchange/etbexchange/bancor.sh
cleos --wallet-url http://127.0.0.1:4444 --url http://localhost:8000  get table etbexchanger etbexchanger markets

eosiocpp -o /home/root1/work/etbexchange/etbexchange.wast  /home/root1/work/etbexchange/etbexchange.cpp /home/root1/work/etbexchange/exchange_state.cpp
eosiocpp -g /home/root1/work/etbexchange/etbexchange.api  /home/root1/work/etbexchange/etbexchange.cpp
cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 set contract etbexchanger /home/root1/work/etbexchange -p etbexchanger
cleos --wallet-url http://127.0.0.1:4444 --url http://localhost:8000  push action etbexchanger pause '[]' -p etbexchanger
cleos --wallet-url http://127.0.0.1:4444 --url http://localhost:8000  get table etbexchanger etbexchanger markets

eosiocpp -o /home/root1/work/eos/contracts/etbexchange/etbexchange.wast  /home/root1/work/eos/contracts/etbexchange/etbexchange.cpp /home/root1/work/eos/contracts/etbexchange/exchange_state.cpp
eosiocpp -g /home/root1/work/eos/contracts/etbexchange/etbexchange.api  /home/root1/work/eos/contracts/etbexchange/etbexchange.cpp
cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 set contract etbexchanger /home/root1/work/eos/contracts/etbexchange -p etbexchanger
cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 push action etbexchanger restart '[]' -p etbexchanger 
cleos --wallet-url http://127.0.0.1:4444 --url http://localhost:8000  get table etbexchanger etbexchanger markets


eosiocpp -o /home/root1/work/eos/contracts/2140key.ico/2140key.ico.wast  /home/root1/work/eos/contracts/2140key.ico/2140key.ico.cpp 
eosiocpp -g /home/root1/work/eos/contracts/2140key.ico/2140key.ico.api  /home/root1/work/eos/contracts/2140key.ico/2140key.ico.cpp

#cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 set contract  issuerkeyacc /home/root1/work/eos/contracts/2140key.ico -p  issuerkeyacc


cleos --wallet-url http://localhost:6666  wallet unlock --password=PW5KY1uq5mBaJRizwHhPAYp1w71yXRgAT322gKR6Yh7Uwx4BymBai

cleos --wallet-url http://localhost:6666  wallet import  --private-key 5KDsFepEAS7hEpnkRVFk7NQiX7gxCTVvUVTTVvi84XSkuNKRaVh

#cleos --wallet-url http://localhost:6666 --url http://localhost:8000 create account eosio eosio.token EOS7nnGJ7Ra911dwR1rQFw2MD2M8RkRPzUBtYb3qBmuYfaxbkUWmd EOS7nnGJ7Ra911dwR1rQFw2MD2M8RkRPzUBtYb3qBmuYfaxbkUWmd

#cleos --wallet-url http://localhost:6666 --url http://localhost:8000 set contract eosio.token /home/root1/work/eos/build/contracts/eosio.token -p eosio.token

#cleos --wallet-url http://localhost:6666 --url http://localhost:8000 push action eosio.token create '["eosio", "1000000.0000 EOS", 0, 0, 0]' -p eosio.token

cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 push action eosio.token issue '[ "eosio", "100000000.0000 EOS", "memo"]' -p eosio


cleos --wallet-url http://127.0.0.1:4444 wallet unlock --password=PW5HzA1Gbp8mCE4grJHnFsSTFWnoynhLLKjnsBHQsRSAdWcuaMmjD

#创建交易所合约账户 etbexchange5
#Private key: 5HrvtqXNEDSJyjqcoxr45Frgxatf2nMWcNtcV2NqW2zD4dctoWM
#Public key: EOS6D1nt1aYtWPbfm5qburgRZc8gHVY6pwAcu812U9CnYigJN1saA
cleos --wallet-url http://127.0.0.1:4444 wallet import  --private-key 5HrvtqXNEDSJyjqcoxr45Frgxatf2nMWcNtcV2NqW2zD4dctoWM

cleos  --wallet-url http://localhost:6666   --url http://localhost:8000 system newaccount --transfer eosio etbexchanger EOS6D1nt1aYtWPbfm5qburgRZc8gHVY6pwAcu812U9CnYigJN1saA --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "10000.0000 EOS"


cleos --wallet-url http://127.0.0.1:4444 wallet import  --private-key 5HxS1BExGpZkink9wxK9kfhiLsqqvGPwtuqqyCCGn2mCU9Gux2M
cleos  --wallet-url http://localhost:6666   --url http://localhost:8000 system newaccount --transfer eosio  etbexchange5 EOS7YAQTAALWQ6mRZCNchz3sGivmzzfrdmrY1EDat9jodXBwj6ShN --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "100.0000 EOS"





#创建交易所资金账户exchangeacc1,用来存放EOS和ETB代币
#Private key: 5HxS1BExGpZkink9wxK9kfhiLsqqvGPwtuqqyCCGn2mCU9Gux2M
#Public key: EOS7YAQTAALWQ6mRZCNchz3sGivmzzfrdmrY1EDat9jodXBwj6ShN
cleos --wallet-url http://127.0.0.1:4444 wallet import  --private-key 5HxS1BExGpZkink9wxK9kfhiLsqqvGPwtuqqyCCGn2mCU9Gux2M
cleos  --wallet-url http://localhost:6666   --url http://localhost:8000 system newaccount --transfer eosio gameone54321 EOS7YAQTAALWQ6mRZCNchz3sGivmzzfrdmrY1EDat9jodXBwj6ShN --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "100.0000 EOS"


#Private key: 5Jt1McNGg4YhATfRtuz6N6VVePY8srJTdP15vWNezqjofmDiku3
#Public key: EOS6HLK29n42rxDdrzFicu5gp2Xfgubwbe29Ue57Uux7APp8bsCtE
cleos --wallet-url http://127.0.0.1:4444 wallet import  --private-key 5Jt1McNGg4YhATfRtuz6N6VVePY8srJTdP15vWNezqjofmDiku3
cleos  --wallet-url http://localhost:6666   --url http://localhost:8000 system newaccount --transfer eosio  etbexchange5 EOS6HLK29n42rxDdrzFicu5gp2Xfgubwbe29Ue57Uux7APp8bsCtE --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "100.0000 EOS"



#移除etbissue1111权限
#cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000  set account permission etbissue1111 owner '{"threshold": 1,"keys": [],"accounts": [{"permission":{"actor":"etbico111111","permission":"eosio.code"},"weight":1}]}'  -p etbissue1111@owner

#cleos  --wallet-url http://127.0.0.1:4444  --url http://localhost:8000 set account permission etbissue1111 active '{"threshold": 1,"keys": [],"accounts": [{"permission":{"actor":"etbico111111","permission":"eosio.code"},"weight":1}]}' owner -p etbissue1111

#创建用户账户
#Private key: 5KDsFepEAS7hEpnkRVFk7NQiX7gxCTVvUVTTVvi84XSkuNKRaVh
#Public key: EOS7nnGJ7Ra911dwR1rQFw2MD2M8RkRPzUBtYb3qBmuYfaxbkUWmd
cleos --wallet-url http://localhost:6666 --url http://localhost:8000  system newaccount --transfer eosio user11111111 EOS7nnGJ7Ra911dwR1rQFw2MD2M8RkRPzUBtYb3qBmuYfaxbkUWmd --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "100.0000 EOS"

#Private key: 5Jo6Ceomf55SomY3ywwUHVBXK5GzLZF3UCbAgXKP4fvVotLYP1E
#Public key: EOS7TbrWEfDYug9DTu3rERagB5f2kYVZrB9bS8VU9kwjT9DWH9s8B
cleos --wallet-url http://localhost:6666  wallet import  --private-key 5Jo6Ceomf55SomY3ywwUHVBXK5GzLZF3UCbAgXKP4fvVotLYP1E
cleos --wallet-url http://localhost:6666 --url http://localhost:8000  system newaccount --transfer eosio user22222222 EOS7TbrWEfDYug9DTu3rERagB5f2kYVZrB9bS8VU9kwjT9DWH9s8B --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "100.0000 EOS"


cleos --wallet-url http://localhost:6666 --url http://localhost:8000  system newaccount --transfer eosio user44444444 EOS7TbrWEfDYug9DTu3rERagB5f2kYVZrB9bS8VU9kwjT9DWH9s8B --stake-net "0000.0000 EOS" --stake-cpu "0000.0000 EOS" --buy-ram "100.0000 EOS"



cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 push action eosio.token issue '["user11111111", "100000000.0000 EOS", "memo"]' -p eosio
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 push action eosio.token issue '["user22222222", "100000000.0000 EOS", "memo"]' -p eosio
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 push action eosio.token issue '["user44444444", "100000000.0000 EOS", "memo"]' -p eosio


#创建 issuerkeyacc账户，用来发ETB代币
#Private key: 5KheFqEF87wiipLnDSGovivzNizRdM9qkY49q2SnEFdpfEKrvDK
#Public key: EOS7hB21d8HzVEwV4EF984J1fjGYJw7CfNhuCAtfpSu729xAtkytt

cleos --wallet-url http://127.0.0.1:4444 wallet import  --private-key 5KheFqEF87wiipLnDSGovivzNizRdM9qkY49q2SnEFdpfEKrvDK

cleos  --wallet-url http://localhost:6666   --url http://localhost:8000 system newaccount --transfer eosio  issuerkeyacc EOS7hB21d8HzVEwV4EF984J1fjGYJw7CfNhuCAtfpSu729xAtkytt --stake-net "1000.0000 EOS" --stake-cpu "1000.0000 EOS" --buy-ram "100.0000 EOS"




cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 set contract  issuerkeyacc /home/root1/work/eos/contracts/2140key.ico -p  issuerkeyacc

cleos  --wallet-url http://127.0.0.1:4444  --url http://localhost:8000 push action  issuerkeyacc create '["issuerkeyacc", "1000000.0000 KEY", 0, 0, 0]' -p  issuerkeyacc

#cleos  --wallet-url http://localhost:4444 --url http://localhost:8000 push action  issuerkeyacc issue '[" etbexchange5", "850000.0000 KEY", "memo"]' -p  issuerkeyacc

#cleos  --wallet-url http://127.0.0.1:4444  --url http://localhost:8000 push action  issuerkeyacc issue '[ "user11111111", "1000000.0000 ETB", "memo"]' -p  issuerkeyacc
#cleos  --wallet-url http://127.0.0.1:4444  --url http://localhost:8000 push action  issuerkeyacc issue '[ "user22222222", "1000000.0000 ETB", "memo"]' -p  issuerkeyacc
#cleos  --wallet-url http://127.0.0.1:4444  --url http://localhost:8000 push action  issuerkeyacc issue '[ "etbexchanger", "100000000.0000 YZB", "memo"]' -p  issuerkeyacc


cleos  --wallet-url http://localhost:4444 --url http://localhost:8000  set account permission  issuerkeyacc active '{"threshold": 1,"keys": [{"key": "EOS7hB21d8HzVEwV4EF984J1fjGYJw7CfNhuCAtfpSu729xAtkytt","weight": 1}],"accounts": [{"permission":{"actor":"issuerkeyacc","permission":"eosio.code"},"weight":1}]}' owner -p  issuerkeyacc


cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance eosio.token user11111111
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance eosio.token user22222222
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance eosio.token issuerkeyacc
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance eosio.token etbexchanger
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance eosio.token etbexchange5


cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance  issuerkeyacc user11111111
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance  issuerkeyacc user22222222
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance  issuerkeyacc etbexchanger
cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency balance  issuerkeyacc  etbexchange5


cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 push action eosio.token create '["eosio", "10000000000.0000 BTC", "memo"]' -p eosio.token

cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 push action eosio.token issue '["user11111111", "100000000.0000 BTC", "memo"]' -p eosio
exit
cleos  --wallet-url http://127.0.0.1:6666 --url http://localhost:8000 push action eosio.token transfer '["user11111111", "issuerkeyacc","150000.0000 BTC","buykey:"]' -p user11111111

cleos  --wallet-url http://127.0.0.1:6666 --url http://localhost:8000 push action eosio.token transfer '["user11111111", "issuerkeyacc","10000.0000 EOS","buykey:"]' -p user11111111
cleos  --wallet-url http://127.0.0.1:6666 --url http://localhost:8000 push action eosio.token transfer '["user11111111", "issuerkeyacc","20000.0000 EOS","buykey:"]' -p user11111111
cleos  --wallet-url http://127.0.0.1:6666 --url http://localhost:8000 push action eosio.token transfer '["user11111111", "issuerkeyacc","30000.0000 EOS","buykey:"]' -p user11111111
cleos  --wallet-url http://127.0.0.1:6666 --url http://localhost:8000 push action eosio.token transfer '["user11111111", "issuerkeyacc","90000.0000 EOS","buykey:"]' -p user11111111

cleos  --wallet-url http://127.0.0.1:6666 --url http://localhost:8000 push action eosio.token transfer '["user11111111", "issuerkeyacc","150000.0000 EOS","buykey:"]' -p user11111111

cleos  --wallet-url http://127.0.0.1:6666 --url http://localhost:8000 push action eosio.token transfer '["user11111111", "issuerkeyacc","1.0000 EOS","buykey:"]' -p user11111111

cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get currency stats  issuerkeyacc KEY

cleos  --wallet-url http://localhost:6666 --url http://localhost:8000 get table  issuerkeyacc issuerkeyacc icoinfos



cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 push action eosio.token transfer '["issuerkeyacc", "etbexchanger","50000.0000 EOS","buykey:"]' -p  issuerkeyacc

cleos  --wallet-url http://localhost:4444 --url http://localhost:8000 push action  issuerkeyacc issue '["etbexchanger", "850000.0000 KEY", "memo"]' -p  issuerkeyacc

cleos  --wallet-url http://localhost:4444 --url http://localhost:8000  set account permission etbexchanger active '{"threshold": 1,"keys": [{"key": "EOS6D1nt1aYtWPbfm5qburgRZc8gHVY6pwAcu812U9CnYigJN1saA","weight": 1}],"accounts": [{"permission":{"actor":"etbexchanger","permission":"eosio.code"},"weight":1}]}' owner -p etbexchanger

cleos  --wallet-url http://localhost:4444 --url http://localhost:8000  set account permission  etbexchange5 active '{"threshold": 1,"keys": [{"key": "EOS7YAQTAALWQ6mRZCNchz3sGivmzzfrdmrY1EDat9jodXBwj6ShN","weight": 1}],"accounts": [{"permission":{"actor":"etbexchanger","permission":"eosio.code"},"weight":1}]}' owner -p  etbexchange5

cleos  --wallet-url http://localhost:6666 --url http://localhost:8000  set account permission user11111111 active '{"threshold": 1,"keys": [{"key": "EOS7nnGJ7Ra911dwR1rQFw2MD2M8RkRPzUBtYb3qBmuYfaxbkUWmd","weight": 1}],"accounts": [{"permission":{"actor":"etbexchanger","permission":"eosio.code"},"weight":1}]}' owner -p user11111111

cleos  --wallet-url http://localhost:6666 --url http://localhost:8000  set account permission user22222222 active '{"threshold": 1,"keys": [{"key": "EOS7TbrWEfDYug9DTu3rERagB5f2kYVZrB9bS8VU9kwjT9DWH9s8B","weight": 1}],"accounts": [{"permission":{"actor":"etbexchanger","permission":"eosio.code"},"weight":1}]}' owner -p user22222222

cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 set contract etbexchanger /home/root1/work/eos/contracts/etbexchange -p etbexchanger

cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 push action etbexchanger create '["etbexchanger","etbexchange5", "50000.0000 EOS","issuerkeyacc","850000.0000 KEY"]' -p etbexchanger

cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 push action etbexchanger setparam '["issuerkeyacc","4,KEY","exchange_type","0"]' -p etbexchanger 

#cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 push action etbexchanger setparam '["issuerkeyacc","4,KEY","base_weight","20/1"]' -p etbexchanger

#cleos  --wallet-url http://127.0.0.1:4444 --url http://localhost:8000 push action etbexchanger setparam '["issuerkeyacc","4,KEY","quote_weight","1/20"]' -p etbexchanger

cleos --wallet-url http://127.0.0.1:4444 --url http://localhost:8000  get table etbexchanger etbexchanger markets
exit

cleos --wallet-url http://localhost:6666 --url http://localhost:8000  push action etbexchanger buytoken '["user22222222", "10000.0000 EOS","issuerkeyacc", "4,KEY", "feeaccount", "0"]' -p user22222222

cleos --wallet-url http://localhost:6666 --url http://localhost:8000  push action etbexchanger selltoken '["user22222222", "issuerkeyacc", "0.8499 KEY", "feeaccount", "0"]' -p user22222222

cleos --wallet-url http://localhost:6666 --url http://localhost:8000  push action etbexchanger selltoken '["user11111111","issuerkeyacc", "150000.0000 KEY", "feeaccount", "0"]' -p user11111111

cleos --wallet-url http://localhost:6666 --url http://localhost:8000  push action etbexchanger buytoken '["user11111111", "50000.0000 EOS","issuerkeyacc", "4,KEY", "feeaccount", "0"]' -p user11111111

cleos --wallet-url http://localhost:6666 --url http://localhost:8000  push action etbexchanger addtoken '["user11111111", "10000.0000 EOS","issuerkeyacc", "4,KEY"]' -p user11111111
cleos --wallet-url http://localhost:6666 --url http://localhost:8000  push action etbexchanger addtoken '["user22222222", "10000.0000 EOS","issuerkeyacc", "4,KEY"]' -p user22222222

cleos --wallet-url http://localhost:6666 --url http://localhost:8000  push action etbexchanger subtoken '["user11111111", "10000.0000 EOS","issuerkeyacc", "4,KEY"]' -p user11111111
cleos --wallet-url http://localhost:6666 --url http://localhost:8000  push action etbexchanger subtoken '["user22222222", "10000.0000 EOS","issuerkeyacc", "4,KEY"]' -p user22222222

cleos --wallet-url http://127.0.0.1:4444 --url http://localhost:8000  get table etbexchanger etbexchanger markets

cleos --wallet-url http://127.0.0.1:4444 --url http://localhost:8000  get table issuerkeyacc issuerkeyacc allaccounts












