#!/usr/bin/env bash

CWD=$(pwd)

pushd $CWD/src

if [ -z "$1" ]; then
    echo "You must specify a target."
    exit
else
    WORKINGDIR=$1
fi

if [ ! -d $WORKINGDIR ]; then
    mkdir $WORKINGDIR
fi

for file in * ; do
    cp -Rv $file $WORKINGDIR/.$file
done



