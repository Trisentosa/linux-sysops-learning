# 1. Generate a 4096-bit RSA private key and a Certificate Signing Request with a single command. 
# The private key should be encrypted with the following password: "kkloud".
# Save the key in a file called priv.key. Save the CSR in a file called cert.csr. 
# There are no requirements for the certificate details like country name, organisation name, and so on. 
# You can pick anything, or press Enter to pick the default values when prompted.

openssl req -newkey rsa:4096 -keyout priv.key -out cert.csr

# 2. Generate a self-signed certificate
# Use no encryption for the private key.
# Save the key in a file called priv.key.
# Set the expiration for the certificate to 365 days.
# Save the certificate in a file called kodekloud.crt.
# Set the Common Name to kodekloud.com. The rest of the certificate details you can set to whatever you want.

openssl req -noenc -x509 -days 365 -keyout priv.key -out kodekloud.crt

# 3. In your /home/bob/ directory you will find a file called my.crt. What is the Common Name set in this certificate?
openssl x509 -in my.crt -text | grep -i "cn"

# 4. We've created a local Git repository for you.
# Please switch to the directory called kode to access it.
# You can stage all the files with the .cpp extension to prepare them for a future commit. The other files should NOT be staged.
# Next, create a commit with the following message: Added C++ files.

git add "*.cpp"
git commit -m "Added C++ files"

# 5. Switch to the Git repository that can be found in the kode directory. Create a new branch called testing.
git branch testing

# 6. In the local Git repository that can be found in the kode directory do the following:
# Delete the branch called "testing".
# The error you will encounter is expected.
# Figure out what is preventing you from performing the task, solve the issue, and then delete the "testing" branch?

# error is because we are in the "testing" branch, need to swithc to master first
git checkout master
git branch -d testing

# 7. Go into the local Git repository found in the kode directory and find the file that modified in latest commit.
git log 
git show 1275 # the hash of latest commit

git log --raw # can also see from here, if we just wanna check the files that is modified/changes/deleted

# 8. Go into the local Git repository that you can find in the kode directory. Merge the documentation branch into the master branch.
git checkout master
git merge documentation

# 9. What command would you use to push the master branch from your local repository to a remote repository nicknamed origin?
git push origin master

# 10. Clone the remote repository from https://github.com/kodekloudhub/git-for-beginners-course.git in your /home/bob/ directory. A subdirectory for the local repository will be automatically created.
cd /home/bob
git clone https://github.com/kodekloudhub/git-for-beginners-course.git