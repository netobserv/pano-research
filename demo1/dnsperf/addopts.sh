#!/bin/bash

INFILE="base-list"
OUTFILE="dns-entry-list"
LINES=$(cat $INFILE)
COUNT=0
cat /dev/null > $OUTFILE

cat $INFILE | while read line
do
	if [ $COUNT = 0 ]
	then
		echo $line " A" >> $OUTFILE
		COUNT=1
	else
		echo $line " AAAA" >> $OUTFILE
		COUNT=0
	fi
done
