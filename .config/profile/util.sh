#!/bin/sh

#######################################
# Guess Posix Distribution Type 
# Globals:
#   None
# Arguments:
#   None:
# Returns:
#   None
#######################################

guess_distro() {
    if [ -r /etc/os-release ]; then
        grep -e 'ID' -F /etc/os-release | sed s/.*=//g | tr -s '[:upper:]' '[:lower:]'
    else 
        echo "error reading file '/etc/os-release'."
    fi
}

#######################################
# Print the name of the user's default shell as defined by /etc/passwd. 
# Globals:
#   None
# Arguments:
#   None:
# Returns:
#   None
#######################################

default_user_shell() {
    < /etc/passwd grep -e "$USER" | sed -e 's/.*://g'
}

#######################################
# Check for an environment variable and set it to <value> if and only if $1 does not exist.
# Globals:
# Arguments:
#   $1           - The environment variable that is checked for existence.
#   $2           - The value of the environement variable if it does not exist.
# Returns:
#   None
#######################################

set_env_var() {
    # uppercase the environment variable.
    local VAR=$(echo "$1" | tr "[:lower:]" "[:upper:]")
    if [ -z ${1:+} ]; then
        export "${VAR}=$2"
    fi
}

#######################################
# Determine if command exists on the system.  
# Globals:
# Arguments:
#   $1           - The command that is checked for existence. 
# Returns:
#   None
#######################################

is_command() {
    command -v "$1" >/dev/null 2>&1
}

#######################################
# Determine the Operating System's Package Manager
# Globals:
#   $pkg_manager - The distribution specific package manager
# Arguments:
#   None 
# Returns:
#   None
#######################################

pkg_manager() {
    #TODO Make portable
    echo pacaur -S
}

#######################################
# Install a package for the system.
# Globals:
#   $pkg_manager - The distribution specific package manager
# Arguments:
#   None 
# Returns:
#   None
#######################################

install_package() {
    $(pkg_manager) "$1"
}

#######################################
# Enumerate log levels.
# Globals:
#   None 
# Arguments:
#   None 
# Returns:
#   Associative array of loglevels
#######################################

declare -A LOG_TYPE
declare SCRIPT_LOGLEVEL

enum_log_levels() {
    local log_levels=("DEBUG" "INFO" "WARNING" "ERROR" "FATAL" "OFF")
    local ll_idx=${#log_levels}
    for level in ${log_levels[@]}; do
        LOG_TYPE[$level]=$ll_idx
        ll_idx=$((ll_idx-1))
    done
}

#######################################
# Echo a log leveled message to stdout.
# Globals:
#   $LOG_TYPE          - An associative array of enumerated loglevel.
#   $SCRIPT_LOGLEVEL   - the log level used throughout the script.
# Arguments:
#   $1           - the log level at which a message should be printed.
#   $2           - the message to be printed.
# Returns:
#   None
#######################################

logger() {
    if [ "${LOG_TYPE[$1]}" -le "${LOG_TYPE[$SCRIPT_LOGLEVEL]}" ]; then
        echo "\[${LOG_TYPE[$1]}\] $2"
    fi
}
