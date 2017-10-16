REGISTER gilmordwlab5-0.0.1-SNAPSHOT.jar;
records = LOAD '$input' AS (line:chararray);
words = FOREACH records GENERATE FLATTEN(TOKENIZE(line,' ')) AS word; 
gwords = GROUP words BY word; 
temp = FOREACH gwords GENERATE edu.rosehulman.gilmordw.Upper(group), COUNT(words);
STORE temp into '$output' using PigStorage(',');  