#!/bin/sh
### Generate password
#export LC_TYPE=C
#< /dev/urandom tr -dc A-Za-z0-9 | head -c32
###
### set password to test.conf like below:
#jwt-secret = "2lYb90UfbWeIvzHstDwUjkLZdhZJ04Ab"
### restart daemon
kill -9 $(pidof postgrest)
./postgrest testdb.conf &
sleep 5 
### got to https://jwt.io generate token
### token see token.txt
### 
###
URL="http://localhost:3000/todos"
export TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJyb2xlIjoidG9kb191oMjmKP90iqBsipNi0NS3Qtk55e9YllOGUxAJhODsHk"
echo "==== Add new data by POST ===="
curl $URL -X POST -H "Authorization: Bearer $TOKEN"   \
     -H "Content-Type: application/json" \
     -d '{"task": "learn how to auth"}'

echo "=== UPDATE data by PATCH ==="
curl $URL -X PATCH -H "Authorization: Bearer $TOKEN"    \
     -H "Content-Type: application/json"  \
     -d '{"done": true}' 

echo "=== check data ==="
curl $URL | jq
