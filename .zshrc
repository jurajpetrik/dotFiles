# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/Users/juraj/.oh-my-zsh"

ZSH_THEME="garyblessington"

plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh
source ~/.alias
# When Caps + key is pressed, it acts as Ctrl (this is set in gnome tweak tools)
# When Caps only is pressed it acts as Escape 
# xcape -e 'Control_L=Escape'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
