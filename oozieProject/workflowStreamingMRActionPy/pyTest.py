import re
import sys

sample_log_line = "May  3 11:52:54 cdh-dn03 init: tty (/dev/tty2) main process (1194) killed by TERM signal"

data_pattern = r"(\w+)\s+(\d+)\s+(\d+:\d+:\d+)\s+(\w+\W*\w*)\s+(.*?\:)\s+(.*$)"

regex_obj = re.compile(data_pattern, re.VERBOSE)

parsed_log = regex_obj.search(sample_log_line)

if parsed_log:
	print "month_name:	 ", parsed_log.group(1)
	print "day:		 ", parsed_log.group(2)
	print "time:      	 ", parsed_log.group(3)
	print "node:      	 ", parsed_log.group(4)
	print "event:      	 ", parsed_log.group(5)
	print "message:      	 ", parsed_log.group(6)

else:
	print "Could not parse"
