CREATE TEMPORARY FUNCTION myUpper as 'edu.rosehulman.gilmordw.Upper' using Jar 'hdfs:///tmp/lab6/jar/HiveFunctions-0.0.1-SNAPSHOT.jar';
CREATE TEMPORARY FUNCTION myStrip as 'edu.rosehulman.gilmordw.Strip' using Jar 'hdfs:///tmp/lab6/jar/HiveFunctions-0.0.1-SNAPSHOT.jar';

CREATE DATABASE IF NOT EXISTS ${hiveconf:databaseName};
USE ${hiveconf:databaseName};
CREATE TABLE IF NOT EXISTS ${hiveconf:tableName}
(
    line string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\n'
STORED AS TEXTFILE; 

LOAD DATA INPATH '${hiveconf:inputLocation}' OVERWRITE INTO TABLE ${hiveconf:tableName};

SELECT word, COUNT(*) 
FROM ${hiveconf:tableName}
LATERAL VIEW EXPLODE(SPLIT(myUpper(myStrip(data)), '\\s+')) ${hiveconf:tableName} AS word
GROUP BY word;