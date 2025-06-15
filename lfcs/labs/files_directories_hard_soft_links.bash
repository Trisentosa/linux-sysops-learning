# 1. What is the top-level directoy in Linux ?
# answer: /

# 2. In what form does Linux organise files and directories?
# answer: filesystem tree

# 3. What is the command to print your current working directory?
# answer: pwd

# 4. What is the command to print your current working directory?
# answer: cd ..

# 5. Absolute paths always start out with the root directory /. 
# Then we specify the sub-directories we want to descend into; /home/bob/Documents/Invoice.pdf is an example of such a path. 
# In this case, first home, then bob, and then Documents. 
# We can see the sub-directory names are separated by a /, and we finally get to the file we want to access, i.e, Invoice.pdf. 
# An absolute path can end with the name of a file or a directory.

# question: As per the example above, If we'd want to delete the Documents directory, how would we specify the path?
# answer: /home/bob/Documents

# 6. Create a directory named `lfcs` under `/home/bob` directory
mkdir /home/bob/lfcs

# 7. Create a blank file named lfcs.txt under the/home/bob/lfcs directory.
touch /home/bob/lfcs/lfcs.txt

# 8. Copy the /tmp/Invoice directory (including all its contents) to the /home/bob directory.
cp -r /tmp/Invoice/ /home/bob/

# 9. Copy the /home/bob/myfile.txt file to the/home/bob/data/ directory. Make sure to preserve its attributes.
ln /home/bob/myfile.txt /home/bob/data/myfile.txt

# 10. Copy the /home/bob/lfcs directory (including all its content) into the /home/bob/old-data/ directory.
cp -r /home/bob/lfcs /home/bob/old-data/

# 11. delete the /home/bob/lfcs/lfcs.txt file.
rm /home/bob/lfcs/lfcs.txt

# 12. Move all contents, excluding the directory itself, from /home/bob/lfcs to /home/bob/new-data/ directory.
mv /tmp/lfcs/* /home/bob/new-data/

# 13. delete directory /home/bob/lfcs .
rm -rf /home/bob/lfcs

# 14. Create a soft link to /tmp directory. Create this link in /home/bob directory and call it link_to_tmp.
ln -s /tmp /home/bob/link_to_tmp

# 15. Create a hard link to /opt/hlink file. Create this link in /home/bob/ directory and call it hlink.
ln /opt/hlink /home/bob/hlink

# 16. There is a file called /home/bob/new_file; rename this to /home/bob/old_file.
mv /home/bob/new_file /home/bob/old_file

# 17. Create a directory named 9 under the /tmp/1/2/3/4/5/6/7/8 directory. Please note that the structure of sub-directories from 1 to 8 does not exist. However, mkdir has a command line option to automatically create all of these sub-directories automatically in one shot, instead of 9 consecutive commands. This option is described in the help output or manual pages as make parent directories as needed. Find out what the correct option is and use it to create the directory in one shot.
mkdir -p /tmp/1/2/3/4/5/6/7/8/9

# 18. ls -l shows you the time when a file has been last modified, but it only shows you the hour and the minute, usually in a form like 17:53. 
# Find another way to make ls display the full/exact last modified time for the files in /home/bob directory.At what exact time was important_file created/modified?
ls -l /home/bob --time-style=full-iso








