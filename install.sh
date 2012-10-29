#!/usr/bin/env bash

cd src

for file in $(find *); do
    if [ -d $file ]; then
        mkdir $HOME/.$file 2>/dev/null
    else
        cp -v $file $HOME/.$file
    fi
done

touch $HOME/.bashrc.local $HOME/.vimrc.local $HOME/.tmux.conf.local
