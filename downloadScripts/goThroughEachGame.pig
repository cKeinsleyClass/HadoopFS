records = LOAD '$input' using PigStorage(',');
info = FILTER records BY $0 == 'info';
visi = FILTER info BY $1 == 'visteam';
home = FILTER info BY $1 == 'hometeam';
visiWithGame = FOREACH visi GENERATE '$gameId' as id, $2 as visitor;
homeWithGame = FOREACH home GENERATE '$gameId' as id, $2 as homer;
j = JOIN visiWithGame by id, homeWithGame by id;
--put j in Game table in HBase

plays = FILTER records BY $0 == 'play';
visitPlays = FILTER plays BY $2 == 0;
homePlays = FILTER plays BY $2 == 1;
visitPlaysA = FOREACH visitPlays GENERATE '$gameId' as game, $1 as inning, visiWithGame.visitor as team, $3 as playerId, $4 as batterCount, $5 as pitches, STRSPLIT((chararray) $6, '\|.', 1000) as splits;
