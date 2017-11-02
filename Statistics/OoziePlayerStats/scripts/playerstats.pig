records = LOAD '/tmp/stats/player/part*' USING PigStorage('\t') AS (playerId:chararray, AB:int, hits:int, singles:int, doubles:int, triples:int, hrs:int, avg:double);
STORE records INTO 'hbase://players$yearStats' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
'stats:AB 
 stats:hits
 stats:singles
 stats:doubles
 stats:triples
 stats:hrs
 stats:avg'
);

