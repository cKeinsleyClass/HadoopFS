#!/bin/bash

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees --delete-target-dir --split-by eid --target-dir /tmp/sqoopOutput

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 1 --delete-target-dir --target-dir /tmp/sqoopMapOutput

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --delete-target-dir --target-dir /tmp/sqoopSeqOutput --as-sequencefile

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2  --split-by eid --delete-target-dir --warehouse-dir /tmp/sqoop/Employees 

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --delete-target-dir --null-string 'This is a NULL String' --fields-terminated-by '\t' --warehouse-dir /tmp/sqoop/Employees

hive -e "create database if not exists sqooptest"

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --null-string 'This is a NULL String' --fields-terminated-by '\t' --hive-import --create-hive-table --hive-table sqooptest.Employees

sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username root -m 1 --warehouse-dir /tmp/sqoopAll