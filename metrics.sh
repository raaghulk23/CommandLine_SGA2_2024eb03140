#!/bin/bash

input1="input6.txt"
if [[ ! -f "$input1" ]]; then
    echo "Input file not found."
    exit 1
fi

words=$(tr -sc '[:alnum:]' '[\n*]' < "$input1" | tr '[:upper:]' '[:lower:]')


echo "*** Metrics for $input1 ***"

echo -n "Longest Word: "
echo "$words" | awk '{ print length, $0 }' | sort -n | tail -1 | cut -d' ' -f2-

echo -n "Shortest Word: "
echo "$words" | awk '{ print length, $0 }' | sort -n | head -1 | cut -d' ' -f2-

echo -n "Average Word Length: "
echo "$words" | awk '{ sum += length($0); count++ } END { if (count > 0) printf "%.2f\n", sum / count }'

echo -n "Total Unique Words: "
echo "$words" | sort | uniq | wc -l
