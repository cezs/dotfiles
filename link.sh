#!/bin/sh

dotfiles=$(pwd)/*

cd

for path in $dotfiles
do
    filename="$(basename $path)"
    if [[("$filename" != "install.sh")
       	&& ("$filename" != "link.sh")
	&& ("$filename" != "README.org")
	&& ("$filename" != ".gitmodules")
	&& ("$filename" != "emacs") ]]
    then
        if [ ! -h ~/.$filename ]
        then
            echo "Creating symlink for $filename..."
            ln -s $path ~/.$filename
        else
            echo "Creating symlink and backing-up $filename..."
            ln -s -b $path ~/.$filename
        fi
    fi
    echo $filename
done

cd
[ ! -d "backup/" ] && mkdir backup
mv .*~ ./backup/

echo "Finished creating symlinks."
