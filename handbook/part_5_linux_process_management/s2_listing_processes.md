# Listing Processes

## `ps`
- `ps`: displays a header line, followed by lines containing information about all of your processes that have controlling terminals
  - Output:
    - PID: process id
    - TTY: name of controlling terminal
    - TIME: cumulative CPU time of the process
    - CMD: name of the command to start the process
  - Options
    - `-c`: list all processes
    - `-e`: displaying all processes that are running
    - `-f`: displaying detail information about the processes (usually combined with `e`)
    - `-aux` (can also `ps aux`): display additional output information, about resource used by the process
    - `-u`: process of specific user `u`
  - Additional Output (using `-f`)
    - PPID: parent process id
    - STIME: process starting time
    - TTY: If tty is `?`, doesn’t attached to terminal (either system service or daemon)
    - Additional Output (using `aux`)
    - %CPU: CPU utilization of the process in %
    - %MEM: how much memory used in %
    - VSZ: virtual memory size
    - RSS: size of physical memory that process is using
    - STAT: process state using code
      - `s`: sleeping
      - `r`: running
      - `z`: zombie
      - `t`: stop
      - `i`: idle
      - Suffix `<`: high priority
      - Suffix `N`: low priority
      - `R+`: running process
    - Sort example 
      - Ascending: `ps aux –sort=%mem | less` 
      - Descending(add `-`) `ps aux –sort=-%mem | less` 
    - Common usage with grep
      - `ps -ef | grep sshd`: get all processes, and check if `sshd` is running
      - ** Be mindful, e.g.: `ps -ef | grep not_exist_process` will return a process. It selected itself (the grep command)


## `pgrep`
- `pgrep`: Get pid of a process directly 
  - Example: `pgrep sshd`
- Option:
  - `-l`: will show both pid and process name

## `pstree`
- `pstree`: display hierarchical tree structure of the process
- Option`:
  - `-c`: unmerge identical branches
