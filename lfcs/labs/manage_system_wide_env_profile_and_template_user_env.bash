# 1. How can we print the value of an environment variable?
echo $MY_VAR

# 2. Which of the following environment variables holds the value of user's home directory?
$HOME

# 3. Which of the following files can be used to set the globally available environment variables in a Linux-based system?
/etc/environment

# 4. Print our current user's (bob) environment and save the output in the /home/bob/env file.
# You can use the redirection to save your command's output in a file: [your-command] > /home/bob/env
env > /home/bob/env

# 5. Add an environment variable for user bob.
# The variable name should be MYVAR and its value should be TRUE
vim ~/.bashrc
export MYVAR=TRUE # add this line at the end of the file
source ~/.bashrc # apply the change
echo $MYVAR # verify the change

# 6. Whenever we add a new user to the system, some files are copied from a template directory to the user's home directory.
# Manually copy those files into the /home/bob/default_data directory.
sudo cp /etc/skel/.bash* /home/bob/default_data/

# 7. Modify the system-wide environment file and make sure that the variable GLOBALOPTION is set to this value: ON. Otherwise, after you modify that file, any user that logs in and types…
#echo $GLOBALOPTION

sudo vim /etc/environment # add GLOBALOPTION=ON
source /etc/environment # to apply change
echo $GLOBALOPTION # to verify

# 8. Make sure that this command gets executed for any user that logs in to the system:
# echo Welcome to our server!
sudo vim /etc/profile.d/welcome.sh # add this line echo "Welcome to our server!"
logout # logout and login again to verify

# 9. Make sure that every time a new user account is added to the system, a file called README is copied to the new user's home directory.
sudo touch /etc/skel/README

# 10. Add the value of $PATH variable for user bob to include $HOME/.config/bin location in the path.
vim ~/.bashrc # add this line at the end
export PATH=$PATH:$HOME/.config/bin
source ~/.bashrc # apply the change
echo $PATH # verify the change
