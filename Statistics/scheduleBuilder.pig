REGISTER 'hdfs:///user/root/PlayBall/jar/PlayBallPig-0.0.1-SNAPSHOT.jar';
records = LOAD '/user/root/PlayBall/GameLogs/GL$year.TXT' USING PigStorage(',');

minHomeRecords = FOREACH records GENERATE CONCAT(edu.rosehulman.gilmordw.TrimQuotes($6), edu.rosehulman.gilmordw.TrimQuotes($0)), edu.rosehulman.gilmordw.TrimQuotes($3), $10, $9, 'Y';
minVisitingRecords = FOREACH records GENERATE CONCAT(edu.rosehulman.gilmordw.TrimQuotes($3), edu.rosehulman.gilmordw.TrimQuotes($0)), edu.rosehulman.gilmordw.TrimQuotes($6), $9, $10, 'N';
teamRecords = UNION minHomeRecords, minVisitingRecords;

STORE final INTO 'hbase://teamschedule$year' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
'sched:opposing
 sched:score
 sched:op_score
 sched:home'
);

