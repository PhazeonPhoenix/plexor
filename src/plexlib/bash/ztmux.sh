if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    if tmux has-session -t main 2>/dev/null; then
        tmux attach -t main
    else
        tmux new -s main
    fi
fi


if tmux has-session -t main 2>/dev/null; then
    TMUXLIB=$HOME/.plexlib/tmux
    if [ -d $TMUXLIB ]; then
        for file in $(find $TMUXLIB -name \*.conf); do
            tmux source-file $file
        done
    fi
    unset TMUXLIB
fi
