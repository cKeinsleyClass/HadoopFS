CREATE DATABASE IF NOT EXISTS ${hiveconf:databaseName};
USE ${hiveconf:databaseName};

CREATE TABLE IF NOT EXISTS ${hiveconf:tableName}
(
year int,
temp int,
quality int,
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE

LOAD DATA INPATH '${hiveconf:inputLocation}' OVERWRITE INTO TABLE ${hiveconf:tableName};
SELECT year, min(temp), max(temp), avg(temp) FROM ${hiveconf:tableName} GROUP BY year;
