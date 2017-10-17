

set databaseName=lab6keinslc;
set tableName=WordCount;
set inputLocation='/tmp/hiveInput/testFile.txt';

create TEMPORARY function myUpper as 'edu.rosehulman.keinslc.Upper' using Jar 'hdfs:///tmp/input/keinslc_lab6.jar';
create TEMPORARY function myTrim as 'edu.rosehulman.keinslc.Trim' using Jar 'hdfs:///tmp/input/keinslc_lab6.jar';

create database if not exists ${hiveconf:databaseName};

use ${hiveconf:databaseName};


Create TABLE if not exists ${hiveconf:tableName}
(
line string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\n'
STORED AS TEXTFILE; 

LOAD DATA INPATH ${hiveconf:inputLocation} overwrite INTO table ${hiveconf:tableName};

Select word, count(*) FROM ${hiveconf:tableName}
 
LATERAL VIEW explode(split(myUpper(myTrim(line)), '\\s+')) ${hiveconf:tableName} AS word
 
GROUP BY word;