use default;
drop table eventsgranularreport;

CREATE TABLE IF NOT EXISTS eventsgranularreport(
     year int,
     month int,
     day int,
     event STRING,
     occurrence int)
ROW FORMAT DELIMITED 
   FIELDS TERMINATED by ','
LINES TERMINATED by '\n';

INSERT OVERWRITE TABLE eventsgranularreport
select Year,Month,Day,Event,Count(*) Occurrence from SysLogEvents group by year,month,day,event order by event asc,year,month,day desc;

