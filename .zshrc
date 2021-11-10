export ZSH=$HOME/.oh-my-zsh

# Path to your dotfiles installation.
export DOTFILES_DIR="$HOME/.dotfiles"

# Python Poetry settings
# https://python-poetry.org/docs/master/configuration/#using-environment-variables
export POETRY_VIRTUALENVS_IN_PROJECT=true

# skip the verification of insecure directories
# shellcheck disable=SC2034
ZSH_DISABLE_COMPFIX="true"

if [[ -d "$HOME"/powerlevel10k ]]; then
	source "$HOME"/powerlevel10k/powerlevel10k.zsh-theme
else
	# ZSH_THEME="robbyrussell"
	# ZSH_THEME="agnoster"
	# ZSH_THEME="af-magic"
	# ZSH_THEME="pygmalion"
	# shellcheck disable=SC2034
	#ZSH_THEME="avit"
	ZSH_THEME="ys"
fi

# shellcheck disable=SC2034
# plugins=(docker git nomad pip python terraform vagrant)

# shellcheck source=/dev/null
source "$ZSH"/oh-my-zsh.sh

#### MacOS OS Check ####

if [[ $(uname) == "Darwin" ]]; then
	# Add color to folders/files
	alias ls='ls -G'
	# Get macOS architecture for specific pathing, etc.
	ARCH=$(arch)

	if [[ "${ARCH}" == "arm64" ]]; then
		if [ -f "/opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
			source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
		fi
		if [ -f "/opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
			source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		fi
		if [ -d "/opt/homebrew/bin" ]; then
			export PATH="/opt/homebrew/bin:$PATH"
		fi
	elif [[ "${ARCH}" == "x86_64" || "${ARCH}" == "i386" ]]; then
		if [ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
			# shellcheck disable=SC1094
			source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
		fi
		if [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
			# shellcheck disable=SC1094
			source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
		fi
		if [ -d "/usr/local/sbin" ]; then
			export PATH="/usr/local/sbin:$PATH"
		fi
	fi

	# shellcheck source=/dev/null
	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
fi

#### MacOS OS Check - END ####

#### Linux Hombrew
if [[ $(uname) == "Linux" ]]; then
	if [ -d /home/linuxbrew ]; then
		test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	fi
fi

export PYENV_ROOT="$HOME/.pyenv"

if [ ! -d "$PYENV_ROOT" ]; then
	git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
	git clone https://github.com/pyenv/pyenv-update.git "$PYENV_ROOT/plugins/pyenv-update"
	git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	DEFAULT_PYTHON_VERSION=$(pyenv install --list | grep -v - | grep -v a | grep -v b | grep -v mini | grep -v rc | tail -1 | awk '{ print $1 }')
	pyenv install "$DEFAULT_PYTHON_VERSION"
	pyenv global "$DEFAULT_PYTHON_VERSION"
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
	pip install --upgrade pip pip-tools
	pip-sync "$DOTFILES_DIR/requirements.txt"
else
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
fi

# Capture existing VSCode extensions
# Skip if running in WSL
if [ -x "$(command -v code)" ] && [[ "$(uname -r)" != *"microsoft"* ]]; then
	code --list-extensions >"$HOME"/.dotfiles/Code/extensions.list
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable kubectl auto completion
if [[ -x "$(command -v kubectl)" ]]; then
	source <(kubectl completion zsh)
fi
