#!/bin/bash

hadoop fs -rm -R user/akhanolk/oozieProject/results-sshAction/*
hadoop fs -put home/akhanolk/data/* user/akhanolk/oozieProject/results-sshAction/

