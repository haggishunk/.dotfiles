fish_vi_key_bindings

# spacefish
set -gx SPACEFISH_PROMPT_ORDER time user dir host git venv rust node docker golang aws kubecontext line_sep battery char
set -gx SPACEFISH_GIT_SYMBOL ' '
set -gx SPACEFISH_VENV_SYMBOL ' '
set -gx SPACEFISH_VENV_SHOW true
set -gx SPACEFISH_VENV_GENERIC_NAMES .virtualenvs
set -gx SPACEFISH_KUBECONTEXT_SYMBOL 'ﴱ '
set -gx SPACEFISH_VI_MODE_SHOW false
set -gx SPACEFISH_PACKAGE_SYMBOL ' '
set -gx SPACEFISH_GOLANG_SYMBOL ' '
set -gx SPACEFISH_RUST_SYMBOL ' '
set -gx SPACEFISH_CHAR_SYMBOL 
set -gx SPACEFISH_AWS_SYMBOL ' '
set -gx SPACEFISH_NODE_SHOW true

eval (direnv hook fish)

if test -f ~/.config/fish/env.fish
    source ~/.config/fish/env.fish
end

if test -f ~/.config/fish/local.fish
    source ~/.config/fish/local.fish
end
