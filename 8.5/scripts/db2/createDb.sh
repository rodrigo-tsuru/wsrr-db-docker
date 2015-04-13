#!/bin/bash
db2 -tf createWsrrDb.sql
db2 -tf createWsrrTables1.sql
db2 -tf createWsrrTables2.sql
db2 -tf createWsrrProcs.sql
