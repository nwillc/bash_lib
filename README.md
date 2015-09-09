
        
             ______             _        _       _ _     
            (____  \           | |      | |     (_) |    
             ____)  ) ____  ___| | _    | |      _| | _  
            |  __  ( / _  |/___) || \   | |     | | || \ 
            | |__)  | ( | |___ | | | |  | |_____| | |_) )
            |______/ \_||_(___/|_| |_|  |_______)_|____/ 
                                                         
-------------------------------------------------------------------------------------

This is a collection of shell scripts, designed as a common library, with a rudimentary 
include mechanism. Should work anywhere `bash` runs, tested on:

   - linux
   - OSX

## The Include Mechanism
The `include` function will load a script once and only once. This should avoid redundant 
loading and prevent variables in scripts from being reinitialized. The scripts themselves 
don't need any code for this feature tp work.

## Self Referencing
Scripts included with `include` can include other scripts using the same mechanism. 

## Search Path
The `add_include_dir` function allows directories containing scripts to be added to the 
loader so `include` can be used with preexisting collections of scripts.

## Usage
The following is a simple example:

      #!/bin/bash
      source /path/to/include.sh
      
      include logger.sh
      
      log_warn "Warning Will Robinson!"
      
For more examples see the `examples` folder.

### Pulling the Library From GIT
The following code snippet is an example of how to include the bash_lib into your script from git and tuck it into `.bash_lib`:

     #!/bin/bash
     SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}" )" > /dev/null 2>&1 && pwd -P)"
     
     # Get/Update bash_lib
     if [ -d "${SCRIPT_DIR}/.bash_lib" ]; then
         (cd "${SCRIPT_DIR}/.bash_lib"; git pull > /dev/null 2>&1)
     else
         echo "bash_lib not loaded - getting from git."
         (cd "${SCRIPT_DIR}" ; git clone https://github.com/nwillc/bash_lib.git .bash_lib ) > /dev/null 2>&1
     fi
     
     source "${SCRIPT_DIR}/.bash_lib/scripts/include.sh"
     add_include_dir "${SCRIPT_DIR}"