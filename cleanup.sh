#!/bin/bash
set -e
set -x

set +e
command -v brew >/dev/null 2>&1
BREW_CHECK=$?
if [ $BREW_CHECK -eq 0 ]; then
    brew uninstall --cask "$(brew list --cask)" --force
    brew uninstall "$(brew list --formula)" --force --ignore-dependencies
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"
fi

rm "$HOME/.atom"
rm "$HOME/.bash_profile"
rm "$HOME/.bashrc"
rm "$HOME/.Brewfile"
rm "$HOME/.git-template"
rm "$HOME/.gitconfig"
rm "$HOME/.gitignore_global"
rm "$HOME/.hyper.js"
rm "$HOME/.macos"
rm "$HOME/.p10k.zsh"
rm "$HOME/.pylintrc"
rm "$HOME/.rubocop.yml"
rm "$HOME/.tmux.conf"
rm "$HOME/.vim"
rm "$HOME/.vimrc"
rm "$HOME/.yamllint.yml"
rm "$HOME/.zshrc"

rm -rf "$HOME/.bash-git-prompt"
rm -rf "$HOME/.oh-my-zsh"
rm -rf "$HOME/powerlevel10k"
