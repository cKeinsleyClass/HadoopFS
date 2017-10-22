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

