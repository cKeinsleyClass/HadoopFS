REGISTER 'hdfs:///tmp/input/keinslc_Lab5.jar';
DEFINE checkQuality edu.rosehulman.keinslc.IsGoodQuality();
records = LOAD '$file_in' using PigStorage('\t') AS (year:chararray, temperature:int, quality:int);
frecords = FILTER records by temperature!=9999 and checkQuality(quality);
grecords = GROUP frecords by year;
temp = FOREACH grecords GENERATE group, MAX(frecords.temperature) as MaxTemp, MIN(frecords.temperature) as MinTemp, AVG(frecords.temperature) as AvgTemp;
STORE temp into '$file_out' using PigStorage(',');
