create database if not exists ${hiveconf:databaseName};
use ${hiveconf:databaseName};

Create TABLE if not exists ${hiveconf:tableName}
(
year int,
temp int,
quality int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE; 

LOAD DATA INPATH ${hiveconf:inputLocation} overwrite INTO table ${hiveconf:tableName};

select year, max(temp), min(temp), avg(temp) from ${hiveconf:tableName} where quality == 1 OR quality == 0 group by year;