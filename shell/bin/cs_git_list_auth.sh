#!/bin/sh

for D in *; do
    if [ -d "${D}" ]; then
        echo "${D}"
        cd $D
        git log --pretty=format:"%h%x09%an%x09%ae%x09%cn%x09%ce%x09%ad%x09%s"
        cd ..
    fi
done
