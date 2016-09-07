#
# ~/.bash_profile
#
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin"
PATH="$PATH:/opt/homebrew-cask/Caskroom/mysqlworkbench/6.3.6/MySQLWorkbench.app/Contents/MacOS"
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi

if [ -z "$TMUX" ]; then
  # not in tmux, do non-tmux things
  startx
fi
