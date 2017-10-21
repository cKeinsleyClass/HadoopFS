create database IF NOT EXISTS ${hiveconf:databaseName};
use ${hiveconf:databaseName};

CREATE TABLE IF NOT EXISTS ${hiveconf:tableName}
(
line varchar(255)
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\s'
STORED AS TEXTFILE;

LOAD DATA INPATH '${hiveconf:inputLocation}' overwrite INTO table ${hiveconf:tableName};

DROP FUNCTION IF EXISTS udfUpper;
DROP FUNCTION IF EXISTS udfStrip;
CREATE FUNCTION udfUpper AS 'edu.rosehulman.laeschjs.Upper' USING JAR 'hdfs:///tmp/input/laeschjs/lab6/Lab6T2-0.0.1-SNAPSHOT.jar';
CREATE FUNCTION udfStrip AS 'edu.rosehulman.laeschjs.Strip' USING JAR 'hdfs:///tmp/input/laeschjs/lab6/Lab6T2-0.0.1-SNAPSHOT.jar';

select udfUpper(udfStrip(word)) from ${hiveconf:tableName}
lateral view explode(split(line, ' ')) temp as word
group by udfUpper(udfStrip(word))
