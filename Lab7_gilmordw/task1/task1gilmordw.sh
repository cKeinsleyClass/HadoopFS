sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees --split-by eid --target-dir /tmp/sqoopOutput --delete-target-dir
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 1 --target-dir /tmp/sqoopMapOutput --delete-target-dir
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --target-dir /tmp/sqoopSeqOutput --as-sequencefile --delete-target-dir
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --warehouse-dir /tmp/sqoop --delete-target-dir
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --warehouse-dir /tmp/sqoop --null-string 'This is a Null String' --fields-terminated-by '\t' --delete-target-dir
hive -f task1hive.hql
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees --delete-target-dir
sqoop import --connect jdbc:mysql://$1/sqooptest --username root --table Employees -m 2 --split-by eid --hive-import --create-hive-table --hive-table sqooptest.Employees --delete-target-dir --null-string 'This is a Null String' --fields-terminated-by '\t'
sqoop import-all-tables --connect jdbc:mysql://$1/sqooptest --username root -m 1 --warehouse-dir /tmp/sqoopAll