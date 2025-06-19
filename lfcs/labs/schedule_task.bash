# 1. per cron given below
# 0 3 15 * * /usr/bin/touch test_passed
# when will command run?

# answer: 15th of each month, at 3 AM

# 2. We're logged in as the user called alex. How do we see the crontab for theroot user?
sudo crontab -l

# 3. Which file can we analyze to check if anacron jobs have run successfully?
/var/log/cron

# 4. How can we force anacron to rerun all jobs, regardless of when they were last executed?
sudo anacron -n -f 
# where -f is force and -n is run in foreground

# 5. What is the command to see the jobs that are scheduled to run in at utility?
# Using the correct command, identify the currently scheduled jobs under user bob and save the command output in the /home/bob/at_jobs.txt file.
atq > /home/bob/at_jobs.txt

# 6. remove all bob's jobs
atq
atrm 3

# 7. /usr/bin/touch test_passed
# add this command and make it run every day at 21:30

crontab -e # add this line
30 21 * * * /usr/bin/touch test_passed

# 8. Add an anacron job with the following specifications:
# A. It should run once every 10 days.
# B. It should have 5 minutes of delay.
# C. The job id should be db_cleanup.
# D. The command to run is /usr/bin/touch /root/anacron_created_this.`

sudo vim /etc/anacrontab # add this line
10 5 db_cleanup /usr/bin/touch /root/anacron_created_this

# 9. Using the root user, schedule the below command to run at 15:30 August 20 2054 by using at utility:
# /usr/bin/touch atscheduler
at '15:30 August 20 2054'

# 10. Using crontab utility, add a cron for user root to run the below command:
# /usr/bin/touch monthly
# Make it run at 12:00AM on the 1st of every month.

# syntax: 0 0 1 * * /usr/bin/touch monthly

# 11. Using crontab utility, add a cron for user root to run the below command:
# /usr/bin/touch weekly
# Make it run at 11:00AM on every Sunday.

# syntax: 0 11 * * 0 /usr/bin/touch weekly

# 12: Add a cron for the user bob to execute the sudo systemctl restart nginx command on Sundays every week at 6am and 11pm.
0 6,23 * * 0 sudo systemctl restart nginx