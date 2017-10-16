REGISTER gilmordwlab5-0.0.1-SNAPSHOT.jar;
records = LOAD '$input' using PigStorage('\t') AS (year:chararray, temperature:int, quality:int);
frecords = FILTER records by edu.rosehulman.gilmordw.Task3Filter(record);
grecords = GROUP frecords by year;
temp = FOREACH grecords GENERATE group, MAX(frecords.temperature) as MaxTemp, MIN(frecords.temperature) AS MinTemp, AVG(frecords.temperature) AS AvgTemp;
STORE temp into '$output' using PigStorage(',');