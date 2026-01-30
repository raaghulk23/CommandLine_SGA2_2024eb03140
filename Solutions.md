Below contains the details of the solutions for all the questions in SGA2.

### Question 1:
Create a shell script named analyze.sh that accepts exactly ONE command-line argument. • If the argument is a file: – Display the number of lines, words, and characters in the file. • If the argument is a directory: – Display the total number of files present. – Display the number of .txt files in the directory. • If the argument count is invalid or the path does not exist: – Display an appropriate error message.
#### Output:
Question1_output.png

### Question 2:
You are given a log file containing entries in the format:
YYYY-MM-DD HH:MM:SS LEVEL MESSAGE
#### Example:
2025-01-12 10:15:22 INFO System started
2025-01-12 10:16:01 ERROR Disk not found
2025-01-12 10:16:45 WARNING High memory usage
2025-01-12 10:17:10 ERROR Network timeout
#### Requirements:
1. The script must accept the log file name as a command-line argument.
2. Validate that the file exists and is readable.
3. Count and display:
  - Total number of log entries
  - Number of INFO, WARNING, and ERROR messages
4. Display the most recent ERROR message.
5. Generate a report file named logsummary_<date>.txt.
6. Handle errors gracefully with meaningful messages.
#### Output:
Question2_output.png
logsummary_2026-01-29.txt

### Question 3:
Write a shell script validate_results.sh that reads student data from marks.txt.Each line contains:RollNo, Name, Marks1,Marks2,Marks3Your script should: • Print students who failed in exactly ONE subject • Print students who passed in ALL subjects • Print the count of students in each categoryPassing marks for each subject is 33.Use loops, conditionals, and arithmetic operations.
#### Output:
Question3_output.png

### Question 4:
Create a shell script emailcleaner.sh that processes emails.txt. • Extract all valid email addresses and store them in valid.txt • Extract invalid email addresses and store them in invalid.txt • Remove duplicate entries from valid.txtValid email format:<letters_and_digits>@<letters>.comUse grep, sort, uniq, and redirection.
#### Output:
Question4_output.png

### Question 5:
Create a shell script sync.sh to compare two directories dirA and dirB.Your script should: • List files present only in dirA • List files present only in dirB • For files with the same name in both directories, check whether their contents matchDo NOT copy or modify files.Use diff, cmp, or checksum techniques.
#### Output:
Question5_output.png

### Question 6:
Create a shell script metrics.sh that analyzes a text file input.txt.The script should display: • Longest word • Shortest word • Average word length • Total number of unique wordsUse pipes and commands such as tr, sort, uniq, wc.
#### Output:
Question6_output.png

### Question 7:
Write a shell script patterns.sh that reads a text file and: • Writes words containing ONLY vowels into vowels.txt • Writes words containing ONLY consonants into consonants.txt • Writes words containing both vowels and consonants but starting with a consonant into mixed.txt, Case should be ignored while checking patterns.
#### Output:
Question7_output.png
vowels.txt
consonants.txt
mixed.txt

### Question 8:
Create a shell script bg_move.sh that accepts a directory path. • Move each file in the directory into a subdirectory named backup/ • Perform each move operation in the background • Display the PID of each background process • Wait for all background processes to finishUse &, wait, $$, and $! variables.
#### Output:
Question8_output.png

### Question 9:
Write a C program to demonstrate zombie process prevention. • Create multiple child processes • Ensure terminated child processes do not remain zombies • Parent process should print the PID of each child it cleans upUse fork(), wait(), or waitpid().
#### Output:
Question9_output.png

### Question 10:
Write a C program demonstrating signal handling. • Parent process runs indefinitely • Child process sends SIGTERM after 5 seconds • Another child sends SIGINT after 10 seconds • Parent handles each signal differently and exits gracefully
#### Output:
Question10_output.png