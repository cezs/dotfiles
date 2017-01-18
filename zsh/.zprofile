#!/bin/sh

# If running zsh
if [ -n "$ZSH_VERSION" ]; then
    # Include .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
	. "$HOME/.zshrc"
    fi
fi

# Set PATH so it includes user's private bin if it exists
if [ -d "./bin" ] ; then
    PATH="$PATH:./bin"
    export PATH
fi

# Clean up PATH by removing duplicates 
PATH=$(echo "$PATH" | awk -v RS=':' -v ORS=":" '!a[$1]++')

# Autostart X at login
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
  exec startx
fi
