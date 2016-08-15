#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#aliases

#make sudo expand aliases http://unix.stackexchange.com/a/148548
alias sudo='sudo '

# Colorize ls outputs
alias ls='ls -GpFh'

alias g=git
alias v=vim
alias vi=vim
alias p=pacman
alias gvim='/Applications/MacVim.app/Contents/MacOS/Vim -g'
alias up="cd .."
# If you pipe colored output to less, keep the colors
alias less="less -r"
#functions

# gdiff is diff styled like git diff
function gdiff () { diff -u $@ | colordiff | less -R; }

# weather from the terminal yo
function weather () { curl http://wttr.in/$@; }

# make a directory and cd to it with one command
function mkcd () { mkdir $1; cd $1; }

# write history to ~/.bash_history after every command. Ensures history is saved across multiple terminals
# http://northernmost.org/blog/flush-bash_history-after-each-command/
export PROMPT_COMMAND='history -a'

#this is necessary for i3-nagbar. It executes its commands in i3-sensible-terminal. i3-sensible-terminal runs either the command set in $TERMINAL or falls back to some default terminals. 
export TERMINAL='termite'

# unlimited bash history, just keep appending
unset HISTSIZE 
unset HISTFILESIZE
shopt -s histappend
# /unlimited bash history, just keep appending

# Styling the console prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

