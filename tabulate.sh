#!/bin/bash

for ((i=1; i<=13; i++)); do

	j=$(printf "%0*d\n" 2 ${i})

	cut -f $i just-votes.tsv | sort -g | uniq -c > just-votes.summary.$j.tsv

done
