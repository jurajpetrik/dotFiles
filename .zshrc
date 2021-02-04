# If you come from bash you might have to change your $PATH.
# Path to your oh-my-zsh installation.
  export ZSH="/Users/juarjpetrik/.oh-my-zsh"

export PATH="${PATH}:${HOME}/.krew/bin"

ZSH_THEME="garyblessington"

plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh
source ~/.alias

# https://github.com/ohmyzsh/ohmyzsh/issues/31
unsetopt nomatch

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/juarjpetrik/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/juarjpetrik/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/juarjpetrik/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/juarjpetrik/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
