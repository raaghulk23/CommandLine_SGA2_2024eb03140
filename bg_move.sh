#!/bin/bash

if [ -z "$1" ]; then
    echo "No arguments passed"
    exit 1
fi

input1="$1"
output="$input1/backup"

mkdir -p "$output"

echo "PID ($$): Moving files in $input1 to $output"

for file in "$input1"/*; do
    if [ -f "$file" ]; then
        mv "$file" "$output/" &
        echo "Moving file $(basename "$file") with PID: $!"
    fi
done

wait
echo "Processing complete."
