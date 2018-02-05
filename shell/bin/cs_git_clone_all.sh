#!/bin/sh

curl "https://api.github.com/users/cezs/repos?per_page=1000" | grep -o 'https://github.com/cezs/[^"]*git' | xargs -L1 git clone --recursive
