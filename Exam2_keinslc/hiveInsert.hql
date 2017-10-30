use ${hiveconf:databaseName};

LOAD DATA INPATH '${hiveconf:pigOutput}/${hiveconf:username}/' overwrite INTO table ${hiveconf:tempTableName} Partition(username = '${hiveConf:username}');

set hive.exec.dynamic.partition.mode=nonstrict;

insert into table ${hiveconf:tableName} partition(username) select * from ${hiveconf:tempTableName};
