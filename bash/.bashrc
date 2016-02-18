#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


#aliases

# Colorize ls outputs
alias ls='ls --color=auto'

alias g=git
alias v=vim
alias p=pacman

# Styling the console prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

