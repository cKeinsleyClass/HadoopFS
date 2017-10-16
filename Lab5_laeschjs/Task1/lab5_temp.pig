records = LOAD $input using PigStorage('\t') AS (year:chararray, temperature:int, quality:int);
frecords = FILTER records by quality == 0 OR quality == 1;
grecords = GROUP frecords by year;
maxtemp = FOREACH grecords GENERATE group, MAX(frecords.temperature) as MaxTemp;
STORE maxtemp into $output using PigStorage(',');

mintemp = FOREACH grecords GENERATE group, MIN(frecords.temperature) as MaxTemp;
STORE mintemp into $output using PigStorage(',');

avgtemp = FOREACH grecords GENERATE group, AVG(frecords.temperature) as MaxTemp;
STORE avgtemp into $output using PigStorage(',');
