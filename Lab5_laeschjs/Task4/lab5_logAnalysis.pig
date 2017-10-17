REGISTER 'hdfs:///tmp/input/laeschjs/Lab5_task4-0.0.1-SNAPSHOT.jar';
DEFINE ratio edu.rosehulman.laeschjs.Ratio();
DEFINE getBlogName edu.rosehulman.laeschjs.BlogName();
DEFINE hits edu.rosehulman.laeschjs.Hits();
DEFINE errors edu.rosehulman.laeschjs.Errors();
DEFINE onlyBlogs edu.rosehulman.laeschjs.OnlyBlogs();
%declare MYDATE `date +'%Y-%m-%d'`;
records = LOAD '$input' using PigStorage('\t');
smallrecords = foreach records generate (chararray) $7 as blogs, (chararray) $13 as results;
filtered = FILTER smallrecords BY onlyBlogs(blogs);
all_hits = FILTER filtered by hits(results);
ghits = GROUP all_hits BY getBlogName(blogs);
num_hits = FOREACH ghits GENERATE group, COUNT(all_hits.results) as hit_count;
all_errors = FILTER filtered by errors(results);
gerrors = GROUP all_errors BY getBlogName(blogs);
num_errors = FOREACH gerrors GENERATE group, COUNT(all_errors.results) as err_count;
groupall = GROUP filtered BY getBlogName(blogs);
mytotal = FOREACH groupall GENERATE group, COUNT(filtered.results) as total_count;
combined = JOIN mytotal by group FULL OUTER, num_hits by group;
all_combined = JOIN combined by mytotal::group FULL OUTER, num_errors by group;
outp = FOREACH all_combined GENERATE combined::mytotal::group, ratio(combined::num_hits::hit_count, combined::mytotal::total_count), ratio(num_errors::err_count, combined::mytotal::total_count), GetYear(CurrentTime()), GetMonth(CurrentTime()), GetDay(CurrentTime()), GetHour(CurrentTime());
STORE outp into '$output/$MYDATE' using PigStorage(',');
