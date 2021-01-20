#
# ~/.bashrc
#
# Bashrc is custom to each host and serves as the default
# hopping off point for terminal customization
# 
# - Source separate categories from here
# - Specify host-specific env vars in .bash_env, called in 
#   .bash_profile (do not put in online version control!!!!)
# - Use .bash_local for special things that only make sense
#   with the local host

# If not running interactively, don't do anything else
[[ $- != *i* ]] && return

# Alias defs
[ -f ~/.bash_aliases ] && . ~/.bash_aliases

# Function defs
[ -f ~/.bash_functions ] && . ~/.bash_functions

# Custom bash prompt
[ -f ~/.bash_prompt ] && . ~/.bash_prompt

# Customize for local machine
[ -f ~/.bash_local ] && . ~/.bash_local

