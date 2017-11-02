USE ${hiveconf:databaseName};
SET hive.exec.dynamic.partition.mode=nonstrict;

LOAD DATA INPATH '${hiveconf:pigOutput}' 
OVERWRITE INTO TABLE ${hiveconf:tempTableName} 
PARTITION( username='gilmordw');

INSERT INTO TABLE  ${hiveconf:tableName} 
PARTITION(username) 
SELECT * FROM ${hiveconf:tempTableName};