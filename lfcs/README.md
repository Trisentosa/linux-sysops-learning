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