create database IF NOT EXISTS ${hiveconf:databaseName};
use ${hiveconf:databaseName};

CREATE TABLE IF NOT EXISTS RoseEmployees
(
fname string,
lname string,
speciality string,
dept string,
eNum int
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '${hiveconf:allEmployeesLocation}' overwrite INTO table RoseEmployees;

CREATE TABLE IF NOT EXISTS RoseStaticEmployees
(
fname string,
lname string,
speciality string,
eNum int
)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '${hiveconf:csseEmployeesLocation}' INTO Table RoseStaticEmployees Partition(dept = 'csse')
LOAD DATA INPATH '${hiveconf:eceEmployeesLocation}' INTO Table RoseStaticEmployees Partition(dept = 'ece')
LOAD DATA INPATH '${hiveconf:adminEmployeesLocation}' INTO Table RoseStaticEmployees Partition(dept = 'admin')

Create TABLE RoseDynamicEmployees
(
fname string,
lname string,
speciality string,
eNum int
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc

Set hive.exec.dynamic.partition.mode=nonstrict;
insert into table RoseDynamicEmployees partition(dept) select fname,lname,speciality,eNum from RoseStaticEmployees;

Create TABLE RoseStaticEmployeesORC
(
fname string,
lname string,
speciality string,
eNum int
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc

insert into table RoseStaticEmployeesORC partition(dept='csse') select fname,lname,speciality,eNum from RoseEmployees where dept='csse'
insert into table RoseStaticEmployeesORC partition(dept='ece') select fname,lname,speciality,eNum from RoseEmployees where dept='ece'
insert into table RoseStaticEmployeesORC partition(dept='admin') select fname,lname,speciality,eNum from RoseEmployees where dept='admin'

select count(*) from RoseEmployees;
select count(*) from RoseStaticEmployees;
select count(*) from RoseDynamicEmployees;
select count(*) from RoseStaticEmployeesORC;

show partitions RoseStaticEmployees;
show partitions RoseDynamicEmployees;
show partitions RoseStaticEmployeesORC;

Create TABLE RoseDynamicEmployeesManualAdd
(
fname string,
lname string,
speciality string,
eNum int
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc

