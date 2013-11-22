#!/usr/bin/env /usr/bin/python

import sys
import re
sys.path.append('.')
 
data_pattern = r"(\w+)\s+(\d+)\s+(\d+:\d+:\d+)\s+(\w+\W*\w*)\s+(.*?\:)\s+(.*$)"
regex_obj = re.compile(data_pattern, re.VERBOSE)

# filepath = os.environ["Data/*/*/*/*"]
# filename = os.path.split(filepath)[-1]


#--- get all lines from stdin ---
for strLineRead in sys.stdin:

    #--- remove leading and trailing whitespace---
    strLineRead = strLineRead.strip()

    #--- split the line into fields ---
    parsed_log = ""
    parsed_log = regex_obj.search(strLineRead)

    if parsed_log:
 	#--- output key-value pair---
        print '%s\t%s' % (parsed_log.group(1) + "-" + parsed_log.group(5), "1")


	#print "month_name:	 ", parsed_log.group(1)
	#print "day:		 ", parsed_log.group(2)
	#print "time:      	 ", parsed_log.group(3)
	#print "node:      	 ", parsed_log.group(4)
	#print "event:      	 ", parsed_log.group(5)
	#print "message:      	 ", parsed_log.group(6)

