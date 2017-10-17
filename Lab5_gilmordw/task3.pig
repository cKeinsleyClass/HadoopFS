REGISTER /tmp/lab5/jar/gilmordwlab5-0.0.1-SNAPSHOT.jar;
records = LOAD '$input' using PigStorage('\t') AS (year:chararray, temperature:int, quality:int);
frecords = FILTER records by edu.rosehulman.gilmordw.Task3Filter(quality);
grecords = GROUP frecords by year;
temp = FOREACH grecords GENERATE group, MIN(frecords.temperature) AS MinTemp, MAX(frecords.temperature) as MaxTemp, AVG(frecords.temperature) AS AvgTemp;
STORE temp into '$output' using PigStorage(',');