#
# ~/.bash_profile
#
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -z "$TMUX" ]; then
  # not in tmux, do non-tmux things
  startx
fi
