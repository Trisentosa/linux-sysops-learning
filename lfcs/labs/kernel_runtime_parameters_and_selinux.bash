# 1. Find the SELinux labels of sshd process running on this system. Save its value in the /home/bob/sshd file.

ps -eZ | grep sshd
echo "system_u:system_r:sshd_t:s0-s0:c0.c1023" > /home/bob/sshd

# 2. Turn on kernel.modules_disabled kernel runtime parameter, so that loading new kernel modules will be disabled.
sysctl -w kernel.modules_disabled=1

# 3. Check out the SELinux label for the file stored at /bin/sudo. Ignore the SELinux user and role here.
# What is the SELinux type used on this file? Save its value in /home/bob/selabel file.
ls -Z /bin/sudo
echo "sudo_exec_t" > /home/bob/selabe

# 4. Use the sysctl command to make sure this kernel runtime parameter is actively enabling its settings
# net.ipv6.conf.lo.seg6_enabled
sysctl -w net.ipv6.conf.lo.seg6_enabled=1

# 5. Adjust the value of this kernel runtime parameter, vm.swappiness, to 10.
# After you set this to 10, also make the change persistent so that it will be auto-set to this value on the next reboot.

sudo vim /etc/sysctl.d/swap-less.conf # add vm.swappiness=10
sudo sysctl -p /etc/sysctl.d/swap-less.conf # apply the change

# 6. Change the SELinux context of /var/index.html file to httpd_sys_content_t
sudo semanage fcontext --add --type httpd_sys_content_t /var/index.html
sudo restorecon /var/index.html

# 7. Temporarily change the SELinux status to Permissive on this system.
setenforce 0
getenforce # check

# 8. Identify the SELinux Roles for staff_u SELinux user and save the value(s) in /home/bob/serole file.
semanage user -l | grep "staff_u"
echo "staff_r sysadm_r" > /home/bob/serole

# 9. The SELinux labels for the files in /var/log are wrong. 
# Restore the correct (default) labels for every file and subdirectory in the /var/log directory. You only need to fix the SELinux type labels (user and role can be left as they are).
restorecon -R /var/log/
