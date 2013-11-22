#!/usr/bin/env /usr/bin/python

import sys
sys.path.append('.')
 
eventCountArray = {}
 
# Input is from STDIN
for line in sys.stdin:
    # Remove leading and trailing whitespace
    line = line.strip()
 
    # Parse the input from the mapper
    event, count = line.split('\t', 1)
    
    # Cast count to int
    try:
        count = int(count)
    except ValueError:
        continue

    # Compute event count
    try:
        eventCountArray[event] = eventCountArray[event]+count
    except:
        eventCountArray[event] = count
 
# Write the results (unsorted) to stdout
for event in eventCountArray.keys():
    print '%s\t%s'% ( event, eventCountArray[event] )

