use ${hiveconf:databaseName};

LOAD DATA INPATH '/tmp/out/keinslc/' overwrite INTO table ${hiveconf:tempTableName} Partition(username = '${hiveConf:username}');

set hive.exec.dynamic.partition.mode=nonstrict;

insert into table ${hiveconf:tableName} partition(username) select * from ${hiveconf:tempTableName};
