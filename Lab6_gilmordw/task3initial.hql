SET hive.exec.dynamic.partition.mode=nonstrict;

CREATE DATABASE IF NOT EXISTS ${hiveconf:databaseName};
USE ${hiveconf:databaseName};

CREATE TABLE IF NOT EXISTS RoseEmployees
(
    firstName string,
    lastName string,
    speciality string,
    dept string,
    employeeNumber int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '${hiveconf:allEmployeesLocation}' OVERWRITE INTO TABLE RoseEmployees;

CREATE TABLE IF NOT EXISTS RoseStaticEmployees
(
    firstName string,
    lastName string,
    speciality string,
    employeeNumber int
)
PARTITIONED BY (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '${hiveconf:csseEmployeeLocation}' OVERWRITE INTO TABLE RoseStaticEmployees PARTITION( dept='csse');
LOAD DATA INPATH '${hiveconf:eceEmployeeLocation}' OVERWRITE INTO TABLE RoseStaticEmployees PARTITION( dept='ece');
LOAD DATA INPATH '${hiveconf:adminEmployeeLocation}' OVERWRITE INTO TABLE RoseStaticEmployees PARTITION( dept='admin');

CREATE TABLE IF NOT EXISTS RoseDynamicEmployees
(
    firstName string,
    lastName string,
    speciality string,
    employeeNumber int
)
PARTITIONED BY (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS ORC;

INSERT INTO TABLE RoseDynamicEmployees PARTITION(dept) SELECT * FROM RoseStaticEmployees;

CREATE TABLE IF NOT EXISTS RoseStaticEmployeesORC
(
    firstName string,
    lastName string,
    speciality string,
    employeeNumber int
)
PARTITIONED BY (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS ORC;

INSERT INTO TABLE RoseStaticEmployeesORC PARTITION(dept = 'csse') 
SELECT * 
FROM RoseStaticEmployees;

INSERT INTO TABLE RoseStaticEmployeesORC PARTITION(dept = 'ece') 
SELECT * 
FROM RoseStaticEmployees;

INSERT INTO TABLE RoseStaticEmployeesORC PARTITION(dept = 'admin') 
SELECT * 
FROM RoseStaticEmployees;

SELECT COUNT(*) FROM RoseEmployees;
SELECT COUNT(*) FROM RoseStaticEmployees;
SELECT COUNT(*) FROM RoseDynamicEmployees;
SELECT COUNT(*) FROM RoseStaticEmployeesORC;

SHOW PARTITIONS RoseStaticEmployees;
SHOW PARTITIONS RoseDynamicEmployees;
SHOW PARTITIONS RoseStaticEmployeesORC;

CREATE TABLE IF NOT EXISTS RoseDynamicEmployeesManualAdd
(
    firstName string,
    lastName string,
    speciality string,
    employeeNumber int
)
PARTITIONED BY (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS ORC;