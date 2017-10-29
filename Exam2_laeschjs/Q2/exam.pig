REGISTER 'hdfs:///tmp/Exams/laeschjsUDF-0.0.1-SNAPSHOT.jar';
DEFINE fullName edu.rosehulman.laeschjs.Concat();
DEFINE grade edu.rosehulman.laeschjs.ConvertGrade();
grades = LOAD '$gradeInput' using PigStorage(',') AS (fname:chararray, lname:chararray, cnum:chararray, score:float);
courses = LOAD '$courseInput' using PigStorage(',') AS (cnum:chararray, cname:chararray);
fgrades = FILTER grades by score <= 90;
joined = JOIN fgrades by cnum, courses by cnum;
results = FOREACH joined GENERATE fullName(fgrades::fname, fgrades::lname) as name, fgrades::cnum as cnum, courses::cname as cname, grade(fgrades::score) as grade;
STORE results into '$pigOutput/$username' using PigStorage('\t');
