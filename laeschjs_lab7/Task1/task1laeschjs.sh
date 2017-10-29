#!/bin/sh

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --password hadoop --table Employees --split-by eid --target-dir /tmp/sqoopOutput

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --password hadoop --table Employees -m 1 --target-dir /tmp/sqoopMapOutput

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --password hadoop -m 2 --table Employees --target-dir /tmp/sqoopSeqOutput --as-sequencefile

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --password hadoop -m 2 --table Employees --warehouse-dir /tmp/sqoop

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --password hadoop --delete-target-dir -m 1 --table Employees --warehouse-dir /tmp/sqoop --fields-terminated-by '\t' --null-string 'This is a Null String' --null-non-string 'This is a Null String'

hive create database sqooptest;

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --password hadoop -m 2 --table Employees --hive-import --create-hive-table --hive-table sqooptest.Employees

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --password hadoop -m 2 --table Employees --hive-import --create-hive-table --hive-table sqooptest.Employees --fields-terminated-by '\t' --null-string 'This is a Null String' --null-non-string 'This is a Null String'

sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username root --password hadoop -m 1 --warehouse-dir /tmp/sqoopAll/

