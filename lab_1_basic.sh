#!/bin/sh
URL="http://localhost:3000/todos"
echo "====== 1. API replies OK (read only) ======"
curl $URL |jq
echo "====== 2. API POST (Can't Merge data) ====="
curl $URL -X POST -H "Content-Type: application/json" \
     -d '{"task": "do bad thing"}' |jq


