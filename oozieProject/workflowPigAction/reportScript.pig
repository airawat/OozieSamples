rmf oozieProject/workflowPigAction/output

raw_log_DS = 
  -- load the logs into a sequence of one element tuples
  LOAD 'oozieProject/data/*/*/*/*/*' AS line;

parsed_log_DS =
  -- for each line/log parse the same into a 
  -- structure with named fields
  FOREACH raw_log_DS
 	 GENERATE
    		FLATTEN (
      			REGEX_EXTRACT_ALL( 
        				  line, 
        				  '(\\w+)\\s+(\\d+)\\s+(\\d+:\\d+:\\d+)\\s+(\\w+\\W*\\w*)\\s+(.*?\\:)\\s+(.*$)'
     					 )
			)
    AS (
      month_name: chararray,
      day: chararray,
      time: chararray,
      host: chararray,
      process: chararray,
      log: chararray
    );

report_draft_DS = 
	--Generate dataset containing just the data needed
	FOREACH parsed_log_DS GENERATE month_name,process;

grouped_report_DS = 
	--Group the dataset
	GROUP report_draft_DS BY (month_name,process);

aggregate_report_DS = 
	--Compute count
	FOREACH grouped_report_DS {
		GENERATE group.month_name,group.process,COUNT(report_draft_DS) AS frequency;
	}

sorted_DS =
	ORDER aggregate_report_DS by $0,$1;

STORE sorted_DS INTO 'oozieProject/workflowPigAction/output/SortedResults';


