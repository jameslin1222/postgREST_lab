#!/bin/sh
### set Expiration
### use "role" and "exp"
### use Epoch to set expiration. Epoch(the seconds is from 1970 to now)
###
### psql (expire 5 minutes)
psql testdb -c "select extract(epoch from now() + '5 minutes'::interval) :: integer \"expire time\",now();"

###
##  expire time |              now              
##-------------+-------------------------------
##  1568191841 | 2019-09-11 16:45:41.354558+08
##(1 row)
###
### go to https://jwt.io
### "role":"todo_user", "exp": 1568191841
#  get new token "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidG9kb191c2VyIiwiZXhwIjoxNTY4MTkxODQxfQ.PKuhXILzzzdcPkZYxC2Idz9y2BVmqOPAUZHRR4kf0p8"
URL="http://localhost:3000/todos"
export NEW_TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidG9kb191c2VyIiwiZXhwIjoxNTY4MTkxODQxfQ.PKuhXILzzzdcPkZYxC2Idz9y2BVmqOPAUZHRR4kf0p8"

curl $URL -H "Authorization: Bearer $NEW_TOKEN" |jq
echo "wait 5 minitues"
sleep 301
echo "After 5 minitues"
curl $URL -H "Authorization: Bearer $NEW_TOKEN" |jq
