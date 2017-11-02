REGISTER 'hdfs:///tmp/Exams/keinslcUDF.jar';
DEFINE nameConcat edu.rosehulman.keinslc.NameConcat();
DEFINE scoreConvert edu.rosehulman.keinslc.ScoreConvert();
grades = LOAD '$gradeInput' using PigStorage(',') as (fname:chararray, lname:chararray, cnum:chararray, score:double);
gradesConcat = foreach grades generate nameConcat(fname, lname) as (name:chararray), cnum, score;
filteredGrades = filter gradesConcat by (score <= 90.0);
retypedGrades = foreach filteredGrades generate name, cnum, (chararray)score as (score:chararray);
gradeConvert = foreach retypedGrades generate name, cnum, scoreConvert(score) as (score:chararray);

courses = LOAD '$courseInput' using PigStorage(',') as (cnum:chararray, cname:chararray);
joined = JOIN gradeConvert by cnum, courses by cnum;
out = foreach joined generate $0, $1, $4, $2;
STORE out into '$pigOutput/$username' using PigStorage('\t');

