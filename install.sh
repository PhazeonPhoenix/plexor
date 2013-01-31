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

mkdir $HOME/bin > /dev/null 2>&1
wget https://raw.github.com/ginatrapani/todo.txt-cli/master/todo.sh -O $HOME/bin/todo.sh
chmod +x $HOME/bin/todo.sh
mkdir $HOME/todo > /dev/null 2>&1

wget https://raw.github.com/ginatrapani/todo.txt-cli/master/todo_completion -O $HOME/.bash_completion/todo_completion.sh

