echo ".bash_profile"

source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/history_config


#[[ -s "$HOME/.profile" ]] && source "$HOME/.profile" # Load the default .profile

eval "$(rbenv init -)"

export DEV_DYNAMODB_PORT = 8543

export GITLAB_ACCESS_TOKEN=1jShRch8YY2-SzwLhV9b
export AWS_PROFILE=oktad
source authaws
