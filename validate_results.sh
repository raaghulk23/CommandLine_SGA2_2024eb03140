#!/bin/bash

min_pass_mark=33
failed_one_subject_count=0
passed_all_subjects_count=0

echo "*** Students who failed in one subject ***"

while IFS=',' read -r rollno name marks1 marks2 marks3; do
    if [[ "$rollno" == "RollNo" ]]; then
        continue
    fi
    failed_count=0
    if (( marks1 < min_pass_mark )); then
        ((failed_count++))
    fi
    if (( marks2 < min_pass_mark )); then
        ((failed_count++))
    fi
    if (( marks3 < min_pass_mark )); then
        ((failed_count++))
    fi
    if (( failed_count == 1 )); then
        echo "Roll No: $rollno, Name: $name"
        ((failed_one_subject_count++))
    fi
done < marks.txt

echo -e "\n*** Students who passed in all subjects ***"

while IFS=',' read -r rollno name marks1 marks2 marks3; do
    if [[ "$rollno" == "RollNo" ]]; then
        continue
    fi
    if (( marks1 >= min_pass_mark )) && (( marks2 >= min_pass_mark )) && (( marks3 >= min_pass_mark )); then
        echo "Roll No: $rollno, Name: $name"
        ((passed_all_subjects_count++))
    fi
done < marks.txt

echo -e "\nNumber of students who failed in exactly one subject: $failed_one_subject_count"
echo "Number of students who passed in all subjects: $passed_all_subjects_count"