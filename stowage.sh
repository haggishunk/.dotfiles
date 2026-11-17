#!/usr/bin/env bash
#
case $1 in
    delete) STOW_ACTION="-D" ;;
    restow) STOW_ACTION="-R" ;;
    *) STOW_ACTION="-S" ;;
esac

for HOME_DIR in git_template editorconfig X11; do
    stow "$STOW_ACTION" \
        -t ~ \
        -d home \
        "$HOME_DIR"
done

for XDG_DIR in nvim fish foot ghostty iterm2-config starship yamllint yamlfmt sway tmux; do
    if ! test -d ~/.config/$XDG_DIR; then
        echo "Creating ~/.config/$XDG_DIR..."
        mkdir -p ~/.config/$XDG_DIR
    fi
    stow "$STOW_ACTION" \
        -t ~/.config/$XDG_DIR/ \
        -d config \
        "$XDG_DIR"
done

stow "$STOW_ACTION" -t ~/.config/fish/functions -d config fish-functions
stow "$STOW_ACTION" -t ~/.config/fish/completions -d config fish-completions
stow "$STOW_ACTION" -t ~/.ipython/profile_default -d ipython profile_default
