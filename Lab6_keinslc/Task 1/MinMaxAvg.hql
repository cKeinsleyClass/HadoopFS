-- Need to check if this exists


--  Create a script in Hive to find the minimum temperature, maximum temperature and the average 
--  temperature of each given year in the data set. Please use the sample dataset titled
--  tempInput.txt as your input data set. The hive script should create a database called 
--  lab6username(for instance lab6mohan) if one does not exist. The hive script should also create
--  a table if one does not exist and load the data into the table as a part of the script. It should filter
--   the data to ensure that only data records whose quality attribute(3rd column) is either zero or
--   one are used by the script. The hive script should use variable substitution to accept the name
--   of the database, name of the table, and input location. Please use the variable names
--   databaseName, tableName and inputLocation. Please refer to the following link to learn more
--   about​ ​​variable​ ​substitution​.

set databaseName = lab6test;
set tableName = temperature;
set inputLocation = '/tmp/hiveInput/tempInput.txt'

create database if not exists ${hiveconf:databaseName};

use ${hiveconf:databaseName};


Create TABLE if not exists ${hiveconf:tableName}
(
year int,
temp int,
quality int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE; 

LOAD DATA INPATH '${hiveconf:inputLocation}' overwrite INTO table ${hiveconf:tableName};

select * from ${hiveconf:tableName};

select year, max(temp), min(temp), avg(temp) from ${hiveconf:tableName} group by year;