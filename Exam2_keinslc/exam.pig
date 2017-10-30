REGISTER 'hdfs:///tmp/Exams/keinslcUDF.jar';
DEFINE nameConcat edu.rosehulman.keinslc.NameConcat();
DEFINE scoreConvert edu.rosehulman.keinslc.ScoreConvert();
grades = LOAD '$gradeInput' using PigStorage(',') as (fname:chararray, lname:chararray, cnum:chararray, score:float);
gradesConcat = foreach grades generate nameConcat(fname, lname) as (name:chararray), cnum, score;
filteredGrades = filter gradesConcat by (score <= 90.0);
retypedGrades = foreach filteredGrades generate name, cnum, score as (score:chararray);
gradeConvert = foreach retypedGrades generate name, cnum, scoreConvert(score);

courses = LOAD '$courseInput' using PigStorage(',') as (cnum:chararray, cname:chararray);
joined = JOIN gradeConvert by cnum, courses by cnum;
out = foreach joined generate name, cnum, cname, score;
STORE out into '$pigOutput/$username' using PigStorage('\t');