#!/bin/sh

is_command "virtualenvwrapper.sh"
if [ $? -eq 0 ]; then
    virtualenvwrapper.sh
fi
