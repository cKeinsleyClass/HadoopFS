#!/bin/bash

sqoop export --connect jdbc:mysql://$1/sqooptest --username root -m 1 --table EmployeesExportData --export-dir /tmp/sqoop/Employees --input-fields-terminated-by '\t' --input-null-string '\\N' 

sqoop export --connect jdbc:mysql://$1/sqooptest --username root -m 1 --table EmployeesExportData --export-dir /tmp/sqoop/Employees --input-fields-terminated-by '\t'  --input-null-string '\\N'  --update-key eid --update-mode allowinsert