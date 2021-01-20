# do not overwrite files
set -o noclobber

# Source envs
[ -f ~/.bash_env ] && . ~/.bash_env

# Source .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc
