create database IF NOT EXISTS ${hiveconf:databaseName};
use ${hiveconf:databaseName};

CREATE TABLE IF NOT EXISTS archiveLogData
(
blog string,
hitRatio decimal,
errorRatio decimal,
year int,
month int,
day int,
hour int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '${hiveconf:pigOutputDir}/${hiveconf:pigOutputDir}/part*' overwrite INTO table archiveLogData;

CREATE TABLE IF NOT EXISTS logData
(
blog string,
hitRatio decimal,
errorRatio decimal
)
Partitioned by (
year int,
month int,
day int,
hour int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc;

insert into table logData partition(year='${hiveconf:year}', month='${hiveconf:month}', day='${hiveconf:day}', hour='${hiveconf:hour}') select blog,hitRatio,errorRatio from archiveLogData where year='${hiveconf:year}' and month='${hiveconf:month}' and day='${hiveconf:day}' and hour='${hiveconf:hour}';

