# .bashrc

export LANG="en_US.UTF-8"
export EDITOR="/usr/bin/vim"
export PAGER="/usr/bin/less"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    tmux attach || tmux new
fi
