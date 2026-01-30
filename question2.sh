#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Atleast 1 argument needed. And Only one argument allowed."
    exit 1
fi

ARG1="$1"

if [ ! -e "$ARG1" ]; then
    echo "Input file does not exist."
    exit 1
fi

if [ ! -r "$ARG1" ]; then
    echo "Unable to open the input file."
    exit 1
fi

total_messages=$(wc -l < "$ARG1")

info_messages=$(grep -c " INFO " "$ARG1")
warning_messages=$(grep -c " WARNING " "$ARG1")
error_messages=$(grep -c " ERROR " "$ARG1")

recent_error=$(grep " ERROR " "$ARG1" | tail -n 1)

if [ -z "$recent_error" ]; then
    recent_error="No ERROR messages found."
fi

echo "Details of the input log file: $ARG1"
echo "-----------------------------"
echo "Total number of logs: $total_messages"
echo "Number of INFO messages: $info_messages"
echo "Number of WARNING messages: $warning_messages"
echo "Number of ERROR messages: $error_messages"
echo "Most recent ERROR message: $recent_messages"

report_date=$(date +%Y-%m-%d)
report_file="logsummary_${report_date}.txt"

{
    echo "Log Summary on - $report_date"
    echo "Log file: $ARG1"
    echo "-----------------------------"
    echo "Total log entries: $total_messages"
    echo "INFO messages: $info_messages"
    echo "WARNING messages: $warning_messages"
    echo "ERROR messages: $error_messages"
    echo "Most recent ERROR: $recent_error"
} > "$report_file"

echo "Report generated: $report_file"
