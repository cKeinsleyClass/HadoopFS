records = LOAD '$input' using PigStorage(',');
info = FILTER records BY $0 == 'input';
teams = FILTER info BY ($1 matches '.*team.*');
DUMP teams;
