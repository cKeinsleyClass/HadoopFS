REGISTER gilmordwlab5-0.0.1-SNAPSHOT.jar;
records = LOAD '$input' AS (line:chararray);
frecords = FOREACH records GENERATE FLATTEN(TOKENIZE(REPLACE(line, '([^a-zA-Z\'\\s]+)', ''),' ')) AS word;
grecords = GROUP frecords BY word; 
temp = FOREACH grecords GENERATE edu.rosehulman.gilmordw.Upper(group), COUNT(frecords);
STORE temp into '$output' using PigStorage(',');  