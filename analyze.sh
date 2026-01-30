#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Atleast 1 argument needed. And Only one argument allowed."
    exit 1
fi

ARG1="$1"

if [ ! -e "$ARG1" ]; then
    echo "Path does not exist."
    exit 1
fi

if [ -f "$ARG1" ]; then
    echo "Details of file: $ARG1"
    wc -l -w -c "$ARG1"

elif [ -d "$ARG1" ]; then
    echo "Details of directory: $ARG1"

    total_files=$(find "$ARG1" -maxdepth 1 -type f | wc -l)

    txt_files=$(find "$ARG1" -maxdepth 1 -type f -name "*.txt" | wc -l)

    echo "Total files: $total_files"
    echo "Total .txt files: $txt_files"

else
    echo "Error: Unsupported file type."
    exit 1
fi

