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
alias grep='grep --color=auto'
alias ll='ls -la'
alias lr='ls -latr'

#### BASH CONFIGURATION - END ####

# Source global bashrc if it exists
if [ -f /etc/bashrc ]; then
  source /etc/bashrc
fi

# Check if Ruby is installed and set path if it is
if which ruby >/dev/null && which gem >/dev/null; then
  PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# Check if GO is installed
command -v go >/dev/null 2>&1
GO_CHECK=$?

if [ $GO_CHECK -eq 0 ]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$HOME/go/bin
fi

#### LINUX OS Check ####

if [[ $(uname) == "Linux" ]]; then
  if [ -f "$HOME"/.bash-git-prompt/gitprompt.sh ]; then
    GIT_PROMPT_BIN_PATH=$HOME/.bash-git-prompt
  fi
  PATH=$PATH:$HOME/.local/bin:$HOME/bin
  export PATH
  if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
  alias ls="ls --color=auto"
fi

#### LINUX OS Check - END ####

#### MacOS OS Check ####

if [[ $(uname) == "Darwin" ]]; then
  if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
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
  alias update="pip list --outdated --local | awk 'NR>2' | awk '{print $1}' | xargs pip install -U; deactivate; sudo softwareupdate -i -a; brew update; brew upgrade; brew cask upgrade; brew cleanup"

  # Test for https://www.passwordstore.org/
  # test -e "/usr/local/etc/bash_completion.d/pass" && source "/usr/local/etc/bash_completion.d/pass"

  # https://github.com/ansible/ansible/issues/31869
  export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
fi

#### MacOS OS Check - END ####

#### Linux Hombrew
if [[ $(uname) == "Linux" ]]; then
  if [ -d /home/linuxbrew ]; then
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
fi

#### Git Prompt Settings ####

if [[ $GIT_PROMPT_BIN_PATH ]]; then
  # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence
  GIT_PROMPT_FETCH_REMOTE_STATUS=0 # uncomment to avoid fetching remote status
  # GIT_PROMPT_SHOW_CHANGED_FILES_COUNT=0 # uncomment to avoid printing the number of changed files
  # GIT_PROMPT_SHOW_UNTRACKED_FILES=all # can be no, normal or all; determines counting of untracked files
  # GIT_PROMPT_SHOW_UPSTREAM=1 # uncomment to show upstream tracking branch
  # GIT_PROMPT_START=...    # uncomment for custom prompt start sequence
  # GIT_PROMPT_STATUS_COMMAND=gitstatus_pre-1.7.10.sh # uncomment to support Git older than 1.7.10
  # GIT_PROMPT_THEME_FILE=$HOME/.git-prompt-colors.sh
  GIT_PROMPT_ONLY_IN_REPO=1
  GIT_PROMPT_THEME="Minimal"

  __GIT_PROMPT_DIR=$GIT_PROMPT_BIN_PATH
  source "$GIT_PROMPT_BIN_PATH"/gitprompt.sh
fi

#### Git Prompt Settings - END ####

if [[ $- == *i* ]]; then
  # Define colors for non git prompts
  black="$(tput setaf 0)"
  red="$(tput setaf 1)"
  green="$(tput setaf 2)"
  yellow="$(tput setaf 3)"
  blue="$(tput setaf 4)"
  magenta="$(tput setaf 5)"
  cyan="$(tput setaf 6)"
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
  source "$PYTHON3_VIRTUALENV_DIR"/bin/activate
  $PYTHON_PIP_CMD install --upgrade pip
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
  builtin cd "$@"
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
      source ./venv/bin/activate
      export VIRTUAL_ENV="$PWD/venv"
    # If we are not in an existing virtual environment, source venv
    else
      source ./venv/bin/activate
      export VIRTUAL_ENV="$PWD/venv"
    fi
  # If there is not a venv directory setup our default environment back up
  elif [ "$VIRTUAL_ENV" ]; then
    unset DISABLE_ENV
    parentdir="$(dirname "$VIRTUAL_ENV")"
    if [[ "$PWD"/ != "$parentdir"/* ]]; then
      deactivate
      source "$DEFAULT_VIRTUALENV"/bin/activate
    fi
  # If virtual environment is not disabled, ask whether we should enable our default
  # This is useful when you'd like to not be in a virtual environment
  else
    if [ ! "$DISABLE_ENV" ]; then
      read -p "Enable default Python virtualenv (y/n)?" REPLY
      if [[ "$REPLY" == "y" || "$REPLY" == "yes" ]]; then
        source "$DEFAULT_VIRTUALENV"/bin/activate
      else
        export DISABLE_ENV="True"
      fi
    fi
  fi
}

# Source our default Python virtual environment
source "$DEFAULT_VIRTUALENV"/bin/activate

# Capture existing Python packages installed from our default virtual environment
$PYTHON_PIP_CMD freeze >"$HOME"/.dotfiles/requirements.txt

# Capture existing VSCode extensions
if [ -x "$(command -v code)" ]; then
  code --list-extensions >"$HOME"/.dotfiles/Code/extensions.list
fi

# added by travis gem
[ -f "$HOME"/.travis/travis.sh ] && source "$HOME"/.travis/travis.sh
