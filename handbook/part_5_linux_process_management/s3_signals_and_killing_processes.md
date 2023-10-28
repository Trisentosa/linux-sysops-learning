# Signals and Killing Processes

## Signal
- Default signal : SIGTERM(15)
- `kill -l`: gets a list of signals
- Can use the signal number to send that signal to a process 
  - Examples: `kill -2 1234`
- To get name of process can use `pgrep` or `pidof` command
- System related files processes like `sshd` are stored in `/var/run` (e.g. `cat /var/run/sshd.pid` will return pid of sshd process)
- SIGTERM (soft kill, can be ignored by a process) vs SIGKILL (hard kill, cannot be caught by a process )

## `killall`
- `killall`: Kills all processes with a particular name
- Name must match, cannot be partial
- Example: `killall sleep`

## `pkill`
- `pkill`: similar to`killall` but can accept partial skill
  - Example: `pkill slee` will kill all sleep processes
