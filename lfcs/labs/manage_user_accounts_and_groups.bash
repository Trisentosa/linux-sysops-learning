# 1. Set the jane user account to expire on March 1, 2030.

sudo usermod --expiredate 2030-03-01 jane
sudo chage -l jane # verify the change

# 2. Create a system account called apachedev
sudo adduser --system apachedev

# 3. Jane's account, i.e., jane, is expired. Unexpire the same and make sure it never expires again.
sudo usermod -e "" jane

# 4. Create a user account called jack with home directory and set its default login shell to be /bin/csh.
sudo adduser jack --shell /bin/csh

# 5. Delete the user account called jack and ensure his home directory is removed.
sudo deluser --remove-home jack

# 6. Mark the password for jane as expired to force her to immediately change it the next time she logs in.
sudo chage --lastday 0 jane

# 7. Add the user jane to the group called developers.
sudo gpasswd --add jane developers

# 8. Create a group named cricket and set its GID to 9875
sudo groupadd --gid 9875 cricket

# 9. You already created a group cricket in the previous question. Now, rename this group soccer while preserving the same GID.
sudo groupmod -n soccer cricket

# 10. Create a user sam with UID 5322. Also, make it a member of the soccer group.
sudo useradd -G soccer sam  --uid 5322

# 11. Update primary group of user sam and set it to rugby
sudo usermod -g rugby sam

# 12. Delete the group called appdevs
sudo groupdel appdevs

# 13. Make sure the user jane gets a warning at least 2 days before the password expires.
sudo chage -W 2 jane # -W / --warndays