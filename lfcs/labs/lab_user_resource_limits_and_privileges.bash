# 1. Which of the following keywords can we use to limit the number of processes a user can run?
nproc

# 2. Modify the security limits file and make sure that the user called trinity can run no more than 30 processes in her session.
# This should be both a hard limit and a soft limit, written in a single line.
vim /etc/security/limits.conf
# add the following line
trinity - nproc 30

# 3. Identify all the security limits currently applied in our user's session and save them in the /home/bob/limits file.
# You can use the redirection to save your command's output in a file: [your-command] > /home/bob/limits
ulimit -a > /home/bob/limits

# 4. Modify the sudoers file in such a way to allow the user called trinity to run any sudo command without needing to provide her password.
sudo visudo /etc/sudoers
# add following line
trinity    ALL=(ALL)   NOPASSWD: ALL

# 5. Modify the sudoers file again. Remove your previous entry for the user called trinity if it still exists.
# Now add a new entry that allows trinity to only run the /usr/bin/mount command with sudo.
sudo visudo /etc/sudoers
# remokve previous line in number 4 and add new line
trinity ALL=(ALL) /usr/bin/mount

# 6. Make changes in security limits file for user stephen so that he can create maximum filesize upto 4 MiB. This should be a hard limit.
vim /etc/security/limits.conf
# add following line
stephen hard fsize 4096

# 7. Set a soft limit of 20 processes for everyone in the salesteam group.
vim /etc/security/limits.conf
# add following line
@salesteam soft nproc 20

# 8. Define a policy for all the users in the salesteam group to run any sudo command.
sudo visudo /etc/sudoers
# add following line
%salesteam     ALL=(ALL)     ALL

# 9. Define a policy so that user trinity can run sudo commands as the user sam.
sudo visudo /etc/sudoers
# add following line
trinity ALL=(sam) ALL

# 10. Modify the sudoers file again. Remove your previous entry for the user called trinity if it still exists.
# Now add a new entry that allows trinity to run all commands with sudo, but only after entering the password.
sudo visudo /etc/sudoers
# remove previous line in number 5 and add new line
trinity ALL=(ALL) ALL
