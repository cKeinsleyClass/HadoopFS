use ${databaseName};

set hive.exec.dynamic.partition.mode=nonstrict;

create Table if not exists ${orcTableName} 
(
    blog string,
    hitRatio double,
    errorRatio double
)
Partitioned by (year string, month string, day string, hour string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS orc;

insert into ${orcTableName} partition(year, month, day, hour) select * from  ${tableName} where year=${year} and month=${month} and day=${day} and hour=${hour};

select Count(*) from ${orcTableName};
select Count(*) from ${tableName};
