# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### Oh-my-zsh plugins ###
# These need to load at the top (here) otherwise they do not work
# shellcheck disable=SC2034
plugins=(1password ansible docker docker-compose git kubectl poetry terraform vagrant vault vscode)

### Exports ###
export BREWFILE="$HOME/.Brewfile"
export DOTFILES_DIR="$HOME/.dotfiles"
export POETRY_VIRTUALENVS_IN_PROJECT=true
export PYENV_ROOT="$HOME/.pyenv"
export TFENV_DIR="$HOME/.tfenv/bin"
export ZSH="$HOME/.oh-my-zsh"

### ZSH ###
if [[ -d "$HOME/powerlevel10k" ]]; then
	source "$HOME/powerlevel10k/powerlevel10k.zsh-theme"
else
	ZSH_THEME="ys"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [ -f "$HOME/.p10k.zsh" ]; then
	source "$HOME/.p10k.zsh"
fi

### Linux ###
if [[ $(uname) == "Linux" ]]; then
	HOMEBREW_PATH="$HOME/linuxbrew"
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

	if [ -f "$HOMEBREW_PATH/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
		source "$HOMEBREW_PATH/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
	fi

	if [ -f "$HOMEBREW_PATH/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
		source "$HOMEBREW_PATH/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
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
# Load 1password CLI plugins
if [ -f "$HOME/.config/op/plugins.sh" ]; then
	source "$HOME/.config/op/plugins.sh"
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
	mackup backup
fi

### Pyenv ###
if [ ! -d "$PYENV_ROOT" ]; then
	git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
	git clone https://github.com/pyenv/pyenv-update.git "$PYENV_ROOT/plugins/pyenv-update"
	git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	if [ -f "$DOTFILES_DIR/.python-version" ]; then
		pyenv install "$(cat "$DOTFILES_DIR/.python-version")"
		pyenv global "$(cat "$DOTFILES_DIR/.python-version")"
	else
		DEFAULT_PYTHON_VERSION=$(pyenv install --list | grep -v - | grep -v a | grep -v b | grep -v mini | grep -v rc | tail -1 | awk '{ print $1 }')
		pyenv install "$DEFAULT_PYTHON_VERSION"
		pyenv global "$DEFAULT_PYTHON_VERSION"
	fi
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
	pip install --upgrade pip pip-tools
	pip-sync "$DOTFILES_DIR/requirements.txt" "$DOTFILES_DIR/requirements-dev.txt"
else
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
	if which brew >/dev/null; then
		alias brew='env PATH=${PATH//$(pyenv root)\/shims:/} brew'
	fi
fi

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
