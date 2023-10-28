# Viewing Files

## `cat`
- Usage: `cat <file-path>`
- Arguments: can be multiple file to display (e.g. `cat main.go .gitignore`)
- Options: 
  - `-n` to display the line number (e.g. cat -n main.go)
- Can be use to concat files (e.g. `cat file1 file2 > file_combine`)

## `less`
- `more <file-path>`: show file(s) separated by line
- `less <file-path>`: show file(s) as pages, can switch between pages 
  - e.g. `less file1 file2`
  - navigation guide in COMMAND section of `man less`


## `head`, `tail`, `watch`

- `tail <file-path>`: show the last 10 lines
- Option:
  - `-n` : shows the last n lines. If `+` is appended before the n (e.g. `tail -n +20 file`), it will shows all the line after line 20
  - `-f`: real time viewing file changes
- `head <file-path>`: shows the first 10 lines, opposite of tail
- `watch`: execute command output repeatedly 
  - For examples, can be useful with linux’s `ifconfig` to see the packets change and received files (e.g `watch ifconfig`)
  - Options: 
    - `-n`: interval time before updating
    - `-d`: highlight differences between update

