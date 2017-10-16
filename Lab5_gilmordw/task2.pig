REGISTER gilmordwlab5-0.0.1-SNAPSHOT.jar;
records = LOAD '$input' AS (line:chararray);
words = FOREACH records GENERATE edu.rosehulman.gilmordw.Upper(FLATTEN(TOKENIZE(line,' '))) AS word; 
gwords = GROUP words BY word; 
temp = FOREACH gwords GENERATE group, COUNT(words);
STORE temp into '$output' using PigStorage(',');  