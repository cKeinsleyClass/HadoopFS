create database IF NOT EXISTS ${hiveconf:databaseName};
use ${hiveconf:databaseName};

CREATE TABLE IF NOT EXISTS ${hiveconf:tableName}
(
line string
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\n'
STORED AS TEXTFILE;

LOAD DATA INPATH '${hiveconf:inputLocation}' overwrite INTO table ${hiveconf:tableName};

DROP FUNCTION IF EXISTS udfToUpper;
DROP FUNCTION IF EXISTS udfStripped;
CREATE temporary FUNCTION udfToUpper AS 'edu.rosehulman.laeschjs.Upper' USING JAR 'hdfs:///tmp/input/laeschjs/lab6/Lab6T2-0.0.1-SNAPSHOT.jar';
CREATE temporary FUNCTION udfStripped AS 'edu.rosehulman.laeschjs.Strip' USING JAR 'hdfs:///tmp/input/laeschjs/lab6/Lab6T2-0.0.1-SNAPSHOT.jar';

select word, count(word) from ${hiveconf:tableName}
lateral view explode(split(udfToUpper(udfStripped(line)), ' ')) temp as word
group by word;

