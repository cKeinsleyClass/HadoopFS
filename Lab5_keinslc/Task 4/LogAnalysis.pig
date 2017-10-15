%declare date = CurrentTime();
%declare year = GetYear(date);
%declare month = GetMonth(date);
%declare day = GetDay(date);
%declare file_out '$dir_out/$year-$month-$day'

REGISTER 'hdfs:///tmp/input/keinslc_Lab5.jar';

DEFINE cleanBlogName edu.rosehulman.keinslc.CleanBlogName();
DEFINE getRatios edu.rosehulman.keinslc.CreateRatios();

records = LOAD '$file_in' USING PigStorage('\t') as (a:chararray, b:chararray, c:chararray, d:chararray, e:chararray, f:chararray, g:chararray, h:chararray, i:chararray, j:chararray, k:chararray, l:chararray,m:chararray,n:chararray,o:chararray,p:chararray,q:chararray,r:chararray,s:chararray,t:chararray,u:chararray,v:chararray,w:chararray,x:chararray);
condensedRecords = FOREACH records GENERATE $7 as (csUriStream:chararray), $13 as (xEdgeResultType:chararray);
blogRecords = FOREACH condensedRecords GENERATE cleanBlogName(csUriStream) as blog, xEdgeResultType as type;
filteredBlogRecords = FILTER blogRecords by blog is not null;
groupByBlog = group filteredBlogRecords by (blog, type);
blogGroupsWithSize = FOREACH groupByBlog GENERATE group, SIZE(filteredBlogRecords) as numTimes;
flatBlogs = FOREACH blogGroupsWithSize generate FLATTEN(group), numTimes;
fixedNameFlatBlogs = foreach flatBlogs generate blog as blog, type as type, numTimes as numTimes;
grouped = group fixedNameFlatBlogs by blog;
ratios = foreach grouped generate group, getRatios(fixedNameFlatBlogs) as ratio;
datedRatios = foreach ratios generate group as blog, ratio, CurrentTime() as (date:dateTime);
prepedDatedRatios = foreach datedRatios generate blog, FLATTEN(ratio), GetYear(date) as year, GetMonth(date) as month, GetDay(date) as day, GetHour(date) as hour;

STORE prepedDatedRatios INTO '$file_out' USING PigStorage('\t');