create database if not exists ${databaseName};
use ${databaseName};

create Table if not exists ${tableName}
(
    blog string,
    hitRatio double,
    errorRatio double,
    year string, 
    month string, 
    day string, 
    hour string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE; 

LOAD DATA INPATH '${pigOutputDir}/${year}-${month}-${day}' overwrite INTO table ${tableName};
