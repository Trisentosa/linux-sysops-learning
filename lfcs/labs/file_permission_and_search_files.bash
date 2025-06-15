# 1. What command can be used to find files and directoriesmodified in the last 5 minutes in the /dev directory?
find /dev/ -mmin -5

# 2. What command removes the write permission for the group from a file?
chmod g-w file

# 3. 
# Find files/directories under the /var/log/ directory that the group can write to, but others cannot read or write to it. 
# Save the list of the files/directories (with complete parent path) in the /home/bob/data.txt file.
# You can use the redirection to save your command's output in a file i.e [your-command] > /home/bob/data.txt
# To make this easier to understand, the logic of the command can be broken down like this:
# -> Permissions for the group have to be at least w. If there's also an extra r or x in there, it will still match.
# -> Permissions for others have not to be r or w. That means, if any of these two permissions, r or w, match for others, the result has to be excluded.
find /var/log -perm -020 -not -perm -002 > /home/bob/data.txt

# 4. 
# Find our secret file under /home/bob. You can either look for a file that is exactly 213 kilobytes or a file that has permission 402 in octal.
# Save the name (including the parent directory path) of this file in the /home/bob/secfile.txt file.
# You can use the redirection to save your command's output in a file: [your-command] > /home/bob/secfile.txt
find /home/bob -size 213k -o -perm 402 > /home/bob/secfile.txt

# 5.
# In our lessons, we briefly mentioned the setuid, setgid, and sticky bit special permissions. 
# Consider that setuid is short for set user id and setgid is short for set group id.
# Add the permissions for setuid, setgid, and sticky bit on the /home/bob/datadir directory.
chmod 7755 /home/bob/datadir/

# 6. 
# Find the dogs.txt file under the /usr/share directory.
# Save the location of the file in the /home/bob/dogs file.
find /usr/share/ -name dogs.txt > /home/bob/dogs

# 7. Find the cats.txt file under bob's home directory and copy it into the /opt directory.
find /home/bob -name cats.txt -print0 | xargs -0 cp -t /opt

# 8. 
# Find all directories named pets in the /var/directory and save the output (along with directory path) in the/home/bob/pets.txt file.
# You should be able to save the output in a file using redirection: <your-command> > /home/bob/pets.txt
find /var/ -name pets -type d > /home/bob/pets.txt

# 9. find files under /var directory with permisson 0777
find /var/ -perm 0777 -type f

# 10 find all the files under /usr with perm 0640 
find /usr/ -perm 0640 -type f > /home/bob/.opt/permissions.txt

# 11. Find all the files which have been modified in the last 2 hours in /usr directory. How many do you find?
find /usr/ -mmin -120 -type f | wc -l

# 12. Find all the files which have been modified in the last 30 minutes in the /var directory. How many do you find ?
find /var -mmin -30 -type f | wc -l

# 13. Find all the files with size 20MB in /var directory. HOw many do you find?
find /var -size 20M -type f | wc -l

# 14. Find all files between 5mb and 10mb in the /usr directory and save the output (along with parent path) in the/home/bob/size.txt file.
# You should be able to save the output in a file using redirection: <your-command> > /home/bob/size.txt
find /usr -size +5M -size -10M > /home/bob/size.txt

# 15. Create a directory named LFCS under bob's home directory and update its user owner permissions to only x (execute), and group and others should not have any permissions.
# It should give us a permission denied error while listing the contents of the directory.
mkdir /home/bob/LFCS
chmod 100 /home/bob/LFCS 

# 16. Update the permissions for some_directory to rwxr-xr-x
chmod 755 some_directory