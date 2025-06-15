# 1. How can we see all processes running on the system along with their nice values?
ps lax

# 2. How can we see all processes running on the system along with their nice values?
sleep 10

# 3. By default, which directory contains the logs of most of the services running on a Linux system?
/var/log

# 4. Assign a nice value of 9 to the sshd process.
sudo renice -n 9 -p 1475

# 5. 
# List all files that are opened by the process with PID 1; this process is owned by the root user.
# Save the output in the /home/bob/files.txt file.

lsof -p 1 > /home/bob/files.txt

# 6. 
# Search the logs for entries related to the SSH daemon. Find out what IP address last connected to this daemon successfully.
# Save that IP in the /home/bob/ip.txt file.
journalctl -u ssh.service 

# official solution: journalctl -u ssh.service -n 20 --no-pager

# 7. Identify the PID of the process named rpcbind and save its value in the /home/bob/pid.txt file.
pgrep rpcbind > /home/bob/pid.txt

# 8. With the systemctl command, find out the PID of the process currently managed by the ssh.service. Send the SIGHUP signal to this process.
systemctl status ssh.service # found MAIN pid is 1475
kill -1 1475

# 9. Under the /var/log directory, search for all files containing the reboot string and save the search result in the /home/bob/reboot.log file.
grep -r "reboot" /var/log > /home/bob/reboot.log

# 10. Analyze the error logs through journalctl with the priority flag and copy the output to /home/bob/.priority/priority.log
journalctl -p err > /home/bob/.priority/priority.log

# 11. Analyze the info priority logs through journalctl that begin with letter c and store the output in the /home/bob/.priority/boot.log file.

journalctl -p info -g "^c" > .priority/boot.log

# 12. Using the ps command, identify the CPU and Memory usage by only the process having PID 1 and save the entire command output in the /home/bob/resources.txt file.

ps u 1

# 13. Run a command to sleep for 3000 seconds and make sure it is running in the background.

sleep 3000 &