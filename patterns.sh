#!/bin/bash

input1="input7.txt"

if [[ ! -f "$input1" ]]; then
    echo "Input file not found."
    exit 1
fi

vowel_var="aeiou"
consonant_var="bcdfghjklmnpqrstvwxyz"

words=$(tr -sc '[:alpha:]' '[\n*]' < "$input1")

echo "$words" | grep -Ei "^[$vowel_var]+$" > vowels.txt

echo "$words" | grep -Ei "^[$consonant_var]+$" > consonants.txt

echo "$words" | grep -Ei "^[$consonant_var]" | grep -Ei "[$vowel_var]" | grep -Ei "[$consonant_var]" > mixed.txt

echo "Processing complete. Output have been saved to vowels.txt, consonants.txt, and mixed.txt."
