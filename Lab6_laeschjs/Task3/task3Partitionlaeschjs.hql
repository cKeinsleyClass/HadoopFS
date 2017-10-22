use ${hiveconf:databaseName};
alter table RoseDynamicEmployeesManualAdd add partition (dept='csse');
alter table RoseDynamicEmployeesManualAdd add partition (dept='ece');
alter table RoseDynamicEmployeesManualAdd add partition (dept='admin');
msck repair table RoseDynamicEmployeesManualAdd;
