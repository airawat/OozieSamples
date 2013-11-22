#!/bin/bash -e
echo "NumberOfLines=`hadoop fs -cat $1 | wc -l`"
