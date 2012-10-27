if [ $TERM != "screen-256color" ] && [  $TERM != "screen" ]; then
    if tmux has-session -t main 2>/dev/null; then
        tmux attach -t main
    else
        tmux new -s main
    fi
fi
