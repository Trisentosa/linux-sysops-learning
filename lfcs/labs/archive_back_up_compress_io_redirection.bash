# 1. Create a tar archive logs.tar (under bob's home) of the/var/log/ directory
tar --create --file /home/bob/logs.tar /var/log

# 2. Create a compressed tar archive logs.tar.gz (under bob's home) of the /var/log/ directory
tar --create --gz --file /home/bob/logs.tar.gz /var/log/

# 3. List the content of the /home/bob/logs.tar archive and save the output in the /home/bob/tar_data.txt file.
tar --list --file /home/bob/logs.tar > /home/bob/tar_data.txt

# 4. Extract the contents of /home/bob/archive.tar.gz to the /tmp directory.
tar --extract --file /home/bob/archive.tar.gz --directory /tmp/

# 5. Execute the /home/bob/script.sh script and save all normal output (except errors/warnings) in the /home/bob/output_stdout.txt file.
./script.sh 1> /home/bob/output_stdout.txt

# 6. Execute the /home/bob/script.sh script and save all command output (both errors/warnings and normal output) in the /home/bob/output.txt file.
./script.sh 1> /home/bob/output.txt 2>&1

# 7. Execute the /home/bob/script.sh script and save all errors only in the /home/bob/output_errors.txt file.
./script.sh 2> /home/bob/output_errors.txt

# 8. Create a bzip archive under bob's home named file.txt.bz2 out of /home/bob/file.txt, 
# but preserve the original file. At the end of the exercise, you should have both.
tar --create --bzip2 --keep-old-files --file /home/bob/file.txt.bz2 /home/bob/file.txt

# or
bzip2 --keep /home/bob/file.txt

# 9. Extract the contents of /home/bob/archive.tar.gz to the /opt directory.
tar --extract --file /home/bob/archive.tar.gz --directory /opt/

# 10. Use the cat command, and redirection, to add (append) the contents of /home/bob/file.txt to /home/bob/destination.txt.
cat /home/bob/file.txt >> /home/bob/destination.txt

# 11. Create a file.tar archive of the /home/bob/file directory under the /home/bob location.
tar --create --file file.tar file/

# 12. Create the gzip archive of the games.txt file , which is present under the /home/bob directory.
gzip games.txt

# 13. We have a /home/bob/lfcs.txt.xz file; uncompress it under /home/bob/.
xz --decompress lfcs.txt.xz

# 14. Sort the contents of the /home/bob/values.conf file alphabetically and eliminate any common values. Save the sorted output in the /home/bob/values.sort file.
cat /home/bob/values.conf | sort| uniq > /home/bob/values.sort

# or
sort -du /home/bob/values.conf > /home/bob/values.sorted

# 15. Sort again the contents of the /home/bob/values.conf file alphabetically. 
# Eliminate any common values and ignore case.
# Finally, save the sorted output in the/home/bob/values.sorted file.

sort -duf /home/bob/values.conf > /home/bob/values.sorted