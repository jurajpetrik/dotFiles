if [ -z "$TMUX" ] && [ "$OSTYPE" == "linux"* ] ; then
  # in linux, do linux things
  # not in tmux, do non-tmux things
  startx
fi
