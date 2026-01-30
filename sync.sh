#!/bin/bash

if [ "$#" -ne 2 ]; then
    echo "Usage: $0 dir1 dir2"
    exit 1
fi

dir1=$1
dir2=$2

echo "--- files only in $dir1 ---"
comm -23 <(ls "$dir1" | sort) <(ls "$dir2" | sort)

echo -e "\n--- files only in $dir2 ---"
comm -13 <(ls "$dir1" | sort) <(ls "$dir2" | sort)

echo -e "\n--- Common files and the data comparison ---"
common_files=$(comm -12 <(ls "$dir1" | sort) <(ls "$dir2" | sort))

for file in $common_files; do
    if [[ -f "$dir1/$file" && -f "$dir2/$file" ]]; then
        if cmp -s "$dir1/$file" "$dir2/$file"; then
            echo "[MATCH] $file"
        else
            echo "[DIFF ] $file"
        fi
    fi
done
