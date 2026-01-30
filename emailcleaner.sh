#!/bin/bash

input1="emails.txt"
output1="valid.txt"
output2="invalid.txt"

if [ ! -f "$input1" ]; then
    echo "Error: $input1 not found."
    exit 1
fi

grep -oE '[[:alnum:]]+@[[:alpha:]]+\.com' "$input1" | sort | uniq > "$output1"

grep -vE '^[[:alnum:]]+@[[:alpha:]]+\.com$' "$input1" > "$output2"

echo "Processing complete."
echo "Valid emails saved to $output1"
echo "Invalid entries saved to $output2"