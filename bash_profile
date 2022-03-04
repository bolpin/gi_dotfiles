echo ".bash_profile"

source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/history_config
source ~/private_config

#[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

eval "$(rbenv init -)"

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

