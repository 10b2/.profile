#!/usr/bin/env sh

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
		grep -e 'ID' -F /etc/os-release | sed 's/.*=//g' | tr -s '[:upper:]' '[:lower:]'
	else
		echo "error reading file '/etc/os-release'."
	fi
}

#######################################
# Load extension files stored in $PROFILE directory.
# Globals:
#   None
# Arguments:
#   None:
# Returns:
#   None
#######################################
load_extensions() {
	e_files=$(find "${XDG_CONFIG_HOME}/profile" -type f | sort -n )
        #shellcheck disable=SC2116
        for file in $(echo "${e_files}"); do
                . "${file}"
        done
        unset e_files
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
	grep </etc/passwd -e "$USER" | sed -e 's/.*://g'
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
	VAR=$(echo "$1" | tr "[:lower:]" "[:upper:]")
	if [ -z ${1:+} ]; then
		export "${VAR}=$2"
	fi
	unset VAR
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
