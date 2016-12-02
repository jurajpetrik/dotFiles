if [ -z "$TMUX" ] && [ "$OSTYPE" == "linux"* ] ; then
  # not in tmux, do non-tmux things
  startx
fi

