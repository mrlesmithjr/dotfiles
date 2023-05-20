#!/bin/bash
set -e
set -x

set +e
command -v brew >/dev/null 2>&1
BREW_CHECK=$?
if [ $BREW_CHECK -eq 0 ]; then
    brew bundle dump --file "$HOME/.Brewfile" --force
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
# if [ -L "$HOME/.mackup.cfg" ]; then
#     rm "$HOME/.mackup.cfg"
# fi
if [ -L "$HOME/.macos" ]; then
    rm "$HOME/.macos"
fi
if [ -L "$HOME/.p10k.zsh" ]; then
    rm "$HOME/.p10k.zsh"
fi
if [ -L "$HOME/.pylintrc" ]; then
    rm "$HOME/.pylintrc"
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
    # Reset battery to defaults
    defaults delete com.apple.menuextra.battery ShowPercent

    # Reset iTerm2 to default settings
    defaults delete com.googlecode.iterm2

    # Reset terminal to defaults
    defaults delete com.apple.terminal

    # Reset trackpad to defaults
    defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking
    defaults -currentHost delete NSGlobalDomain com.apple.mouse.tapBehavior
    defaults delete NSGlobalDomain com.apple.mouse.tapBehavior
    defaults delete com.apple.AppleMultitouchTrackpad TrackpadRightClick
    defaults delete com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick

    # Reset dock to defaults
    defaults delete com.apple.dock autohide
    defaults delete com.apple.dock magnification
    defaults delete com.apple.dock largesize
    killall Dock

    # Reset clock to defaults
    defaults delete com.apple.menuextra.clock "DateFormat"
    defaults delete com.apple.menuextra.clock "FlashDateSeparators"
    killall SystemUIServer

    # Activate settings rather than waiting for restarting computer
    /System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
fi
