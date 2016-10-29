#
# ~/.bash_profile
#
PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.5/bin"
PATH="$PATH:/opt/homebrew-cask/Caskroom/mysqlworkbench/6.3.6/MySQLWorkbench.app/Contents/MacOS"
PATH="$PATH:/home/juraj/.gem/ruby/2.3.0/bin"

if [ -z "$TMUX" ] && ["$OSTYPE" == "linux"*] ; then
  # not in tmux, do non-tmux things
  startx
fi
