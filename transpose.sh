#!/bin/bash

file="survey.tsv"

columns=$(head -n 1 ${file} | tr '\t' '\n' | wc -l | tr -d '\n')

for ((i=1; i<=${columns}; i+=1)); do
	cut -f ${i} ${file} | tr '\n' '\t' | sed 's,\t$,\n,'
done
