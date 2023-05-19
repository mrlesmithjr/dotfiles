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

    if [[ $(uname) == "Darwin" ]]; then
        ARCH=$(arch)
        if [[ "${ARCH}" == "arm64" ]]; then
            HOMEBREW_PATH="/opt/homebrew"
            if [ -d "$HOMEBREW_PATH" ]; then
                sudo rm -rf "$HOMEBREW_PATH"
            fi
        fi
    fi
fi

if [ -L "$HOME/.atom" ]; then
    rm "$HOME/.atom"
fi
if [ -L "$HOME/.bash_profile" ]; then
    rm "$HOME/.bash_profile"
fi
if [ -L "$HOME/.bashrc" ]; then
    rm "$HOME/.bashrc"
fi
if [ -L "$HOME/.Brewfile" ]; then
    rm "$HOME/.Brewfile"
fi
if [ -L "$HOME/.git-template" ]; then
    rm "$HOME/.git-template"
fi
if [ -L "$HOME/.gitconfig" ]; then
    rm "$HOME/.gitconfig"
fi
if [ -L "$HOME/.gitignore_global" ]; then
    rm "$HOME/.gitignore_global"
fi
if [ -L "$HOME/.hyper.js" ]; then
    rm "$HOME/.hyper.js"
fi
if [ -L "$HOME/.macos" ]; then
    rm "$HOME/.macos"
fi
if [ -L "$HOME/.p10k.zsh" ]; then
    rm "$HOME/.p10k.zsh"
fi
if [ -L "$HOME/.pylintrc" ]; then
    rm "$HOME/.pylintrc"
fi
if [ -L "$HOME/.rubocop.yml" ]; then
    rm "$HOME/.rubocop.yml"
fi
if [ -L "$HOME/.tmux.conf" ]; then
    rm "$HOME/.tmux.conf"
fi
if [ -L "$HOME/.vim" ]; then
    rm "$HOME/.vim"
fi
if [ -L "$HOME/.vimrc" ]; then
    rm "$HOME/.vimrc"
fi
if [ -L "$HOME/.yamllint.yml" ]; then
    rm "$HOME/.yamllint.yml"
fi
if [ -L "$HOME/.zshrc" ]; then
    rm "$HOME/.zshrc"
    touch "$HOME/.zshrc"
fi
if [ -L "$HOME/.config/yamllint/config" ]; then
    rm "$HOME/.config/yamllint/config"
fi

if [[ $(uname) == "Darwin" ]]; then
    if [ -L "$HOME/Library/Application Support/Code/User/extensions.list" ]; then
        rm "$HOME/Library/Application Support/Code/User/extensions.list"
    fi
    if [ -L "$HOME/Library/Application Support/Code/User/keybindings.json" ]; then
        rm "$HOME/Library/Application Support/Code/User/keybindings.json"
    fi
    if [ -L "$HOME/Library/Application Support/Code/User/settings.json" ]; then
        rm "$HOME/Library/Application Support/Code/User/settings.json"
    fi
    if [ -L "$HOME/Library/Application Support/Code/User/vsicons.settings.json" ]; then
        rm "$HOME/Library/Application Support/Code/User/vsicons.settings.json"
    fi
elif [[ $(uname) == "Linux" ]]; then
    if [ -L "$HOME/.config/Code/User/extensions.list" ]; then
        rm "$HOME/.config/Code/User/extensions.list"
    fi
    if [ -L "$HOME/.config/Code/User/keybindings.json" ]; then
        rm "$HOME/.config/Code/User/keybindings.json"
    fi
    if [ -L "$HOME/.config/Code/User/settings.json" ]; then
        rm "$HOME/.config/Code/User/settings.json"
    fi
    if [ -L "$HOME/.config/Code/User/vsicons.settings.json" ]; then
        rm "$HOME/.config/Code/User/vsicons.settings.json"
    fi
fi

if [ -d "$HOME/.bash-git-prompt" ]; then
    rm -rf "$HOME/.bash-git-prompt"
fi
if [ -d "$HOME/.oh-my-zsh" ]; then
    rm -rf "$HOME/.oh-my-zsh"
fi
if [ -d "$HOME/.pyenv" ]; then
    rm -rf "$HOME/.pyenv"
fi
if [ -d "$HOME/powerlevel10k" ]; then
    rm -rf "$HOME/powerlevel10k"
fi

# Cleanup macOS settings from .macos file
if [[ $(uname) == "Darwin" ]]; then
    # Reset iTerm2 to default settings
    defaults delete com.googlecode.iterm2
    # Reset dock to defaults
    defaults delete com.apple.dock; killall Dock
    # Reset terminal to defaults
    defaults delete com.apple.terminal
fi
