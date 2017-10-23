SET hive.exec.dynamic.partition.mode=nonstrict;

CREATE DATABASE IF NOT EXISTS ${hiveconf:databaseName};
USE ${hiveconf:databaseName};
CREATE TABLE IF NOT EXISTS archiveLogData
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

CREATE TABLE IF NOT EXISTS logData
(
    blog string,
    hitRatio double,
    errorRatio double
)
PARTITIONED BY (year INT, month INT, day INT, hour INT)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS ORC;

INSERT INTO logData PARTITION(year, month, day, hour)
SELECT * 
FROM archiveLogData 
WHERE year=${hiveconf:year} 
AND month=${hiveconf:month} 
AND day=${hiveconf:day} 
AND hour=${hiveconf:hour};

SELECT COUNT(*) FROM archiveLogData;
SELECT COUNT(*) FROM logData;