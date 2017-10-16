REGISTER 'hdfs:///tmp/input/laeschjs/Lab5_Task2-0.0.1-SNAPSHOT.jar';
DEFINE upper edu.rosehulman.laeschjs.Upper();
lines = LOAD '$input' AS (line:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY upper(word);
wordcount = FOREACH grouped GENERATE group, COUNT(words);
STORE wordcount into '$output' using PigStorage(',');
