# Finding Files and String

## Locate
- `locate <keywords>`: locate files with matching keywords
  - But it stores the the files in its own database instead of the file system directly
  - By default the keyword matching pattern is ```*<keyword>*```
  - To find exact keyword can do : `locate ‘\<keyword>’`
  - Options
    - `-b`: basename, will only search the basename file (e.g. /etc/password is located but /password/test.txt is not)
    - `-e`: check if the file exists, because location use its own database instead of file system directly
    - `-i`: make it so case insensitive (default case sensitive)
  - Keyword can also use regex to pattern match
  - `sudo updatedb` to update the locate db 

## Which
- `which <binary>`: will return the path of an executable file
  - Example:
    - `which rm` , `which ls`, etc
    - Combine: `which rm ls grep`
  - Options:
    - `-a`: find more than one executables with the same name

## Find
- `find <location> criteria`
- Complex but will find in file system instead of its own database like locate
- Options
  - `-name`: find matching file name, can use pattern matching too (e.g. `find . -name “*.sql”` , `find . -name “*rep*”` )
  - `-size`: criteria by file size, can prefix by “+” or “-” to signify greater of less than specified file size(e.g. `find  . -size +100M` find more than 100 Mb, `find . -size -10k` find less than 10 kb)
  - `-type`: type of file 
  - `-mtime`, `ctime`, `atime`: by modified, changed, access time (integer in term of days). Examples:
    - `-mtime -7` : find files that is modified less than 7 days ago
    - `-mtime +7`: find files that is modified more than 7 days ago
- Find and Exec
  - Combine find output and exec for each found files
  - Example:
    - `sudo find /etc/ -mtime -7 -type f -exec cp {} /root/backup \;`
      - The `{}` acts as placeholder to each of the file 
      - The `\;` at the end is simply the construction structure (must be there for each exec )
      - Alternative : `-ok` is interactive(prompt) version of `-exec`

## Pattern Searching

### `grep`
- `grep`: Searching for string patterns by matching keywords inside file
- Options
  - `-w`: find exact whole word (by default ```*<keyword>*```)
  - `-i`: case insensitive
  - `-n`: shows the line number which the keyword is found
  - `-a`: treat non-ascii files (like binary files) as ASCII file
  - `-R`: recursive, if target is a directory 
  - `-s`: suppress error
  - `-c`: just shows the number of matches (like grep … | wc -l)
  - `-A`: shows n lines after match(e.g. -A 3 will shows 3 lines after match)
  - `-B`: same with `-A` but before match
  - `-C`: combination of `-A` and `-B`
  - `-v`: inverse the match
- Examples
  - `grep -i “root” filename`
  - `ifconfig | grep ether`

### `strings`
- `strings`: Searching for strings in binary files (strings)
- Find printable strings in a file, binary, objects, etc
- Examples:
  - `sudo strings /dev/mem`

### `cmp`, `diff`, `sha256`
- Comparing Files (cmp, diff, sha256)
- `cmp <file1> <file2>`: compares files byte by byte and shows on which line the files differs, but not tell you how they differ
- `sha256sum <file1> <file2>`: also compared the hashed content of a file, if a single bit is different hashed output of the file would be different 
- `diff <file1> <file2>`: display the differences between file line by line 
  - `<` symbolise the first file argument
  - `>` symbolise the second file argument
  - Options: 
    - `-B`: ignore blank lines
    - `-i`: ignore case differences
    - `-w`: ignore whitespace
    - `-c`: more complex comparison
