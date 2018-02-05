#!/bin/sh

for D in *; do
    if [ -d "${D}" ]; then
        echo "${D}"
        cd $D
        git push -fu
        cd ..
    fi
done

