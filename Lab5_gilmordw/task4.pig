records = LOAD '$input' using PigStorage('\t') AS (date, time, location, bytes, ip, method, csHost, uriStem:chararray, sc-status, csReferer, csUserAgent, csuriquery, csCookie, resType:chararray, xedgerequestid);
rrecords = FOREACH records GENERATE date, time, uriStem, resType;
frecords = FILTER rrecords BY STARTSWITH(uriStem, '/blogs');
blogrecords = FOREACH frecords GENERATE date, time, SUBSTRING(uriStem, 7, INDEXOF(uriStem, '/', 7)) AS blog, resType;
hitblogrecords = FILTER blogrecords BY resType = "Hit";
errorblogreocrds = FILTER blogrecords BY resType = "Error";
gblogs = GROUP blogrecords BY blog;
temp = FOREACH gblogs GENERATE group, COUNT(hitblogrecords)/COUNT(blogrecords), COUNT(errorblogreocrds)/COUNT(blogrecords);
STORE temp into '$output' using PigStorage(',');  