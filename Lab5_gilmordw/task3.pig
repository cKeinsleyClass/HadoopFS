REGISTER gilmordwlab5-0.0.1-SNAPSHOT.jar;
records = LOAD '$input' using PigStorage('\t') AS (year:chararray, temperature:int, quality:int);
grecords = GROUP frecords by year;
frecords = FILTER grecords by edu.rosehulman.gilmordw.Task3Filter(records);
temp = FOREACH frecords GENERATE group, MAX(frecords.temperature) as MaxTemp, MIN(frecords.temperature) AS MinTemp, AVG(frecords.temperature) AS AvgTemp;
STORE temp into '$output' using PigStorage(',');