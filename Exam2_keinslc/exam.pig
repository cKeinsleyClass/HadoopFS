REGISTER 'hdfs:///tmp/input/keinslc';
DEFINE nameConcat edu.rosehulman.keinlsc.NameConcat();
courses = LOAD '$courseInput' using PigStorage(',') as (cnum:chararray, cname:chararray);
grades = LOAD '$gradeInput' using PigStorage(',') as (fname:chararray, lname:chararray, cnum:chararray, score:float);
gradesConcat = foreach grades generate nameConcat(fname, lname) as (name:chararray), cnum, score;
filteredGrades = filter gradesConcat by (score <= 90.0);
gradeConvert = foreach filteredGrades generate name, cnum, scoreConvert(score) as (grade:string)

joined = JOIN grades by cnum, courses by cnum
output = foreach joined generate fname, lname, cnum, cname, score;