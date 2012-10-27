#!/usr/bin/env bash

cd src

for file in $(find *); do
    if [ -d $file ]; then
        mkdir $HOME/.$file 2>/dev/null
    else
        cp -v $file $HOME/.$file
    fi
done
