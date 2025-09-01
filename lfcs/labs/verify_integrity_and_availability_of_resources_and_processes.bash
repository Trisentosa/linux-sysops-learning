# 1. Identify what % space of / partition is in use on our system. Save the value in the /home/bob/used file.
# For example, if the used space is 10%, then the file content should be 10%.

df -h /
echo "13%" > /home/bob/used

# 2. Figure out how much storage space the /bin/ directory is using and save the value in the /home/bob/bin file.
du -sh /bin/
echo "106M" > /home/bob/bin

# 3. Use the correct command to check out the memory on this system (in megabytes). In /home/bob/memory file, save the total amount of RAM that this system has.
# For example, if you see 512 in the command's output, the file contents should be 512

free --mega
echo "1003" > /home/bob/memory

# 4. Use the correct command to check out how long this system has been up. In the /home/bob/up file, save the time value in hours, minutes, or days (whichever is applicable).
# For example, if you see 1:07 in the command's output, the file content should be 1.
# Similarly, if you see something like 51 min in the command's output, the file content should be 51min (without any space).

uptime
echo "2" > /home/bob/up

# 5. Use the correct command to identify the CPU core(s) per socket on this system. Save its value in the /home/bob/cpu file.

lscpu | grep -i "socket"
echo "1" > /home/bob/cpu

# 6. On /dev/vdb, we have an XFS filesystem.Use the correct command to check this filesystem for errors and save the output in /home/bob/fscheck file.

xfs_repair -n /dev/vdb > /home/bob/fscheck 2>&1