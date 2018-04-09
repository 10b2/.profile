# appendhistory - If this is set, zsh sessions will append their history list to the history file, rather than replace it. 

# autocd - If a command is issued that can't be executed as  a  normal command,  and  the command is the name of a directory, perform the cd command to that directory.   

# beep - Beep on error in ZLE.

# extendedglob - Treat the `#', `~' and `^' characters as part  of  patterns for  filename  generation,  etc.  

# nomatch - If a pattern for filename generation has no matches,  print an  error,  instead of leaving it unchanged in the argument list. 

# notify - Report  the  status  of background jobs immediately, rather than waiting until just before printing a prompt.
 
setopt appendhistory autocd beep extendedglob nomatch notify
bindkey -e

