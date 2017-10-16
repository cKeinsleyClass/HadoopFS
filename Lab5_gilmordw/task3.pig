REGISTER gilmordwlab5-0.0.1-SNAPSHOT.jar;
records = LOAD '$input' using PigStorage('\t') AS (year:chararray, temperature:int, quality:int);
grecords = GROUP records by year;
frecords = FILTER grecords by edu.rosehulman.gilmordw.Task3Filter(records);
temp = FOREACH frecords GENERATE group, MAX(records.temperature) as MaxTemp, MIN(records.temperature) AS MinTemp, AVG(records.temperature) AS AvgTemp;
STORE temp into '$output' using PigStorage(',');