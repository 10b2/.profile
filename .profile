#! /bin/sh


# Guess Linux Distribution Type 
check_distro()
{
if [ -r /etc/os-release ]
then
	echo $(grep -e 'ID' -F /etc/os-release | sed s/.*=//g | tr -s '[:upper:]' '[:lower:]')
else 
	echo "error reading file '/etc/os-release'."
fi
}

distro=$(check_distro)
os=$(uname -s)

# XDG configuration home variable
if [ -z ${XDG_CONFIG_HOME:+} ]
then 
	XDG_CONFIG_HOME="${HOME}/.config" 
	export XDG_CONFIG_HOME
fi 


case ${distro} in 
'manjaro'|'arch')
	# makepkg environment variables
	if [ -z ${builddir:+} ]
	then
		if [ ! -d /tmp/makepkg ] 
		then
			mkdir /tmp/makepkg
		fi
		builddir=/tmp/makepkg
		export builddir
	fi
	which pacaur 2>&1 > /dev/null 
	# install pacaur for packages
 	if [ $? -ne 0 ]
       	then
		echo 'installing pacaur'
		pacman -sy pacaur 
	fi
	# arch user repository clone folder
	if [ -z ${aurdest:+} ]
	then
		mkdir -m 777 /var/cache/pacaur 2>&1 > /dev/null
		if [ $? -eq 1 ]	
		then
			echo 'creating /var/cache/paucaur directory'
			su -c 'mkdir -m 777 /var/cache/pacaur'
		fi
		aurdest=/var/cache/pacaur
		export aurdest
	fi
	;;
esac

# Install NeoVim 
if [ ! -x /usr/bin/nvim ]
then
	pacaur -S neovim
fi

# Set EDITOR variable
if [ -z ${EDITOR:+} ] 
then
	EDITOR=/usr/bin/nvim
	export EDITOR
fi

