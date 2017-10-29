sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees --split-by eid --target-dir /tmp/sqoopOutput --delete-target-dir
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 1 --target-dir /tmp/sqoopMapOutput --delete-target-dir
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --target-dir /tmp/sqoopOutput --as-sequencefile --delete-target-dir
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --warehouse-dir /tmp/sqoop
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --warehouse-dir /tmp/sqoop --null-string 'This is a Null String' --fields-terminated-by '\t'
hive task1hive.hql
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees --null-string 'This is a Null String' --fields-terminated-by '\t'
sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username root -m 1 --split-by eid --warehouse-dir /tmp/sqoopAll