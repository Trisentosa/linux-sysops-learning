<div align="center">
  <h1>Linux Sysops Learning Journey </h1>
</div>

<h1>Table of Contents</h1>

- [Introduction](#introduction)
  - [Course Link](#course-link)
  - [Important Links](#important-links)
  - [Curriculum](#curriculum)
  - [LFCS Exam Objectives](#lfcs-exam-objectives)
- [Essential Commands](#essential-commands)
  - [Log in to Local \& Remote Graphical and Text Mode Consoles](#log-in-to-local--remote-graphical-and-text-mode-consoles)
  - [Read and Use System Documentations](#read-and-use-system-documentations)
  - [LAB: Read and Use System Documentations](#lab-read-and-use-system-documentations)
  - [Create, Delete, Copy, and Move Files and Directories](#create-delete-copy-and-move-files-and-directories)
  - [Create and Manage Hard Links](#create-and-manage-hard-links)
  - [Create and Manage Soft Links](#create-and-manage-soft-links)
  - [Lab: Files, Directories, Hard and Soft Links](#lab-files-directories-hard-and-soft-links)
  - [List, Set, and Change Standard File Permissions](#list-set-and-change-standard-file-permissions)
  - [SUID, SGID, and Sticky Bit](#suid-sgid-and-sticky-bit)
  - [Search for Files](#search-for-files)
  - [Lab: File Permissions, Search for Files](#lab-file-permissions-search-for-files)
  - [Compare and Manipulate File Content](#compare-and-manipulate-file-content)
  - [Pagers and Vi Demo](#pagers-and-vi-demo)
  - [Search Files with Grep](#search-files-with-grep)
  - [Analyze Text Using Basic Regular Expressions](#analyze-text-using-basic-regular-expressions)

# Introduction
## Course Link
https://www.udemy.com/course/linux-foundation-certified-systems-administrator-lfcs/

## Important Links
- Linux Foundation Certified System Administrator (LFCS): https://training.linuxfoundation.org/certification/linux-foundation-certified-sysadmin-lfcs/
- Exam requirements: https://docs.linuxfoundation.org/tc-docs/certification/instructions-lfcs-and-lfce#exam-environment
- ​Certification FAQs: https://training.linuxfoundation.org/about/faqs/certification-faq/
- ​To ensure your system meets the exam requirements, visit this link: https://syscheck.bridge.psiexams.com/
- Check out the full details of the Identification requirements for the exam here: https://docs.linuxfoundation.org/tc-docs/certification/instructions-lfcs-and-lfce
- For additional information, visit: https://trainingsupport.linuxfoundation.org
- ⭐ LFCS Command Cheat Sheet: https://res.cloudinary.com/kodekloud/image/upload/v1719583892/course-resource-new/ksi3ej5znxkhuilnoang.pdf 

## Curriculum
- Essential Commands ([pdf](./resources/course_pdfs/Essential+Commands.pdf))
  - Logging linux systems
  - Files and Directories
- Operations Deployment ([pdf](./resources/course_pdfs/Operations+Deployment.pdf))
  - Automating System Maintenance Tasks
  - Managing Startup Processes and Services
  - Diagnosing and Managing Processes
  - Scheduling Tasks
  - Adjusting Kernel Runtime Parameters
- Users and Groups ([pdf](./resources/course_pdfs/Users+and+Groups.pdf))
  - Creating, Modifying, and Managing Local User
  - Configuring System-wide environment variables
  - Setting User Resource Limits
  - Controlling Access to the Root Account
- Networking ([pdf](./resources/course_pdfs/Networking.pdf))
  - Configuring IPv4 and IPv6 Networking
  - Hostname Resolution
  - Bridge and Bonding Devices
  - Packet Filtering
  - Port Redirection
  - NAT
  - Reverse Proxies
  - Load Balancers
  - System Time Synchronization
  - SSH Servers and Clients
- Storage ([pdf](./resources/course_pdfs/Storage.pdf))
  - Physical Storage Partitions
  - Swap Space
  - File Systems
  - Mount Configurations
  - Remote Filesystems (NFS)
  - Network Block Devices (NBD)
  - Storage Performance Monitoring
  - Advance File System Permissions

## LFCS Exam Objectives

Questions Distribution
1. Essential Commands (20%)
2. Operations Deployment (25%)
3. Users and Groups (10%)
4. Networking (25%)
5. Storage (20%)

Details
1. Duration: 120 minutes (2 hours)
2. Price: $395 USD 
3. Certification Valid Duration: 2 years
4. Performance-based: simulates on the job tasks (no multiple choice or true/false)
5. Online Proctored

# Essential Commands

## Log in to Local & Remote Graphical and Text Mode Consoles

4 ways to login
  - Local + Graphical
  - Remote + Graphical: VNC(Virtual Network Computing) or RDP(Remote Desktop Protocol) for windows
  - Local + Text
  - Remote + Text: ssh <user>@<ip>

Terminologies
- Local: whatever machine you’re physically using 
- Remote: accessing server remotely (e.g. cloud server)
- Graphical: Linux GUI
- Text: text

## Read and Use System Documentations

- `--help` option
  - `q` to exit
  - `up` or `down` arrow keys (or `page up` or `page down` ) if cokmmand requires lots of lines
  - **TIPS**: during exam generally `--help` is more faster and efficient than `man`
- `man` <command>
  - man (manual) page
  - `man man`: manual page for man
  - `man -k <keyword>`: similar to apropos
- `apropos` <keyword>
  - look through all man pages to find certain keyword
  - `apropos` will look through the manual page index cache
    - If got response `nothing appropriate`, possible page index cache not updated yet
    - To update, use `sudo mandb` command
  - can use the `-s` option to find on specific section
  - `apropos -s 1,8 director`: find the "director" keyword from all section 1 and 8 man pages
  - The following command above is the same as:
    - `man -k director -s 1,8`
  - **TIPS**: use fuzzy words like "director" instead of "directory" ("director" will covers case such as "directories" which will not be coverd with "directory")
- Familiarzie with `TAB` key for auto-completion and list suggestions

## LAB: Read and Use System Documentations
[Lab: Logging in And System Documentation](./labs/logging_in_and_system_documentation.bash)

## Create, Delete, Copy, and Move Files and Directories
- Listing files and directories
    ```bash
    ls -la # list all files in a directory. -l long. -a all
    ls <directory> -la
    ls -lh # -h human readable format. Must combined with -l option
    ```
- Filesystem Tree
  - ![filesystem_tree](./resources/screenshots/filesystem_tree.png)
  - Current/Working directory: the current directory we are in 
    - `pwd`: print working directory to console
  - Absolute path: defines path from the root (`/`) directory
  - Relative path: the path relative to the current directory
- Change directory
  - `cd`: change directory
    - `cd /var/log`: change dir to `/var/log`
    - `cd ..`: takes one directory up (e.g. `/var/log` to `/var`)
    - `cd /`: go to root directory
    - `cd -`: go to previous directory
    - `cd`: go to home directory
- Creating files
  - `touch` : create a file
    - `touch <path>/<filename>`
- Creating directories
  - `mkdir`: make directory
    - `mkdir <path>/dir_name`
- Copying files/directories
  - `cp`: copy files
    - format: `cp <source> <destination>`
    - for directory, use `-r` (recursive) option
      - format: `cp -r <source_directory> <destination>`
      - e.g. `cp -r data/ backupdata/`
      - note: if `destination` directory already exists, it will copy whole source directory instead of the content
        - e.g. if `backupdata` already exist, running `cp -r data/ backupdata/` will result to `/backupdata/data/<contents>` instead of `/backupdata/<contents>`
- Moving Files
  - `mv`: move and/or rename files
    - format: `mv <source> <destination>`
      - to rename: same source and dest, just change the name
        - e.g. `mv receipt.pdf receipt_new.pdf`
- Remove files
  - `rm`: remove files
    - format: `rm <file>`
    - for directoy: `rm -r <directory>`

## Create and Manage Hard Links
- To understand hard/soft links, need to understand how file is stored in linux
  - try this. For every file in linux, you can view the file stats by using the `stat` command
  - ![stat](./resources/screenshots/stat.png)
  - each file, has Inode value (Index Node). What is Inode?
    - It is a unique identifier for a specific piece of metadata (permission, file type, time created/accessed, etc) on a given filesystem. It also stores the pointers to data blocks in the memory
    - for example `dog.jpg` have Inode of 393230
    - this means whenever we interact with `dog.jpg` (access it, open it), Linux will first checks all the related informations (metadata, data blocks) to the inode number inside the disk
    - simplified view: `inode` -> `pointer to data block xxx` -> actual file data in block xxx
    - You can get the inode of a file by using `ls -i <file>`
  - From the `stat` output, we can also see the `Links`, which is the number of "Hard Link" to this Inode
- Hard Link: when a file points to the same inode as the original file (same actual file)
  - implication: 
    - if you update a file that is hard linked, it will update the original data as well
    - if you delete a hard link, it does NOT delete the actual file, as long as one link remains
    - only works within same filesystem
- You can only hard link **File**, not **Directory**
- Hard link is limited to **1 File System**
  - What this mean, if you have mount different file systems
  - e.g. `/mnt/Backups/file` cannot be hard linked to `/home/user/file`
- To create hard link:
  - `ln <path_to_target> <path_to_link>`
  - ![hard_link_example](./resources/screenshots/hard_link.png)
  - In the example, after creating hard link
    - `Links` becomes 2
    - same Inode as original file
  
## Create and Manage Soft Links
- Soft Link: when a file points to another file's path instead of actual inode of the file
  - it has its own inode (different from the target, the inode will only points to the original file path)
  - implication:
    - if you update a file that is soft linked, it will also update the original data 
    - if you delete a soft link, it does NOT delete the actual file
    - But if you delete the original file, the soft link becomes a dangling file (because it points to a data that is already deleted)
- Unlike hard links
  - You can soft link to directories
  - You can soft link to different file systems (e.g. /home/user/file -> /mnt/Backups/file)
- To create soft link
  - `ln -s <path_to_target> <path_to_link>`
  - ![soft_link](./resources/screenshots/soft_link.png)
    - as you can see, from ls output it has `l` in front, which means that the file is a soft link
    - it also have all permissions enabled, because the permission of soft link don't matter (still restricted by permission of the original file)
    - the Inode is also different than the original file
  - ![soft_link_delete](./resources/screenshots/soft_link_delete.png)
    - after we delete the original file, soft link will be dangling file

## Lab: Files, Directories, Hard and Soft Links
[Lab: Files, Directories, Hard and Soft Links](./labs/files_directories_hard_soft_links.bash)

## List, Set, and Change Standard File Permissions
- First, We need to understand `Owner and Groups`
  - When we do `ls -l`, we can see this output
    - ![owner_group](./resources/screenshots/owner_group.png)
  - The one highlighted in blue is "owner" and the one highlighted in yellow is "group"
  - Groups:
    - `chgrp <new_group> <target_file/target_directory>`: change the target_file/target_directory group to new_group
    - `groups`: list groups
  - Owner:
    - `sudo chown <new_owner> <target_file/target_directory>`: change the target_file/target_directory group to new_owner
      - Note: only root user able to change the owner of a file
- Second, We need to understand File and Directory permissions
  - When we do `ls -l`, the first section is the permissions section
    - For example "lrwxrwxrwx"
    - What does each character stands for ?
      - the first character stands for the file type
        - ![ls_file_types](./resources/screenshots/ls_file_types.png)
      - next 9 characters shows us file permissions
        - ![ls_permissions](./resources/screenshots/ls_permissions.png)
    - What does r, w, x exactly mean ?
      - They behave differently between files and directories
      - File:
        - r: can read contents of file. "-" means cannot read
        - w: can write contents to the file
        - x: can execute this file (e.g. execute a bash script)
      - Directory:
        - r: can read the contents of directory 
        - w: can write to the directory
        - x: execute into directory
    - How Permission is evaluated
      - ![permission_evaluation](./resources/screenshots/permission_evaluation.png)
      - permission evaluated left to right
      - In above example, may be bit unintuitive, but a good example of evaluating permission. Even though aaron is part of family, OS will evaluate the owner permissions first. And since aaron does not have write permission as the owner, he cannot write to the file
      - Meanwhile Jane, is also part of family. But since she is not the owner, OS evaluates her group permission. And she does indeed have permission to write to the file
  - How to change permission
    - `chmod <permissions> <target_file/target_directory>`: change permissions(mode) of file/directory
      - Multiple ways to use this command
        1. Add permission to specific area (user/group/others)
          - ![chmod_shortcuts](./resources/screenshots/chmod_shortcut.png)  
          - e.g. `chmod u+w dog.txt`: gives owner write permission to dog.txt 
          - To remove permission, can use `-` instead of `+`
          - e.g. `chmod u-rw dog.txt`: removes owner write and read permission to dog.txt
          - To set **Exact** permission, can use `=` instead
          - e.g. `chmod o= dog.txt`: others cannot read, write, and execute permission to dog.txt (same as `o=---`)  
          - e.g. `chmod u=r dog.txt`: by default, non-included permission will be removed. So in this case permission for user is `r--`
          - For targetting multiple areas, can separate by comma
          - e.g. `chmod u=rwx,g=rw,o+r dog.txt`
        2. Add permission using octal value
           - If we run `stat` command, we can see the octal value permission of a file
             - ![stat_octal_permissio](./resources/screenshots/stat_octal_permission.png)
             - as you can see, `0644` is the octal permission
               - we can ignore the first 0 (related to SUID,SGID,and Sticky Bit in next section)
               - 6 is owner permission
               - 4 is group permission
               - 4 is others permission
             - We can calculate this by using binary calculation. e.g.
               - `rwx`: 111 binary = 4+2+1 = 7
               - `--x`: 001 binary = 0+0+1 = 1
             - We can think of it as octal value, where
               - r = 4, w = 2, x = 1
               - then we just add/subtract as needed
           - then we can just use chmod like this:
             - `chmod 640 dog.txt`: set 6(owner), 4(group), and 0(others)

## SUID, SGID, and Sticky Bit
- `SUID`: special permission that allows user to run an executable, with the permission of the executable's owner
  - Example Usecase: If we have a program that write reports to a restricted directory. But we don't want other users to access that restricted directory. We can set the SUID so that the OS will assume owner's permission for this executable
- `SGID`: same with SUID, but also applies to directories as well. It assumes the permission of the executable's/directories's GROUP, not OWNER
  - Example Usecase: A program that is executed by member of "X" group, then that executable will have the permission of "X" group. 
- `Sticky Bit`: special permission that can be set on directories. It restricts file deletion in that directory
  - Only file owner, directory owner, or sudo user can delete the file
  - Example Usecase: Shared directory with multiples user creating file, but don't want X user to modify files created by Y user
- Modify SUID, SGID, and Sticky Bit
  - We can add 1 more digit in front when doing `chmod` to include this SUID/SGID/Sticky bit configuration
  - SUID/SGID/StickyBit as Octal values:
    - SUID: 4
    - SGID: 2
    - Sticky Bit: 1
  - So we can do: 
    - `chmod 4666 file.txt`: gives SUID to file.txt
      - `ls -l`: will shows either `S` or `s` in place of the usual `x` OWNER permission
      - `S` means SUID is enabled, but owner doesn't have executable permission
      - `s` means SUID is enabled, and owner have executable permisson
    - `chmod 2666 file.txt`: gives SGID to file.txt
      - `ls -l`: will shows either `S` or `s` in place of the usual `x` GROUP permission
      - `S` means SUID is enabled, but group doesn't have executable permission
      - `s` means SUID is enabled, and group have executable permisson
    - `chmod 1666 files` or `chmod +t files`: gives Sticky Bit to files directory 
      - `ls -l`: will shows either `T` or `t` in place of the usual `x` GROUP permission
      - `T` means Sticky Bit is enabled, but others doesn't have executable permission
      - `t` means Sticky Bit  is enabled, and others have executable permisson
    - Of course we can combine SUID/SGID/Sticky Bit to a file/directory
      - `chmod 6777 file.txt`: grants SUID and SGID to file.txt

## Search for Files
- `find`: flexible command to find files in the filesystem
  - Example
  ```bash
    find /usr/share -name '*.jpg' # find all jpg files under /usr/share
    find /lib/ -size +10M # find files under /lib where size larger than 10M
    find /dev/ -mmin -1 # files changed in the past minute under /dev/
  ```
  - Usage
    - General: `find <dir> <parameters/options>`
    - If directory empty, it will search current directory
    - Useful parameters:
      - `-name`: find based on file name
        - commonly can be combined with wildcard "*" 
      - `-iname`: find based on file name, case insensitive
      - `-mmin`: stands for "modified minute"
        - can use `+`, `-`, and none when searching for time. Let say time is 12:05
        ```bash
        find -mmin 5 # exactly at 12:00
        find -mmin -5 # file modified in the past 5 min 12:01 - 12:05
        find -mmin +5 # file modified more than 5 min ago
        ```
        - ![mmin](./resources/screenshots/mmin.png)
      - `-mtime`: same `mmin` but in the range 24 hour unit instead of minute unit
      - NOTES: "Modified" vs "Changed"
        - Modified: file when content edited or file created
        - Changed: file metadata changed (e.g. permission)
      - `-ctime`: stands for "changed time" (metadata)
      - `-size`
        - size unit table
        ![find_size](./resources/screenshots/find_size.png)
        - can use `+`(greater than), `-` (less than), and none (exactly)
      - `-perm`: find based on files permissoin
        - Example
        ```bash
        find -perm 664 # find files with 664 permission
        find -perm -664 # find files with at least 664 permission
        find -perm /664 # find files with any of these permission (either u=6, g=6, or o=4)
        find -perm u=rw,g=rw,o=r # same as -perm 664
        ```  
      - `-type`: find by type
        - e.g. `find -type d` # find in current direcytroy where type is directory

    - Combine parameters
      ```bash
      find -name "*.log" -size +100M # appending -> AND operator
      find -name "*.log" -o -size +100M # -o <param> -> OR operator
      find -not -name "*.log" # -not <param> -> NOT operator
      find \! -name "*.log" # same as -not, just another notation
      ```
## Lab: File Permissions, Search for Files
- [Lab: File Permissions, Search for Files](./labs/file_permission_and_search_files.bash)

## Compare and Manipulate File Content
- View Text Files
  - `cat` (display text) or `tac` (display text file bottom up)
    - `cat` format: `cat file.txt`
    - `tac` format: `tac file.txt`
  - `head`: display the first 10 lines
    - Options:
      - `n`: shows the first n lines instead of default 10
  - `tail`: display the last 10 lines
    - Options:
      - `n`: shows the last n lines
- Transforming Text
  - `sed`: "stream editor". transforms stream of matching text to desired 
    - Usage: `sed <instruction> filename`
    - Example
    ```bash
    sed 's/canda/canada/g' userinfo.txt # replace all occurence canda with canada in userinfo.txt
    $ # sed must wrap instruction with single quote
    $ # the first character s stands for substitute (for search and replace)
    $ # the last character g stands for global (all occurences). Default is only 1 line
    $ # can read it as "search and replace canda with canda for all occurences"
    
    sed 's/canda/canada/' userinfo.txt # without g will just replace one occurence

    sed -i 's/canda/canada/g' userinfo.txt # By default sed will not change the file, it will only show the preview of changes
    $ # use -i or --in-place to apply the change directly in the file
    ```
  - `cut`: extract parts we need from a file
    - For example if we have a space separated file like this:
      ```
      1 a b c
      2 d e f
      3 g h i
      ```
    - and we want to only get the first column
    ```bash
    cut -d ' ' -f 1 userinfo.txt # get the first column
    $ # -d: delimiter, here we just put space character
    $ # -f: field, here we just want the field 1 (first column)
    ```
  - `uniq`: get unique entries from a file
    - Usage: `uniq filename`
    - How it works
      - If we have filename file.txt
      ```bash
      a
      b
      b
      c
      b
      ``` 
      - `uniq file.txt` output will be
      ```bash
      a
      b
      c
      b
      ``` 
      - the reason because `uniq` only removes the entry next to each other, not all occurence
  - `sort`: sort entry in files numerically
    - Usage: `sort filename`
    - Can be used in conjunction with `uniq` to remove all duplicates
    - In example above, we can do: `sort file.txt | uniq`. Output will be:
    ```bash
    a
    b
    c
    ``` 
- `diff`: compared 2 different files 
  - Usage: `diff file1 file2`
  - Common Option:
    - `-c`: context. gives context of what changed by symbols at front
      - `!`: different line
      - `+`: added line
      - `-`: removed line
    - `-y`: side by side comparison
  - ![diff_cmd](./resources/screenshots/diff_command.png)
  - ![sdiff_cmd](./resources/screenshots/sdiff_command.png)

## Pagers and Vi Demo
- Brief overviews of pagers and Vi
- Pagers: display file in page format
  - `less`
    - Navigation
      -  up/down arrow keys: navigate line by line
      - `/text`: search string matching with text
        - `n`: move downward through result
        - `N`: move upward
      - `-i` + enter: can be used after `/text` to make your search case insensitive
      - `q`: quit pager
  - `more`
    - `space`: move page by page
    - `q`: quite
- Vim: text editor (Vi-Improved)
  - Basic Usage
    - press escape to enter command mode
    - `i` command: to insert text
    - `:q` command: exit vi/vim
    - `:wq` command: exit and save (w-> write)
    - `q!` command: force quite without saving any change
    - `h,j,k,l`
      - `h`: left
      - `l`: right
      - `j`: down
      - `k`: up
    - `/text`: search for text (case sensitive)
      - `/text\c`: search for text (case insensitive), need to add `\c` in the end
    - `:<any-number>`: go to any line 
    - `y`: yank a line (copy)
    - `d`: cut a line 
    - `p`: paste a line you copy or cut
  
## Search Files with Grep
  - `grep`: a command line tool to search for text in a file
    - Basic usage: `grep [options] '<text-to-search>' filename` 
      - Common Options:
        - `-i`: case insensitive
        - `-r`: give path to directory, search recursively
        - `--color`: color code the output
        - `-v`: invert search (search one not matching with the text-to-search)
        - `-w`: exact word match
        - `-o`: only shows the matching text
      - Example:
      ```bash
      grep 'password' /etc/ssh/sshd_config # search password in sshd_config
      grep -i 'password' /etc/ssh/sshd_config # case insensitive search
      grep -ri 'password' /etc/ # recursively search files within /etc/ directory for password (case insensitive)
      grep -ri 'password' --color /etc/ # color code the output
      grep -rvi 'password' --color /etc/ # color code the output
      ``` 

## Analyze Text Using Basic Regular Expressions
- Regex (regular expressions): advanced search instruction
- Common Regex Operators
  - `^`: "The line begins with"
    - Example Usecase:
    ```bash
    grep '^#' /etc/login.defs # search for lines starting with # sign (commented lines)
    grep -v '^#' /etc/login.defs # inversely, search for non-commented lines
    ``` 
  - `$`: "The line ends with"
    - Example Usecase:
    ```bash
    grep -w '7$' /etc/login.defs # match only a single 
    ```
  - `.`
  - `*`
  - `+`
  - `{}`
  - `?`
  - `|`
  - `[]`
  - `()`
  - `[^]`