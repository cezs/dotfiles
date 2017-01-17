#!/bin/bash
#
# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.
#
# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# If running bash
if [ -n "$BASH_VERSION" ]; then
    # Include .bashrc if it exists
    if [ -f "~/.bashrc" ]; then
	. "~/.bashrc"
    fi
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "~/bin" ] ; then
    PATH="$PATH:~/bin"
    export PATH
fi

# Clean up PATH by removing duplicates 
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')

# Autostart X at login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx
fi
