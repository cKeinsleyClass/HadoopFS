use ${hiveconf:databaseName};

LOAD DATA INPATH '${hiveconf:pigoutput}/part*' overwrite INTO table ${hiveconf:tempTableName} Partition(username = 'laeschjs');

Set hive.exec.dynamic.partition.mode=nonstrict;
insert into table ${hiveconf:tableName} partition(username) select name,cno,cname,grade from ${hiveconf:tempTableName};

