if [ -z "$TMUX" ] && [ "$OSTYPE" == "linux"* ] ; then
  # in linux, do linux things
  # not in tmux, do non-tmux things
  startx
  setxkbmap -option 'caps:ctrl_modifier'
  xcape -e 'Caps_Lock=Escape;Control_L=Escape;Control_R=Escape'
fi
