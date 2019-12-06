# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/juraj/.oh-my-zsh"

ZSH_THEME="garyblessington"

plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh
source ~/.alias
# When Caps + key is pressed, it acts as Ctrl (this is set in gnome tweak tools)
# When Caps only is pressed it acts as Escape 
xcape -e 'Control_L=Escape'

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm


# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /home/juraj/src/customink/represent_image_processor_lambda/app/node_modules/tabtab/.completions/serverless.zsh ]] && . /home/juraj/src/customink/represent_image_processor_lambda/app/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /home/juraj/src/customink/represent_image_processor_lambda/app/node_modules/tabtab/.completions/sls.zsh ]] && . /home/juraj/src/customink/represent_image_processor_lambda/app/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /home/juraj/src/customink/represent_image_processor_lambda/app/node_modules/tabtab/.completions/slss.zsh ]] && . /home/juraj/src/customink/represent_image_processor_lambda/app/node_modules/tabtab/.completions/slss.zsh
