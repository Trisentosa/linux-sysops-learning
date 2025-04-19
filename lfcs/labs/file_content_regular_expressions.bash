# 1. Which of the following commands can be used to manipulate strings in a file?
# answer: sed

# 2. Which of the following commands can be to display the first 5 lines in a file?
# answer: head -5 myfile

# 3. Which of the following commands can you use to filter out the lines that contain a particular pattern?
# answer: grep

# 4. How can we ignore the case (small or capital) differences while comparing two files using the diff command?
# answer: diff -i

# 5. You have the following content in /home/bob/testfile (this is just an example file):
#
# testfile
# a;b;c;d
# x;y;z
#
#How would you extract/print the b and the y?

cut -d ';' -f 2 cut_test_file

# 6. Change all values enabled to disabled in the /home/bob/values.conf config file.
sed -i 's/enabled/disabled/g' /home/bob/values.conf 

# 7. Change all values disabled to enabled in the /home/bob/values.conf config file, ignoring the case sensitivity.
# For example, any string like disabled, DISABLED, Disabled, etc., must match and should be replaced with enabled.
sed 's/disabled/enabled/Ig' /home/bob/values.conf > /tmp/values.conf # will use to compare preview first
diff -y /home/bob/values.conf /tmp/values/conf 

sed -i 's/disabled/enabled/Ig' /home/bob/values.conf

# 8. Change all values enabled to disabled in the /home/bob/values.conf config file from line number 500 to 2000.
sed -i '500,2000 s/enabled/disabled/g' /home/bob/values.conf 

# 9. Replace all occurrences of string #%$2jh//238720//31223 with $2//23872031223 in the /home/bob/data.txt file.
sed -i 's~#%$2jh//238720//31223~$2//23872031223~g' /home/bob/data.txt

# 10. Filter out the lines that contain any word that starts with a capital letter and are then followed by exactly two lowercase letters 
# in /etc/nsswitch.conf file and save the output in /home/bob/filtered1 file.
# You can use the redirection to save your command's output in a file: [your-command] > /home/bob/filtered1
egrep -w '[A-Z][a-z]{2}' /etc/nsswitch.conf  > /home/bob/filtered1

# 11. Open the /home/bob/testfile file in any editor (vi, nano etc) and move the line present on line no:1049 to line no: 5
# use vim, :<line-number> to go to that line, d to cut, p to paste

# 12. /home/bob/file1 and /home/bob/file2 are 99% identical. But there's 1 unique line that exists only in /home/bob/file1 or in /home/bob/file2.
# Find that line and save the same in the /home/bob/file3 file.
diff /home/bob/file1 /home/bob/file2 > /home/bob/file3

# 13. In the /home/bob/textfile file, there's a number that has 5 digits. Save the number in the /home/bob/number file.
# You can use the redirection to save your command's output in a file i.e [your-command] > /home/bob/number
egrep '[0-9]{5}' /home/bob/textfile > /home/bob/number

# 14. How many numbers in /home/bob/textfile begin with the number 2. Save the count in the /home/bob/count file.
# You can use the redirection to save your command's output in a file: [your-command] > /home/bob/count
egrep -w '[2]+[0-9]*' /home/bob/textfile | wc -l >/home/bob/count
# solution from kodekcloud
grep -c '^2' textfile > /home/bob/count

# 15. How many lines in the /home/bob/testfile file begin with string "Section", regardless of case.
# Save the count in the /home/bob/count_lines file.
egrep -ci "^section" /home/bob/testfile > /home/bob/count_lines

# Find all lines in the/home/bob/testfile file that contain string man; it must be an exact match.
# For example, the line like "# before /usr/man or NOCACHE keeps man" should match but "# given manpath for For a manpath must not match."
# Save the filtered lines in the /home/bob/man_filtered file
grep -w "man" /home/bob/testfile > /home/bob/man_filtered

# Save the last 500 lines of the /home/bob/textfile file in the /home/bob/last file.
tail -n 500 /home/bob/textfile  > /home/bob/last