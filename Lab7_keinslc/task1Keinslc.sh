#!/bin/bash

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees --split-by eid --target-dir /tmp/sqoopOutput

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 1 --target-dir /tmp/sqoopMapOutput

sqoop import --conect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --target-dir /tmp/sqoopSeqOutput --as-sequencefile

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --warehourse-dir /tmp/sqoop/Employees 

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --null-string 'This is a NULL String' --fields-terminated-by '\t' --warehouse-dir /tmp/sqoop/Employees

hive -e "create database if not exists sqooptest"

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --hive-import --crate-hive-table --hive-table sqooptest.Employees

sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --null-string 'This is a NULL String' --fields-terminated-by '\t' --hive-import --crate-hive-table --hive-table sqooptest.Employees

sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username root -m 1 --warehouse-dir /tmp/sqoopAll