# Job Control

## Job
- A job is basically a background process. On top of process id, a background process is also given a job id 
  - Example:
    -  `sleep 20 &` => `[1] 15766`: where 1 is the job id and 15766 is the process id
 - `jobs`:
   - This will display all jobs in the current terminal session.
   - Processes instantiated by terminal only exist while that session is alive
   - If a terminal is closed while the process by that terminal is running then an `HUP` (Hang Up) signal is called and it will kill all that session processes.
     - To avoid `HUP` signal, can use `nohup` (e.g. nohup <any command>)
     - Output will be directed by default to `nohup.out`
