sqoop export --connect jdbc:mysql://$1/sqooptest --username root -m 1 --table EmployeesExportData --export-dir /tmp/sqoop/Employees --input-null-string 'This is a Null String'
sqoop export --connect jdbc:mysql://$1/sqooptest --username root -m 1 --table EmployeesExportData --export-dir /tmp/sqoop/Employees --input-null-string 'This is a Null String' --update-key eid --update-mode allowinsert
