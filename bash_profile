source ~/.bash/aliases
source ~/.bash/functions
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/history_config


eval $(docker-machine env default)

# rbenv: enable shims and autocompletion
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
