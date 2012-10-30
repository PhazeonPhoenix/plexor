#!/usr/bin/env bash

TARGET=$HOME

if [ -n "$1" ]; then
    TARGET=$1
fi

if [ ! -w "$TARGET" ]; then
    echo "You do not have write access to $TARGET"
    exit 1
fi

cd src

for file in $(find *); do
    if [ -d "$file" ]; then
        mkdir "$TARGET/.$file" 2>/dev/null
    else
        cp -v "$file" "$TARGET/.$file"
    fi
done

touch "$TARGET/.bashrc.local" "$TARGET/.vimrc.local" "$TARGET/.tmux.conf.local"

exit 0
