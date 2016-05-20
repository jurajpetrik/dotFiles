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

# Styling the console prompt
PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] \[\e[1;37m\]'

# gdiff is diff styled like git diff
function gdiff () { diff -u $@ | colordiff | less -R; }
