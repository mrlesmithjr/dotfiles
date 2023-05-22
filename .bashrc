#!/bin/bash
# .bashrc

#### BASH CONFIGURATION ####

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# If set, Bash attempts to save all lines of a multiple-line command in the same
# history entry. This allows easy re-editing of multi-line commands.
shopt -s cmdhist

# no duplicate entries
export HISTCONTROL="erasedups:ignoreboth"

# Set large history sizes
export HISTSIZE=1000000
export HISTFILESIZE=9000000

# Path to your dotfiles installation.
export DOTFILES_DIR="$HOME/.dotfiles"

# Python Poetry settings
# https://python-poetry.org/docs/master/configuration/#using-environment-variables
export POETRY_VIRTUALENVS_IN_PROJECT=true

# Source global bashrc if it exists
if [ -f /etc/bashrc ]; then
	# shellcheck source=/dev/null
	source /etc/bashrc
fi

#### LINUX OS Check ####

if [[ $(uname) == "Linux" ]]; then
	if [ -f "$HOME"/.bash-git-prompt/gitprompt.sh ]; then
		GIT_PROMPT_BIN_PATH=$HOME/.bash-git-prompt
	fi
	PATH=$PATH:$HOME/.local/bin:$HOME/bin
	export PATH
	if [ -f "$HOME/.tfenv/bin/tfenv" ]; then
		if ! command -v tfenv &>/dev/null; then
			export PATH=$HOME/.tfenv/bin:$PATH
		fi
	fi
	if [ -f /etc/bash_completion ]; then
		# shellcheck disable=SC1091
		. /etc/bash_completion
	fi
	alias ls="ls --color=auto"
fi

#### LINUX OS Check - END ####

#### MacOS OS Check ####

if [[ $(uname) == "Darwin" ]]; then
	if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
		# shellcheck source=/dev/null
		source "$(brew --prefix)/etc/bash_completion"
	fi
	if [ -f "$(brew --prefix)/opt/bash-git-prompt/share/gitprompt.sh" ]; then
		GIT_PROMPT_BIN_PATH="$(brew --prefix)/opt/bash-git-prompt/share"
	fi

	# Add color to folders/files
	alias ls='ls -G'
fi

#### MacOS OS Check - END ####

#### Linux Hombrew
if [[ $(uname) == "Linux" ]]; then
	if [ -d /home/linuxbrew ]; then
		test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
	fi
fi

#### Git Prompt Settings ####

if [[ $GIT_PROMPT_BIN_PATH ]]; then
	# GIT_PROMPT_END=...      # uncomment for custom prompt end sequence
	# shellcheck disable=SC2034
	GIT_PROMPT_FETCH_REMOTE_STATUS=0 # uncomment to avoid fetching remote status
	# GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files
	# GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files
	# GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
	# GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
	# GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10
	# GIT_PROMPT_THEME_FILE=$HOME/.git-prompt-colors.sh
	# shellcheck disable=SC2034
	GIT_PROMPT_ONLY_IN_REPO=1
	# shellcheck disable=SC2034
	GIT_PROMPT_THEME="Minimal"

	# shellcheck disable=SC2034
	__GIT_PROMPT_DIR=$GIT_PROMPT_BIN_PATH
	# shellcheck source=/dev/null
	source "$GIT_PROMPT_BIN_PATH"/gitprompt.sh
fi

#### Git Prompt Settings - END ####

if [[ $- == *i* ]]; then
	# Define colors for non git prompts
	# shellcheck disable=SC2034
	black="$(tput setaf 0)"
	# shellcheck disable=SC2034
	red="$(tput setaf 1)"
	# shellcheck disable=SC2034
	green="$(tput setaf 2)"
	# shellcheck disable=SC2034
	yellow="$(tput setaf 3)"
	# shellcheck disable=SC2034
	blue="$(tput setaf 4)"
	# shellcheck disable=SC2034
	magenta="$(tput setaf 5)"
	# shellcheck disable=SC2034
	cyan="$(tput setaf 6)"
	# shellcheck disable=SC2034
	white="$(tput setaf 7)"

	reset="$(tput sgr0)"

	# Custom prompt
	export PS1="\u${white}@\h:${cyan}[\W]:${reset}\\$ "
fi

export PYENV_ROOT="$HOME/.pyenv"

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

# Enable kubectl auto completion
if [[ -x "$(command -v kubectl)" ]]; then
	# shellcheck source=/dev/null
	source <(kubectl completion bash)
fi

# Export current Python packages installed into a useful Poetry format
function pyreqstopoetry {
	# This is not an ideal solution (currently) to export into production/development specific
	# requirements.

	CURRENT_TIME=$(date +"%Y.%m.%d-%H.%M.%S")

	# Capture all Python packages currently installed
	pip3 list --not-required --format freeze --exclude lockfile --exclude pip --exclude setuptools >"requirements.txt.${CURRENT_TIME}"

	# Install Poetry
	pip3 install poetry

	# Verify that Poetry has been initialized
	if [ ! -f pyproject.toml ]; then
		poetry init -n
	fi

	# Add all currently install Python packages to Poetry
	# cat "requirements.txt.${CURRENT_TIME}" | grep -E '^[^# ]' | cut -d= -f1 | xargs -n 1 poetry add
	cat "requirements.txt.${CURRENT_TIME}" | grep -E '^[^# ]' | cut -d";" -f1 | xargs -n 1 poetry add

	# Make a backup copy of an existing requirements.txt file for future reference
	if [ -f requirements.txt ]; then
		mv requirements.txt "requirements.txt.${CURRENT_TIME}.old"
	fi

	# Export Poetry packages back out to a new requirements.txt
	poetry export --without-hashes >requirements.txt
}

# Load 1password CLI plugins
# shellcheck source=/dev/null
# if [ -f "$HOME/.config/op/plugins.sh" ]; then
# 	source "$HOME/.config/op/plugins.sh"
# fi

# Enable 1password CLI auto completion
# shellcheck source=/dev/null
# if [[ -x "$(command -v op)" ]]; then
# 	source <(op completion bash)
# fi

# Enable limactl auto completions
# shellcheck source=/dev/null
if [[ -x "$(command -v limactl)" ]]; then
	source <(limactl completion bash)
fi
