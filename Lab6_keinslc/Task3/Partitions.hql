set hive.exec.dynamic.partition.mode=nonstrict;


create database if not exists ${hiveconf:databaseName};

use ${hiveconf:databaseName};

create TABLE if not exists RoseEmployees
(
    firstName string,
    lastName string,
    speciality string,
    dept string,
    employeeNumber int
) 
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE; 

LOAD DATA INPATH '${hiveconf:allEmployeesLocation}' overwrite INTO table RoseEmployees;

--Partitioned by dept string
create Table if not exists RoseStaticEmployees
(
    firstName string,
    lastName string,
    speciality string,
    employeeNumber int
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE;

LOAD DATA INPATH '${hiveconf:csseEmployeesLocation}' overwrite INTO table RoseStaticEmployees Partition(dept='csse');
LOAD DATA INPATH '${hiveconf:eceEmployeesLocation}' overwrite INTO table RoseStaticEmployees Partition(dept='ece');
LOAD DATA INPATH '${hiveconf:adminEmployeesLocation}' overwrite INTO table RoseStaticEmployees Partition(dept='admin');

create Table if not exists RoseDynamicEmployees
(
    firstName string,
    lastName string,
    speciality string,
    employeeNumber int
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc;

insert into table RoseDynamicEmployees partition(dept) select * from RoseStaticEmployees;

create TABLE if not exists RoseStaticEmployeesORC
(
    firstName string,
    lastName string,
    speciality string,
    employeeNumber int
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc;

insert into table RoseStaticEmployeesORC partition(dept='csse') select firstName, lastName, speciality, employeeNumber from RoseEmployees where dept='csse';
insert into table RoseStaticEmployeesORC partition(dept='ece') select firstName, lastName, speciality, employeeNumber from RoseEmployees where dept='ece';
insert into table RoseStaticEmployeesORC partition(dept='admin') select firstName, lastName, speciality, employeeNumber from RoseEmployees where dept='admin';

select Count(*) from RoseEmployees;
select Count(*) from RoseStaticEmployees;
select Count(*) from RoseDynamicEmployees;
select Count(*) from RoseStaticEmployeesORC;

show partitions RoseStaticEmployees;
show partitions RoseDynamicEmployees;
show partitions RoseStaticEmployeesORC;

create TABLE if not exists RoseDynamicEmployeesManualAdd 
(
    firstName string,
    lastName string,
    speciality string,
    employeeNumber int
)
Partitioned by (dept string)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS orc;

