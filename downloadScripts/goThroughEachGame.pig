records = LOAD '$input' using PigStorage(',');
info = FILTER records BY $0 == 'info';
visi = FILTER info BY $1 == 'visteam';
home = FILTER info BY $1 == 'hometeam';
visiWithGame = FOREACH visi GENERATE '$gameId' as id, (chararray) $2 as visitor;
homeWithGame = FOREACH home GENERATE '$gameId' as id, (chararray) $2 as homer;
j = JOIN visiWithGame by id, homeWithGame by id;
finalGame = FOREACH j GENERATE visiWithGame::id as row_key, homeWithGame::homer as home_team, visiWithGame::visitor as away_team;
STORE finalGame INTO 'hbase://games$year' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
'team_data: home_team
 team_data: away_team'
);


plays = FILTER records BY $0 == 'play';

visitPlays = FILTER plays BY $2 == 0;
visitPlaysA = FOREACH visitPlays GENERATE '$gameId' as game, (int) $1 as inning, (chararray)  visiWithGame.visitor as team, (chararray) $3 as playerId, (chararray) $4 as batterCount, (chararray) $5 as pitches, STRSPLIT((chararray) $6, '\\/|\\.', 1000) as splits;
rankedVisitPlays = RANK visitPlaysA;
visitPlaysFinal = FOREACH rankedVisitPlays GENERATE CONCAT((chararray) $0, game) as rkey, game as game, (chararray) $0 as playNum, inning as inning, team as team, playerId as playerId, batterCount as batterCount, pitches as pitches, (chararray) splits.$0 as event;
STORE visitPlaysFinal INTO 'hbase://plays$year' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
'game:game 
 play_num:playNum 
 play_data:inning 
 play_data:team 
 play_data:playerId 
 play_data:batterCount 
 play_data:pitches 
 play_data:event'
);

homePlays = FILTER plays BY $2 == 0;
homePlaysA = FOREACH homePlays GENERATE '$gameId' as game, (int) $1 as inning, (chararray)  homeWithGame.homer as team, (chararray) $3 as playerId, (chararray) $4 as batterCount, (chararray) $5 as pitches, STRSPLIT((chararray) $6, '\\/|\\.', 1000) as splits;
rankedHomePlays = RANK homePlaysA;
homePlaysFinal = FOREACH rankedHomePlays GENERATE CONCAT((chararray) $0, game) as rkey, game as game, (chararray) $0 as playNum, inning as inning, team as team, playerId as playerId, batterCount as batterCount, pitches as pitches, (chararray) splits.$0 as event;
STORE homePlaysFinal INTO 'hbase://plays$year' USING org.apache.pig.backend.hadoop.hbase.HBaseStorage(
'game:game 
 play_num:playNum 
 play_data:inning 
 play_data:team 
 play_data:playerId 
 play_data:batterCount 
 play_data:pitches 
 play_data:event'
);
