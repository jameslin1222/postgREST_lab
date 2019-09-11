#!/bin/sh
status=`pidof postgrest`
[ "$?" -ne 0 ] && ./postgrest testdb.conf
check=`pidof postgrest`
#echo $?
[ "$?" -ne 0 ] && echo "Start Error! please check!" && exit 0
echo "Daemon postrest started OK!"
