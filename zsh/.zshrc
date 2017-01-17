#!/bin/sh

# Using oh-my-zsh

# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="random"
# ZSH_THEME="tjkirch"
# ZSH_THEME="minimal"
# ZSH_THEME="clean"
# ZSH_THEME="itchy"
# ZSH_THEME="duellj"
# ZSH_THEME="murilasso"
# ZSH_THEME="xiong-chiamiov-plus"
# ZSH_THEME="crcandy"
# ZSH_THEME="peepcode"
# ZSH_THEME="jispwoso"
# ZSH_THEME="dst"
# ZSH_THEME="mikeh"
# ZSH_THEME="jtriley"
# ZSH_THEME="josh"
# ZSH_THEME="avit"
# ZSH_THEME="frisk"
# ZSH_THEME="amuse"
ZSH_THEME="pure"

# Case-sensitive completion.
CASE_SENSITIVE="false"

# Hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="false"

# Disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=31

# Disable colors in ls.
DISABLE_LS_COLORS="false"

# Disable auto-setting terminal title.
DISABLE_AUTO_TITLE="false"

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="false"

# Disable marking untracked files under VCS as dirty.
# This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="dd.mm.yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z)

source $ZSH/oh-my-zsh.sh

# User configuration

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='emacs'
fi

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Aliases
[[ -f ~/.aliases ]] && source $HOME/.aliases

# Set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$PATH:$HOME/bin"
    export PATH
fi

# Redirection conf
unsetopt MULTIOS

export EDITOR=emacsclient

autoload zmv
