use default;
drop table consolidated_YM_report;

CREATE TABLE IF NOT EXISTS consolidated_YM_report(
     process string,
     node string,
     year int,
     month int,
     occurrence int)
     ROW FORMAT DELIMITED 
     FIELDS TERMINATED by ','
     LINES TERMINATED by '\n';

INSERT OVERWRITE TABLE consolidated_YM_report
select case locate('[',event,1) when 0 then case locate(':',event,1) when 0 then event else substr(event,1,(locate(':',event,1))-1)  end 
else substr(event,1,(locate('[',event,1))-1)  end process,Node,Year,Month,Count(*) Occurrence from SysLogEvents group by node,year,month, case locate('[',event,1) when 0 then case locate(':',event,1) when 0 then event else substr(event,1,(locate(':',event,1))-1)  end else substr(event,1,(locate('[',event,1))-1)  end order by process asc,node asc,year,month;


