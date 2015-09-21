#!/bin/bash

for ((i=1; i<=13; i++)); do

	j=$(printf "%0*d\n" 2 ${i})
	
	echo -e "Number of votes\tPreference rank" > just-votes.summary.$j.tsv
	cut -f $i just-votes.tsv | sort -g | uniq -c | sed 's,\(\S\)\s\s*\(\S\),\1\t\2,' >> just-votes.summary.$j.tsv

done
