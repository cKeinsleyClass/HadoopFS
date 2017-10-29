sqoop export --connect jdbc:mysql://$1/sqooptest --password hadoop --username root -m 1 --table EmployeeExportData --export-dir /tmp/sqoop/Employees --input-null-string 'This is a Null String' --input-null-non-string 'This is a Null String'

sqoop export --connect jdbc:mysql://$1/sqooptest --password hadoop --username root -m 1 --table EmployeeExportData --export-dir /tmp/sqoop/Employees --input-null-string 'This is a Null String' --input-null-non-string 'This is a Null String' --update-key eid --update-mode allowinsert
