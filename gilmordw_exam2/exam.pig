REGISTER 'hdfs:///tmp/Exams/gilmordwUDF.jar';
grades = LOAD '$grades' USING PigStorage(',') AS (fname:chararray, lname:chararray, cno:chararray, score:double);
courses = LOAD '$courses' USING PigStorage(',') AS (cno:chararray, cname:chararray);
gradesFiltered = FILTER grades by score <= 90;
joingrades = JOIN gradesFiltered by cno, courses by cno;
final = FOREACH joingrades GENERATE edu.rosehulman.gilmordw.Concatenate(fname, lname), courses::cno, cname, edu.rosehulman.gilmordw.GradeToLetter(score);
STORE final into '$pigOutput/$username' USING PigStorage(',');