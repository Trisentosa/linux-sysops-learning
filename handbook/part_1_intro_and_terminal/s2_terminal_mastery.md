# Mastering the Terminal

## Terminologies
- **A Terminal Emulator (Terminal)**: crucial part of any Linux system because it basically allows you to access the system through a shell. 
- **Shell**:  is a program that takes commands from the user and gives them to the operating system’s kernel to execute. It’s also called the command interpreter. The shell gets started when the user logs in or starts the terminal. E.g. Bash
- **Console**: special sort of terminal, that is launched when no GUI is installed

## Terminator

Terminal application with extended feature than linux default terminal. 
- Install Terminator: `sudo apt update && sudo apt install terminator`
- More features such as themes, split terminal screen feature, etc

## Linux Command Structure
Structure: 

```
<command-name> -<options> <command arguments>
```

Notes: 
* In some cases options can come after arguments, but the standard way is before arguments.
* White space between command arguments, name, and options can be more than 1 whitespaces
* Single hyphen (-) for abbreviation vs double hyphen (--) for whole word (E.g. ls -a vs ls –all)
* Combining options: for example, instead of `ls -l -h -a`, can do `ls -lha`


## Getting Help

* Getting Help, Man Pages
- `man` command: read documentation of a specific command 
  - E.g. `man ls`
- How to read command usage (Synopsis section)
  -  E.g. `ls [OPTION]... [FILE]...`
     -  `...`(ellipsis) means it can take multiple of a thing
     -  `[]`(square brackets) means that a thing is optional for that command to work
     -  In above example basically can take multiple options and multiple arguments called file
  - Other conventions
    - underline : substitute as something appropriate (e.g --block_size == <u>SIZE</u>)
    - bold : type exactly as it is (e.g. **-a --all**)
- Shortcuts and keys for man page
  - `Ctrl+F` (Go down pages/forward) / `Ctrl+B` (Go up pages/backward)
  - `g` (beginning of page) / `Shift+g`(end of page)
  - `/anything` : will search for matching keyword after the `/` (forward search)
  - `n`: get the next searched match / `shift+n`: get previous match
  - `?anything`: similar to `/` but it will search backwards. Use when you are at the end of pages
- Finding keywords in all man pages:
  - `man -k anykeyword`
    - If the keyword is quoted(“”), it will search for that string in all man pages (e.g. man -k “copy files”)
    - If not quoted, it will find the command and description that match the keyword (e.g. man -k ifconfig). This is the same as using `apropos` (e.g. apropos ifconfig)

## Type 
- `type` command
- We can check where the executable path of a command by doing `type <command-name>`
- If it is a shell builtin command (e.g. `cd`, `umask`). Then we use `help` instead of `man`
- Alternatively, can use `--help` for any command regardless whether that command is built in or not

## Mastering the `Tab` key
For auto completion, if multiple options exist need to press `tab` twice to show all the options. Always use tab completion to avoid making mistakes (as in using tab will indicate if such file/command exist, prevent making semantical error and accidents)

## Keyboard Shortcuts
- `Ctrl + L` : same as `clear` command, clearing the terminal
- `Ctrl + D`: same as `exit` command, close the terminal
- `Ctrl + A`: will go to the beginning of the command, useful when you want to just change the command name 
- `Ctrl + E`: reverse of `Ctrl+A`, go to the end of the line
- `Ctrl + U`: delete whole line before it
- `Ctrl + C`: stop a process
- `Ctrl + Z`: pause a process and can be resumed later (`bg %1`)

## Bash History

- `cat .bash_history`: located in the home directory, shows bash command history, the size of this list is determined by the variable `HISTFILESIZE` (default 2000)
- `history`: shows the executed command in numbered order (current terminal session), the size of this list is determined by the variable `HISTSIZE`(default 1000)
- Can check the size by running `echo $HISTFILESIZE` or `echo $HISTSIZE`
- `bash_history` is only updated when terminal is logged out
- To run command from `history`, do `!<history-order-number>` (E.g. `!17` will run the number 17 command in `history`)
  - `!!`: rerun last command
  - `!-n` where n is the last nth command
  - `Ctrl + R`: search for bash history command
  - `Ctrl + G`: exit history search (Ctrl+R)
  - `Ctrl + D` <history number>: remove a history entry by its number
  - `history -c`: remove the whole history

### Other variables
- `HISTCONTROL`: control how you want to manipulate whether or not your command will be added to your history
  - `ignoredups`: ignore duplicates command from being added to history (make history cleaner)
  - `ignorespace`: ignore the command if it starts with a white space (e.g. ` who` will not be added to history because it has white space in front)
  - `ignoreboth`: combination of `ignoredups` and `ignorespace`
  - To change a value of variable do `HISTCONTROL=<value>`, but it will only apply for that session. To make it permanent, need to put that new value to .bashrc file (echo “<variable>=<value>” >> .bashrc)
- `HISTTIMEFORMAT`: adjust time format in your history
  - Make time format available in history: `echo "HISTTIMEFORMAT=\"%d/%m/%y %T\"" >> ~/.bashrc`

## Root Access

### Root user
- Root user: super user or administrator
- Only one root user per one Linux system
- Not recommended to use root user for ordinary task, only for administrative tasks or task that need root permission.

### Accessing root
- `sudo su` : starts a new shell with root user power
- `sudo su -`: same with `sudo su` but will start from new shell (as in without the -, it will start at the same directory of the non-sudo user)
After you sudo, you gain root privilege for 5 MINUTES
- `sudo -v`: to refresh your sudo power to 5 minutes again (while its still active)
- `sudo -k`: to kill your sudo power immediately, and will require password the next time you want to sudo
- `sudo passwd root` (setting password for root) [my password: makantai)
- `passwd username` (changing a user’s password)

### Terminology
- root directory (`/`) , refers to the user’s main directory
- "Slash-root directory" (`/root`), sub directory of root directory for mainly administrative purposes
