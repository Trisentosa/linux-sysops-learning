# Challenge 1
# 1. Run the following command both as a non-privileged user and as root: tail /etc/shadow
# 2. Use the TAB key for auto-completion.

# Challenge 2
# 1. Become root temporarily in a terminal.
# 2. Run the following command as root: apt update && apt install nmap
# 3. Logout root from the terminal using a keyboard shortcut

sudo su
apt install nmap
# ctrl+d

# Challenge 3
# 1. Change (set) the root password
# 2. Become root in a terminal by running the su command
# 3. Run as root the following command: lshw



# Challenge 4 
# 1. Consider the nmap program installed in a previous challenge. Open its man page and search for the option -sV
# 2. Run as root: nmap -sV -p 80 www.example.com
# 3. Find the IP address of your Default Gateway running route -n and then run as root: nmap -sV -p 80,443 default_gateway_ip (Example: nmap -sV -p 80,443 192.168.0.1)


# Challenge 5
# 1. Display the user’s history
# 2. Remove line no. 4 from the history
# 3. Run a command without being recorded in history. Check that it wasn’t saved in the shell history.
# 4. Remove the entire history.

