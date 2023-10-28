# Foreground vs Bakground Processes

## Foreground process
- Started by the user, once a foreground process started in a terminal, it can’t run another process
  - Example:
    - `sleep 15` starts a foreground process for 15 seconds
  
## Background process: 
- Non-interactive , started by the system. Usually executed by system services or by the users. Can start another process within the same terminal
  - Example: 
    - `sleep 20 &` :ends with & meaning background process