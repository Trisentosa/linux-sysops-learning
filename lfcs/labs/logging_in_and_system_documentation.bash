# 1. The ssh command has an option to display its version number. Use man to find out what is the correct command line option.
ssh -V

# 2. Find out using which command you can change the static hostname of your Linux system?
man -k hostname -s 1,8 # finds that hostnamectl (1) can be use to control system hostname

# 3. If the apropos command does not work because your manual pages are not indexed, what command can you use to manually refresh these?

# 4. You are trying to use ssh alex@localhost to log in through SSH. 
# Your connection is refused. ssh has a command line option to show you the verbose output. 
# That will show a lot more status messages and help you debug why this connection is failing. What is the correct option for that? (you need not make ssh connection work at this point)
man ssh # use /verbose, and find that -v option to enable verbose

# 5. You type host in the terminal. What keys do you press to see some suggestions about what you can type here?
# answer: tab+tab

# 6. Which section of the manual pages deals with System administration commands?
man man # from description, answer is section 8

# 7. How many hidden files are there in the /home/bob/data/ directory?
ls -la /home/bob/data # shows 2 hidden files

# 8. SSH into node01 host from ubuntu-host and create a blank file called /home/bob/myfile in node01 host.
# You should be able to create the file using touch /home/bob/myfile command.
# Please find below the SSH credentials for node01 host:
# Host: node01
# Username: bob
# Password: caleston123
# Remember to type exit when you finish this task.
ssh node01
touch /home/bob/myfile
exit

# 9. We are trying to run the apropos ssh command to get some details about the commands related to ssh, but we are getting this error:
# `ssh: nothing appropriate`
sudo mandb # update man index cache, fixed the issue

# 10. Using the apropos command, find out the configuration file for NFS mounts and save its name in the /home/bob/nfs file.
man -k "NFS mounts" # the output shown as below
# nfsmount.conf (5)    - Configuration file for NFS mounts
vim /home/bob/nfs # open and type nfsmount.conf, save


















