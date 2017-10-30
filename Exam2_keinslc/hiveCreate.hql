create database if not exists ${hiveconf:databaseName};

create table if not exists ${hiveconf:tempTableName}
(
    name string,
    cno string,
    cname string,
    grade string
)
Partitioned by (username string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE; 


create table if not exists ${hiveconf:tableName}
(
    name string,
    cno string,
    cname string,
    grade string
)
Partitioned by (username string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS orc; 