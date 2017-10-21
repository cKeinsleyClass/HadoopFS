
create database if not exists ${hiveconf:databaseName};
use ${hiveconf:databaseName};

create Table if not exists archiveLogData
(
    blog string,
    hitRatio double,
    errorRatio double,
    year int, 
    month int, 
    day int, 
    hour int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE; 

LOAD DATA INPATH '${hiveconf:pigOutputDir}/${hiveconf:jobDate}' INTO table archiveLogData;

set hive.exec.dynamic.partition.mode=nonstrict;

create Table if not exists logData 
(
    blog string,
    hitRatio double,
    errorRatio double
)
Partitioned by (year INT, month INT, day INT, hour INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS orc;

insert into logData partition(year, month, day, hour) select * from  archiveLogData where year=${hiveconf:year} and month=${hiveconf:month} and day=${hiveconf:day} and hour=${hiveconf:hour};

select Count(*) from archiveLogData;
select Count(*) from logData;