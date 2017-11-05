create database if not exists ${databaseName};
use ${databaseName};

create Table if not exists ${tableName}
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

LOAD DATA INPATH '${pigOutputDir}/${year}-${month}-${day}' overwrite INTO table ${tableName};
