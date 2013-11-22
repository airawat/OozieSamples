use default;
drop table top3_process_by_year_report;

CREATE TABLE IF NOT EXISTS top3_process_by_year_report(
     process string,
     year int,
     occurrence int)
     ROW FORMAT DELIMITED
     FIELDS TERMINATED by ','
     LINES TERMINATED by '\n';

INSERT OVERWRITE TABLE top3_process_by_year_report
select process, year, occurrence from (select case locate('[',event,1) when 0 then case locate(':',event,1) when 0 then event else substr(event,1,(locate(':',event,1))-1)  end else substr(event,1,(locate('[',event,1))-1)  end process,Year,Count(*) Occurrence from SysLogEvents 
group by year,case locate('[',event,1) when 0 then case locate(':',event,1) when 0 then event else substr(event,1,(locate(':',event,1))-1)  end else substr(event,1,(locate('[',event,1))-1)  end order by process asc,year,Occurrence desc) X where process is not null order by occurrence desc limit 3;
