file_in = $1;
file_out = $2;
records = LOAD '$file_in' using PigStorage('\t') AS (year:chararray, temperature:int, quality:int);
frecords = FILTER records by temperature!=9999 and (quality == 0 OR quality == 1 OR quality == 4 OR quality == 5 or quality == 9);
grecords = GROUP frecords by year;
temps = FOREACH grecords GENERATE group, MAX(frecords.temperature) as MaxTemp, MIN(frecords.temperature) as MinTemp, AVG(frecords.temperature) as AvgTemp;

STORE temps into '$file_out' using PigStorage(',');
