#!/bin/sh
# prepare: installed database and initdb,PATH set ok. service started.
dropdb testdb
createdb testdb
psql -d testdb -f testdb.sql

