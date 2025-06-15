# 1. Schedule this system to power off two hours later from now.
sudo shutdown +120

# 2. The system is currently booting to a text-only console. Change it to boot to a graphical desktop by default.
systemctl set-default graphical.target

# 3. Cancel the scheduled shutdown you configured in the beginning.
shutdown -c

# 4. How do we run script.sh that is located in our current directory?
./script.sh

# 5. What is the correct shebang to add in a script?
#!/bin/bash

# 6. Under bob's home: Create a script called script.sh. 
# This script should create a tar archive called archive.tar.gz. 
# The script should archive the directory called dir1.

# script.sh
    #!/bin/bash
    tar --create --gzip --file archive.tar.gz dir

./script.sh

# 7. There is a service unit that automatically starts up the SSH daemon. Use the correct command to find out the PID assigned to the process launched by this service.
systemctl status ssh.service # found it is 1400
echo 1400 > /home/bob/pid

# 8. Create script2.sh script that displays if the sshd.service unit is enabled or disabled.
# script2.sh
    #!/bin/bash
    systemctl is-enabled sshd.service
./script2.sh

# 9. Create a script /home/bob/perm.sh. 
# This script should set permissions on the /home/bob/dir8 directory so that the user owner only has x (execute) permissions; 
# the group owner and others must not have any permissions at all.
# perm.sh
    #!/bin/bash
    chmod 100 /home/bob/dir8
./perm.sh

# 10. We already have a script named script10.sh under /home/bob/. Make sure this script runs without any errors to display the appropriate output.
# just fixed some typo here

# 11. Copy the output of the sshd.service status to /home/bob/service.txt
systemctl status sshd.service > /home/bob/service.txt

# 12. apache2 is already installed; mask its service.
systemctl mask apache2.service

# 13. unmask apache2.service
systemctl unmask apache2.service

# 14. 
# Take a look at the Systemd service called kkloud.service. Find where this file is located, and edit it to correct three mistakes.
# Currently, the process managed by this service is only restarted when it fails. Set it to always restart, regardless of the reason why it stopped.
# Also, this service file does not include instructions about what command to run when it wants to stop this process. Add another line to instruct that the correct command to stop this process is kkloud --savedata. path to command is /usr/local/bin/kkloud
# Finally, this service should start after the sshd.service. Locate the correct line you need to fix and edit it accordingly.

systemctl cat kkloud.service # located in /etc/systemd/system/kkloud.service

# Edit the file:
# 1. change Restart=no to Restart=always
# 2. add ExecStop=/usr/local/bin/kkloud --savedata
# 3. change After=network.target to After=network.target sshd.service