create database IF NOT EXISTS ${hiveconf:databaseName};
use ${hiveconf:databaseName};

Create TABLE ${hiveconf:tempTableName}
(
name string,
cno string,
cname string,
grade float
)
Partitioned by (username string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE

Create TABLE ${hiveconf:tableName}
(
name string,
cno string,
cname string,
grade float
)
Partitioned by (username string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc

