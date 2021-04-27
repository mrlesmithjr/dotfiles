export ZSH=$HOME/.oh-my-zsh

# Path to your dotfiles installation.
export DOTFILES_DIR="$HOME/.dotfiles"

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
plugins=(docker git nomad pip python terraform vagrant)

# shellcheck source=/dev/null
source "$ZSH"/oh-my-zsh.sh

# Check if Ruby is installed and set path if it is
if command -v ruby >/dev/null && command -v gem >/dev/null; then
	PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Check if GO is installed
if [[ -x "$(command -v go)" ]]; then
	export GOPATH=$HOME/go
	if [[ ! -d "$GOPATH" ]]; then
		mkdir -p "$GOPATH"/{bin,src}
	fi
	export PATH=$PATH:$HOME/go/bin
fi

# Export path to kubectl krew plugin
if [[ -d "$HOME/.krew/bin" ]]; then
	export PATH=$PATH:$HOME/.krew/bin
fi

# Enable kubectl auto completion
if [[ -x "$(command -v kubectl)" ]]; then
	source <(kubectl completion zsh)
fi

# Ensure default .kube directory exists
if [ ! -d "$HOME/.kube" ]; then
	mkdir "$HOME/.kube"
fi

# Set the default kube context if present
DEFAULT_KUBE_CONTEXTS="$HOME/.kube/config"
if [ ! -f "$DEFAULT_KUBE_CONTEXTS" ]; then
	touch "$DEFAULT_KUBE_CONTEXTS"
fi
export KUBECONFIG="$DEFAULT_KUBE_CONTEXTS"

# Additional contexts should be in ~/.kube/custom-contexts/
CUSTOM_KUBE_CONTEXTS="$HOME/.kube/custom-contexts"
if [ ! -d "$CUSTOM_KUBE_CONTEXTS" ]; then
	mkdir -p "$CUSTOM_KUBE_CONTEXTS"
fi

OIFS="$IFS"
IFS=$'\n'
for contextFile in $(find "${CUSTOM_KUBE_CONTEXTS}" -type f -name "*.yml"); do
	export KUBECONFIG="$KUBECONFIG:$contextFile"
done
IFS="$OIFS"

#### MacOS OS Check ####

if [[ $(uname) == "Darwin" ]]; then
	# Lock the screen (when going AFK)
	# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases#L157-L158
	alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

	# Recursively delete `.DS_Store` files
	alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

	# Flush Directory Service cache
	# https://github.com/mathiasbynens/dotfiles/blob/master/.aliases#L71-L72
	alias flush_dns="sudo killall -HUP mDNSResponder"

	# Add color to folders/files
	alias ls='ls -G'

	# Get macOS Software Updates, and update installed Ruby gems, Homebrew, Python
	# modules, npm, and their installed packages.
	# Inspired by https://github.com/mathiasbynens/dotfiles/blob/master/.aliases#L56-L57
	function update() {
		sudo softwareupdate -i -a
		brew update
		brew upgrade
		brew upgrade --cask
		brew cleanup
	}

	# Fix Homebrew permissions for multi-user
	function fix_brew_perms() {
		sudo chown -R "$(whoami)":admin "$(brew --prefix)"/*
		# sudo chmod -R +a "group:admin allow list,add_file,search,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,file_inherit,directory_inherit" $(brew --prefix)/*
		# sudo chgrp -R admin $(brew --prefix)/*
		# sudo chmod -R g+w $(brew --prefix)/*
	}

	if [ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
		# shellcheck disable=SC1094
		source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
	fi

	if [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
		# shellcheck disable=SC1094
		source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
	fi
	# shellcheck source=/dev/null
	test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

	# Test for https://www.passwordstore.org/
	# test -e "/usr/local/share/zsh/site-functions/_pass" && source "/usr/local/share/zsh/site-functions/_pass"

	# https://github.com/ansible/ansible/issues/31869
	export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

	export PATH="/usr/local/sbin:$PATH"
fi

#### MacOS OS Check - END ####

#### Linux Hombrew
if [[ $(uname) == "Linux" ]]; then
	if [ -d /home/linuxbrew ]; then
		test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	fi
fi

# Set aliases
if command -v bat &>/dev/null; then
	# alias cat=bat
	export BAT_CONFIG_PATH="$DOTFILES_DIR/bat/config"
fi

alias create_venv="python3 -m venv .venv && source .venv/bin/activate && pip3 install --upgrade pip pip-tools"
alias grep='grep --color=auto'
alias ll='ls -la'
alias lr='ls -latr'

PYENV_ROOT="$HOME/.pyenv"

if [ ! -d "$PYENV_ROOT" ]; then
	git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
	git clone https://github.com/pyenv/pyenv-update.git "$PYENV_ROOT/plugins/pyenv-update"
	git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	DEFAULT_PYTHON_VERSION=$(pyenv install --list | grep -v - | grep -v b | grep -v rc | tail -1 | awk '{ print $1 }')
	pyenv install "$DEFAULT_PYTHON_VERSION"
	pyenv global "$DEFAULT_PYTHON_VERSION"
	eval "$(pyenv init -)"
	# eval "$(pyenv virtualenv-init -)"
	pip install --upgrade pip pip-tools
	pip-sync "$DOTFILES_DIR/requirements.txt"
else
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init -)"
	# eval "$(pyenv virtualenv-init -)"
fi

# If a Python virtual environment exists called .venv, source it. Otherwise we
# will source our default virtual environment.
function cd() {
	builtin cd "$@" || return
	check_virtualenvironments
}

# Activate default virtual environment on ls if not currently in a virtual
# environment
function ls() {
	builtin command ls "$@"
	check_virtualenvironments
}

# Function to check and manipulate virtualenvs
function check_virtualenvironments() {
	# Check if .venv directory exists
	if [ -d ./.venv ] && [ -f ./.venv/bin/activate ]; then
		# If we are in an existing virtual environment deactivate it and source .venv
		if [ "$VIRTUAL_ENV" ]; then
			deactivate
			# shellcheck disable=SC1091
			source ./.venv/bin/activate
			export VIRTUAL_ENV="$PWD/.venv"
		# If we are not in an existing virtual environment, source .venv
		else
			# shellcheck disable=SC1091
			source ./.venv/bin/activate
			export VIRTUAL_ENV="$PWD/.venv"
		fi
	# If there is not a .venv directory setup our default environment back up
	elif [ "$VIRTUAL_ENV" ]; then
		unset DISABLE_ENV
		parentdir="$(dirname "$VIRTUAL_ENV")"
		if [[ "$PWD"/ != "$parentdir"/* ]]; then
			deactivate
		fi
	fi
}

# Capture existing VSCode extensions
# Skip if running in WSL
if [ -x "$(command -v code)" ] && [[ "$(uname -r)" != *"microsoft"* ]]; then
	code --list-extensions >"$HOME"/.dotfiles/Code/extensions.list
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
