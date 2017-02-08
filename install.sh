#!/bin/sh

# If use_stow is set to true, overwrite existing directories/files
# with symbolic links. If set false then use link.sh which will create 
# backup of existing directories/files before replacing them with
# symbolic links.
# Otherwise, to install individual configurations use the script as follows:
# ./install.sh emacs zsh shell etc.

use_stow=true
current_dir=$(pwd)

# Remove conflicitng links. Not safe, deletes all broken links in home directory!
cd 
find . -type l -! -exec test -e {} \; -print | xargs rm

# move back to repository
cd $current_dir

if ! $use_stow; then
    # Install using shell scripts named link.sh
    cd $(pwd)
    sh $(pwd)/link.sh
    sh $(pwd)/emacs/.emacs.d/link.sh
elif [ $# -eq 0 ]; then
    # Install using stow
    for i in $(ls -d */); do
        stow ${i%%/} -t $HOME --adopt --restow
    done
    echo "Finished installation using stow";
else
    # Install using stow and supllied arguments
    for name in $*
    do
        stow $name -d -t $HOME --adopt
    done
    echo "Finished deletion using stow and supplied arguments";
    for name in $*
    do
        stow $name -t $HOME --adopt
    done
    echo "Finished installation using stow and supplied arguments";
fi


