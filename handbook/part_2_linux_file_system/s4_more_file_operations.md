# More File Operations

## Creating Files & Directories

### `touch`
- `touch <file-name>`: create file(s)
  - if file already exist will change the `atime`, `ctime`, `mtime`
- `mkdir <dir-name>`: create directory(s)
  - Common Options: 
    - `-v` (verbose)
    - `-p`: will create intermediate directories if existed (e.g. mkdir first/second/third). This assuming first and second doesn’t exist

## Copying files and directories

### `cp`
- `cp <origin> <destination>`: copy file
  - If destination is not exist, cp will create it
  - If destination already exist, cp will overwrite it
  - If origin more than one, destination must be directory (cp file1 file2 file3 dest-dir)
  - If origin and destination are both directories, it will copy the origin files to the directory and creating necessary directory inside destination if needed (cp dir1/* dir2). MUST use `-r` option
  - Options
    - `-v`: verbose
    - `-i`: prompting (“overwrite to <dest-file>?”
    - `-r`: recursive, used to copying directory to another directory 
    - `-p`: preserving file attributes after copying

## Moving and renaming files and directories

### `mv`
- `mv <origin path> <destination path>`: moving multiple files, destination must be a directory 
  - If destination doesn’t exist, it will simply rename (and/or move) the origin file to the destination file 
  - Options
    - `-i`: prompting
    - `-u`: move only when newer file is being overwritten or if file didn’t exist yet

## Removing files and directories

### `rm`
- `rm <file>`: remove file(s)
- Option: 
  - `-i`: prompting
  - `-v`: verbose
  - `-r`: recursive remove
  - `-f`: force remove

- No recovering from removed files, best practices are to:
  - Always  use tab for autocomplete
  - When using pattern matching like * or wildcards can `echo` the matching files first before removing them

### `shred`
- `shred`: overwriting the files couple of times before removing it
  - To prevent other people of recovering data, because the file is removed but the pointer to that file might still exist
  - Options:
    - `-n`: number of iterations before removal (default is 3)
    - `-u`: remove files after overwriting 
    - `-v`: verbose
    - `-f`: force permission to allow writing
