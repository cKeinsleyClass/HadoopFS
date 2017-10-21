create database IF NOT EXISTS lab6laeschjs;
use lab6laeschjs;

CREATE TABLE IF NOT EXISTS temperatureTable
(
year int,
temperature float,
quality int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE

LOAD DATA INPATH '/tmp/input/laeschjs/lab6/tempInput.txt' overwrite INTO table temperatureTable;

select year, max(temperature) from temperatureTable where quality=1 or quality=0 group by year;

