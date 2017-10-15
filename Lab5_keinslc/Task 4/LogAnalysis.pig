REGISTER 'hdfs:///tmp/input/keinslc_Lab5.jar';

REGISTER 'Task 4/keinslc_Lab5.jar';
DEFINE cleanBlogName edu.rosehulman.keinslc.CleanBlogName();
DEFINE formatDateTime edu.rosehulman.keinslc.FormatDateTime();

records = LOAD 'sample.gz' USING PigStorage('\t');
condensedRecords = FOREACH records GENERATE $7 as (csUriStream:chararray), $0 as (date:chararray), $1 as (time:chararray), $13 as (xEdgeResultType:chararray);
blogRecords = FOREACH condensedRecords GENERATE csUriStream, CONCAT(CONCAT(date, ' '), time) as date, xEdgeResultType;

--blogRecords = FOREACH condensedRecords GENERATE cleanBlogName(csUriStream) as (blog:chararray), CONCAT(CONCAT(date, ' '), time) as (date:chararray), xEdgeResultType as (xEdgeResultType:chararray);

dateParsed = FOREACH blogRecords GENERATE csUriStream, ToDate(date, 'yyyy-mm-dd HH-mm-ss') as (date_time:DateTime), xEdgeResultType;