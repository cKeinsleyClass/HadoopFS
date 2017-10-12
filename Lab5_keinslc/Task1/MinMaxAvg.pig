file_in = $1;
file_out = $2
records = LOAD file_in using PigStorage('\t') AS (year:chararray, temperature:int, quality:int);
frecords = FILTER records by temperature!=9999 and (quality == 0 OR quality == 1 OR quality == 4 OR quality == 5 or quality == 9);
grecords = GROUP frecords by year;
maxTemp = FOREACH grecords GENERATE group, MAX(frecords.temperature) as MaxTemp;
minTemp = FOREACH grecords GENERATE group, MIN(frecords.temperature) as MinTemp;
avgTemp = FOREACH grecords GENERATE group, AVG(frecords.temperature) as AvgTemp;
STORE maxTemp into file_out using PigStorage(',');
STORE minTemp into file_out using PigStorage(',');
STORE avgTemp into file_out using PigStorage(',');
