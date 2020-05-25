# .bashrc

#### SETUP TOOLS ####

# Instructions for setting up various tools

## LINUX ##
#
# cd $HOME
# git clone https://github.com/magicmonty/bash-git-prompt.git .bash-git-prompt --depth=1
#
## LINUX - END ##

## MacOS ##
#
# /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# brew install bash-completion
# brew install bash-git-prompt
#
## MacOS - END ##

#### SETUP TOOLS - END ####

#### NOTES ####
#
#### NOTES - END ####

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

# Set aliases
alias create_venv="python3 -m venv venv && source venv/bin/activate && pip3 install --upgrade pip pip-tools"
alias grep='grep --color=auto'
alias ll='ls -la'
alias lr='ls -latr'

#### BASH CONFIGURATION - END ####

# Path to your dotfiles installation.
export DOTFILES="$HOME/.dotfiles"

# Ensure $HOME/.netrc exists. Do not store this in version control
if [ ! -f "$HOME/.netrc" ]; then
  touch "$HOME/.netrc"
fi

# Source global bashrc if it exists
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

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

#### LINUX OS Check ####

if [[ $(uname) == "Linux" ]]; then
  if [ -f "$HOME"/.bash-git-prompt/gitprompt.sh ]; then
    GIT_PROMPT_BIN_PATH=$HOME/.bash-git-prompt
  fi
  PATH=$PATH:$HOME/.local/bin:$HOME/bin
  export PATH
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

  brew list | grep python >/dev/null 2>&1
  PYTHON_CHECK=$?
  if [ $PYTHON_CHECK -ne 0 ]; then
    brew install python
  fi

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
    brew cask upgrade
    brew cleanup
  }

  # Fix Homebrew permissions for multi-user
  function fix_brew_perms() {
    sudo chown -R "$(whoami)":admin "$(brew --prefix)"/*
    # sudo chmod -R +a "group:admin allow list,add_file,search,add_subdirectory,delete_child,readattr,writeattr,readextattr,writeextattr,readsecurity,file_inherit,directory_inherit" $(brew --prefix)/*
    # sudo chgrp -R admin $(brew --prefix)/*
    # sudo chmod -R g+w $(brew --prefix)/*
  }

  # Test for https://www.passwordstore.org/
  # test -e "/usr/local/etc/bash_completion.d/pass" && source "/usr/local/etc/bash_completion.d/pass"

  # https://github.com/ansible/ansible/issues/31869
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
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

#### Python Virtual Environment Setup ####
# Setup a default Python virtual environment to use rather than installing
# everything in system
DEFAULT_PYTHON_VERSION="3"
VIRTUALENV_DIR="$HOME/.python-virtualenvs"
DEFAULT_VIRTUALENV="$VIRTUALENV_DIR/default"
PYTHON3_VIRTUALENV_DIR="$VIRTUALENV_DIR/default-python3"
PYTHON_PIP_CMD="pip$DEFAULT_PYTHON_VERSION"

# Check to ensure virtualenv command exists
command -v virtualenv >/dev/null 2>&1
VIRTUALENV_CMD_CHECK=$?
if [ $VIRTUALENV_CMD_CHECK -ne 0 ]; then
  if [[ $(uname) == "Darwin" ]]; then
    $PYTHON_PIP_CMD install virtualenv
  elif [[ $(uname) == "Linux" ]]; then
    sudo $PYTHON_PIP_CMD install virtualenv
  fi
fi

# Create Python3 default virtualenv
if [ ! -d "$PYTHON3_VIRTUALENV_DIR" ]; then
  if [ -f /etc/debian_version ] || [ -f /etc/redhat-release ]; then
    python3 -m venv --system-site-packages "$PYTHON3_VIRTUALENV_DIR"
  else
    python3 -m venv "$PYTHON3_VIRTUALENV_DIR"
  fi
  # shellcheck source=/dev/null
  source "$PYTHON3_VIRTUALENV_DIR"/bin/activate
  $PYTHON_PIP_CMD install --upgrade pip pip-tools
  pip-sync "$DOTFILES/requirements.txt"
  deactivate
fi

# Setup Python Virtual Environment dirs
if [ -d "$DEFAULT_VIRTUALENV" ] && [ ! -L "$DEFAULT_VIRTUALENV" ]; then
  mv "$DEFAULT_VIRTUALENV" "$DEFAULT_VIRTUALENV".backup
  ln -s "$PYTHON3_VIRTUALENV_DIR" "$DEFAULT_VIRTUALENV"
elif [ ! -d "$DEFAULT_VIRTUALENV" ]; then
  ln -s "$PYTHON3_VIRTUALENV_DIR" "$DEFAULT_VIRTUALENV"
elif [ -L "$DEFAULT_VIRTUALENV" ]; then
  if [[ "$DEFAULT_VIRTUALENV" -ef "$PYTHON3_VIRTUALENV_DIR" ]]; then
    :
  else
    rm "$DEFAULT_VIRTUALENV"
    ln -s "$PYTHON3_VIRTUALENV_DIR" "$DEFAULT_VIRTUALENV"
  fi
fi

# If a Python virtual environment exists called venv, source it. Otherwise we
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
  # Check if venv directory exists
  if [ -d ./venv ]; then
    # If we are in an existing virtual environment deactivate it and source venv
    if [ "$VIRTUAL_ENV" ]; then
      deactivate
      # shellcheck disable=SC1091
      source ./venv/bin/activate
      export VIRTUAL_ENV="$PWD/venv"
    # If we are not in an existing virtual environment, source venv
    else
      # shellcheck disable=SC1091
      source ./venv/bin/activate
      export VIRTUAL_ENV="$PWD/venv"
    fi
  # If there is not a venv directory setup our default environment back up
  elif [ "$VIRTUAL_ENV" ]; then
    unset DISABLE_ENV
    parentdir="$(dirname "$VIRTUAL_ENV")"
    if [[ "$PWD"/ != "$parentdir"/* ]]; then
      deactivate
      # shellcheck source=/dev/null
      source "$DEFAULT_VIRTUALENV"/bin/activate
    fi
  # If virtual environment is not disabled, ask whether we should enable our default
  # This is useful when you'd like to not be in a virtual environment
  else
    if [ ! "$DISABLE_ENV" ]; then
      read -p "Enable default Python virtualenv (y/n)?" REPLY
      if [[ "$REPLY" == "y" || "$REPLY" == "yes" ]]; then
        # shellcheck source=/dev/null
        source "$DEFAULT_VIRTUALENV"/bin/activate
      else
        export DISABLE_ENV="True"
      fi
    fi
  fi
}

# Source our default Python virtual environment
# shellcheck source=/dev/null
source "$DEFAULT_VIRTUALENV"/bin/activate

# Capture existing VSCode extensions
# Skip if running in WSL
if [ -x "$(command -v code)" ] && [[ "$(uname -r)" != *"microsoft"* ]]; then
  code --list-extensions >"$HOME"/.dotfiles/Code/extensions.list
fi

# added by travis gem
# shellcheck source=/dev/null
[ -f "$HOME"/.travis/travis.sh ] && source "$HOME"/.travis/travis.sh
