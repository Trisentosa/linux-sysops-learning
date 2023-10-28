# Processes and Linux Security Model

## Process
- Process: running instance of a program. Has its own memory space
- New process created when you execute command (only executable file command, not shell built in, you can check this by doing `type <command>`)
- Process properties:
  - PID - a unique positive number
  - User
  - Group
  - Priority/Nice
- Type of processes:
  - Parent: process that has created >= 1 child processes
    - For example, `bash` is a parent process of command `who` 
  - Child 
  - Daemon: processes which run in the background, not interactive, in linux daemon names ends in “d” (e.g httpd, sshd, named, mysqld, systemd)
  - Zombie (defunct): Terminated process whose data has not yet been collected. Usually removed quickly and not using system resources
  - Orphan: Parent process terminates before child processes
    - E.g. Closed terminal while processes still running

## Thread
- Thread: multiple can exists inside a process, share same resource on the same process
- Task: synonyms with process
