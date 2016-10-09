
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# source aliases
source ~/.alias
# Environment variables

# write history to ~/.bash_history after every command. Ensures history is saved across multiple terminals
# http://northernmost.org/blog/flush-bash_history-after-each-command/
export PROMPT_COMMAND='history -a'

#this is necessary for i3-nagbar. It executes its commands in i3-sensible-terminal. i3-sensible-terminal runs either the command set in $TERMINAL or falls back to some default terminals. 
export TERMINAL='termite'

export GIT_EDITOR='vim'
export EDITOR='vim'
unset HISTSIZE 
unset HISTFILESIZE

# /unlimited bash history, just keep appending
shopt -s histappend

# Styling the console prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

eval $(thefuck --alias)
