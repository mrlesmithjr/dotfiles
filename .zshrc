# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Oh-my-zsh plugins ###
# These need to load at the top (here) otherwise they do not work
# shellcheck disable=SC2034
plugins=(1password ansible docker docker-compose git kubectl poetry terraform vagrant vault vscode zsh-autocomplete zsh-autosuggestions zsh-syntax-highlighting)

### Exports ###
export BREWFILE="$HOME/.Brewfile"
export DOTFILES_DIR="$HOME/.dotfiles"
export POETRY_VIRTUALENVS_IN_PROJECT=true
export PYENV_ROOT="$HOME/.pyenv"
export TFENV_DIR="$HOME/.tfenv/bin"
export ZSH="$HOME/.oh-my-zsh"

### ZSH ###
ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME="ys"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ -f "$HOME/.p10k.zsh" ]; then
	source "$HOME/.p10k.zsh"
fi

# Load functions
fpath=("$HOME/.zsh/functions" $fpath)
autoload $HOME/.zsh/functions/*

### Linux ###
if [[ $(uname) == "Linux" ]]; then
	HOMEBREW_PATH="/home/linuxbrew"
	if [ -d "$HOMEBREW_PATH" ]; then
		test -d "$HOMEBREW_PATH/.linuxbrew" && eval "$($HOMEBREW_PATH/.linuxbrew/bin/brew shellenv)"
	fi
	export PATH=$PATH:$HOME/.local/bin:$HOME/bin
fi

### macOS ###
if [[ $(uname) == "Darwin" ]]; then
	# Add color to folders/files
	alias ls='ls -G'
	# Get macOS architecture for specific pathing, etc.
	ARCH=$(arch)

	if [[ "${ARCH}" == "arm64" ]]; then
		HOMEBREW_PATH="/opt/homebrew"
	elif [[ "${ARCH}" == "x86_64" || "${ARCH}" == "i386" ]]; then
		HOMEBREW_PATH="/usr/local"
	fi

	if [ -d "$HOMEBREW_PATH/bin" ]; then
		export PATH="$HOMEBREW_PATH/bin:$PATH"
	fi

	if [ -d "$HOMEBREW_PATH/sbin" ]; then
		export PATH="$HOMEBREW_PATH/sbin:$PATH"
	fi

	# shellcheck source=/dev/null
	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

	# Required for Ruby to function correctly on macOS
	# https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/#start-here-if-you-choose-the-long-and-manual-route
	if [ -d "$HOMEBREW_PATH/opt/chruby/share/chruby" ]; then
		source $HOMEBREW_PATH/opt/chruby/share/chruby/chruby.sh
		source $HOMEBREW_PATH/opt/chruby/share/chruby/auto.sh
		chruby ruby-3.2.2
	fi
fi

### 1Password ###
if [[ $(uname) == "Darwin" ]]; then
	if [ -e ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ]; then
		if [ ! -d ~/.1password ]; then
			mkdir -p ~/.1password
			ln -s ~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock ~/.1password/agent.sock
		fi
	fi
	if [ -e ~/.1password/agent.sock ]; then
		export SSH_AUTH_SOCK=~/.1password/agent.sock
	fi
fi

### Docker ###
if [ -d "$HOME/.docker/bin" ]; then
	export PATH=$HOME/.docker/bin:$PATH
fi

### Homebrew Backup ###
# We run this to ensure we do not forget to - less than ideal but only if older than 7 days
if [[ -x "$(command -v brew)" ]]; then
	# Check to ensure our BREWFILE is present as a file or symlink
	if [[ -f "$BREWFILE" || -L "$BREWFILE" ]]; then
		if [[ $(find "$BREWFILE" -mtime +7 -print) ]]; then
			brew bundle dump --file "$BREWFILE" --force
		fi
	else
		brew bundle dump --file "$BREWFILE" --force
	fi
	# Load brew autocompletions
	FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi

### Mackup Backup ###
# We run this to ensure we do not forget to - less than ideal
if [[ -x "$(command -v mackup)" ]]; then
	mackup backup --force
fi

### Pyenv ###
# Call pyenv-init function
pyenv-init

### tfenv ###
# Useful when installed manually - https://github.com/tfutils/tfenv#manual
if [ -f "$TFENV_DIR/tfenv" ]; then
	if ! command -v tfenv &>/dev/null; then
		export PATH=$TFENV_DIR:$PATH
	fi
fi

### Oh-my-zsh ###
# Keep at the end to ensure it loads everything correctly
if [ -f "$ZSH/oh-my-zsh.sh" ]; then
	source "$ZSH/oh-my-zsh.sh"
fi
