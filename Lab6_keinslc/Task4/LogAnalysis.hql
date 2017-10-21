
create database if not exists logAnalysisusername;

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
STORED AS orc; 

LOAD DATA INPATH '${hiveconf:pigOutputDir}/${hiveconf:jobDate}/p*' INTO table archiveLogData;

set hive.exec.dynamic.partition.mode=nonstrict;

create Table if not exists logData 
(
    blog string,
    hitRatio float,
    errorRatio float,
)
Partitioned by (year int, month int, day int, hour int)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS orc;

insert into logData partition(year, month, day, hour) select * from  archiveLogData where(year='$hiveconf:year', month='$hiveconf:month', day='$hiveconf:day', hour='$hiveconf:hour');

select Count(*) from archiveLogData;
select Count(*) from logData;