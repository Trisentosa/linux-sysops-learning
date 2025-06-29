# 1. what is difference between `apt update` and `apt upgrade` ?
# `apt update` updates the package list (refreshes local database with package from repositories)
# `apt upgrade` upgrades the installed packages (commonly combined with `apt update`; e.g. `sudo apt update && apt upgrade`)

# 2. Install the Apache web server.
# To find the package you need, you can search for this text: apache http server. In your search command, you can wrap this search string between " " double quotes to get fewer results and find the package easier.

apt search "apache http server" # found apache2
sudo apt update && sudo apt install apache2

# 3. Find out the name of the package that "/bin/ls" belongs to and save it in package.txt under /home/bob.
dpkg --search /bin/ls > /home/bob/package.txt

# 4. List the files that belong to the coreutils package. Filter out the entries that were installed in the /bin directory. You will see one file in this /bin directory with a name that begins with the letter "u". 
# Identify the complete path of this file in the /bin directory and save it in name.txt file under /home/bob?
dpkg --listfiles coreutils | egrep "^/bin/u" > /home/bob/name.txt

# 5. Uninstall the package ziptool and its dependency package(s) from the system.
sudo apt autoremove ziptool

# 6. In rare cases, we may need to get packages that were available on an older Ubuntu distribution.
# Configure the package manager with this extra repository:
# deb http://us.archive.ubuntu.com/ubuntu/ focal main
# This will make packages from Ubuntu 20.04 (codenamed Focal Fossa) available on this system.
# Don't forget to also update APT's local cache

sudo vim /etc/apt/sources.list.d/ubuntu.list # add `deb http://us.archive.ubuntu.com/ubuntu/ focal main`
sudo apt update # update local cache, in the log should see this new repository being updated

# 7. In the tmux directory, you will find the source code for the tmux application. 
# All compilation tools and libraries were already installed for you.
# Build the application (compile source code).
# Install it on the system.

# if you cat README, you get the steps from version control system:
# To get and build the latest from version control - note that this requires
# autoconf, automake and pkg-config:

#         $ git clone https://github.com/tmux/tmux.git
#         $ cd tmux
#         $ sh autogen.sh
#         $ ./configure && make
#         $ sudo make install

sh autogen.sh
./configure && make
sudo make install
