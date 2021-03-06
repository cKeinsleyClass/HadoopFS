REGISTER 'hdfs:///tmp/lab5/jar/gilmordwlab5-0.0.1-SNAPSHOT.jar';
%declare date `date +%F`;
records = LOAD '$input' using PigStorage('\t') AS (date, time, location, bytes, ip, method, csHost, uriStem:chararray, scstatus, csReferer, csUserAgent, csuriquery, csCookie, resType:chararray, xedgerequestid);
rrecords = FOREACH records GENERATE uriStem, resType;
frecords = FILTER rrecords BY STARTSWITH(uriStem, '/blogs');
blogrecords = FOREACH frecords GENERATE SUBSTRING(uriStem, 7, INDEXOF(uriStem, '/', 7)) AS blog, resType;
hitblogrecords = FILTER blogrecords BY resType == 'Hit';
errorblogreocrds = FILTER blogrecords BY resType == 'Error';
gblogs = GROUP blogrecords BY blog;
ghits = GROUP hitblogrecords BY blog;
gerrors = GROUP errorblogreocrds BY blog;
countblogs = FOREACH gblogs GENERATE group AS blog, COUNT(blogrecords) AS blogs;
counthits = FOREACH ghits GENERATE group AS blog, COUNT(hitblogrecords) AS hits;
counterrors = FOREACH gerrors GENERATE group AS blog, COUNT(errorblogreocrds) AS errors;
joinhits = JOIN countblogs BY blog FULL OUTER, counthits BY blog;
joinRes = JOIN joinhits BY countblogs::blog FULL OUTER, counterrors BY blog;
temp = FOREACH joinRes GENERATE countblogs::blog, edu.rosehulman.gilmordw.Task4Ratio(hits, blogs), edu.rosehulman.gilmordw.Task4Ratio(errors, blogs), GetYear(CurrentTime()), GetMonth(CurrentTime()), GetDay(CurrentTime()), GetHour(CurrentTime());
STORE temp into '$output/$date' using PigStorage('\t');  