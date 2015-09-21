#!/bin/bash

tail -n +3 transposed.tsv | cut -f 3- | head -n -2 > just-votes.tsv
