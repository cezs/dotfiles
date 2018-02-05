#!/bin/sh

for D in *; do
    if [ -d "${D}" ]; then

        echo "${D}"

        cd $D

        git filter-branch -f --env-filter 'if [ "$GIT_AUTHOR_EMAIL" = "$1" ]; then
     GIT_AUTHOR_EMAIL=$2;
     GIT_AUTHOR_NAME="$3";
     GIT_COMMITTER_EMAIL=$GIT_AUTHOR_EMAIL;
     GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"; fi' -- --all

        cd ..
    fi
done

