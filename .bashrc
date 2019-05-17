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
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# If set, Bash attempts to save all lines of a multiple-line command in the same
# history entry. This allows easy re-editing of multi-line commands.
shopt -s cmdhist;

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

    # Check if pip is installed
    command -v pip >/dev/null 2>&1
    PIP_CHECK=$?

    # Check if pip2 is installed
    command -v pip2 >/dev/null 2>&1
    PIP2_CHECK=$?

    if [ $PIP_CHECK -eq 0 ]; then
        PIP_CMD=pip
        elif [ $PIP_CHECK -ne 0 ]; then
        if [ $PIP2_CHECK -eq 0 ]; then
            PIP_CMD=pip2
        fi
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
    alias update="pip freeze | xargs pip install -U; deactivate; sudo softwareupdate -i -a; brew update; brew upgrade; brew cask upgrade; brew cleanup"

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
    if [ ! -d /home/linuxbrew/.linuxbrew/var/homebrew/linked ]; then
      sudo mkdir -p /home/linuxbrew/.linuxbrew/var/homebrew/linked
      sudo chown -R $(whoami) /home/linuxbrew/.linuxbrew/var/homebrew/linked
    fi
  fi
fi

#### Git Prompt Settings ####

if [[ $GIT_PROMPT_BIN_PATH ]]; then
    # GIT_PROMPT_END=...      # uncomment for custom prompt end sequence
    GIT_PROMPT_FETCH_REMOTE_STATUS=0   # uncomment to avoid fetching remote status
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

command -v virtualenv >/dev/null 2>&1
VIRTUALENV_CHECK=$?
if [ $VIRTUALENV_CHECK -ne 0 ]; then
    if [[ $(uname) == "Darwin" ]]; then
        pip install virtualenv
        elif [[ $(uname) == "Linux" ]]; then
        sudo pip install virtualenv
    fi
fi

# Setup a default Python virtual environment to use rather than installing
# everything in system
DEFAULT_PYV="3"
VIRTUALENV_PATH="$HOME/.python-virtualenvs"
DEFAULT_VENV="$VIRTUALENV_PATH/default"
PY2_PATH="$VIRTUALENV_PATH/default-python-2"
PY3_PATH="$VIRTUALENV_PATH/default-python-3"

# Create Python2 default virtualenv
if [ ! -d "$PY2_PATH" ]; then
    if [ -f /etc/debian_version ] || [ -f /etc/redhat-release ]; then
        python2 -m virtualenv --system-site-packages "$PY2_PATH"
    else
        python2 -m virtualenv "$PY2_PATH"
    fi
fi
# Create Python3 default virtualenv
if [ ! -d "$PY3_PATH" ]; then
    if [ -f /etc/debian_version ] || [ -f /etc/redhat-release ]; then
        python3 -m venv --system-site-packages "$PY3_PATH"
    else
        python3 -m venv "$PY3_PATH"
    fi
fi


if [ -d "$DEFAULT_VENV" ] && [ ! -L "$DEFAULT_VENV" ]; then
    source "$DEFAULT_VENV"/bin/activate
    PYV="$(python --version 2>&1 | awk '{ print $2 }' | awk -F. '{ print $1 }')"
    if [[ "$PYV" = "2" ]]; then
        pip2 freeze > "$HOME"/.requirements-2.txt
        source "$PY2_PATH"/bin/activate
        pip2 install -r "$HOME"/.requirements-2.txt
        mv "$DEFAULT_VENV" "$DEFAULT_VENV".backup
        ln -s "$PY2_PATH" "$DEFAULT_VENV"
    elif [[ "$PYV" = "3" ]]; then
        pip3 freeze > "$HOME"/.requirements-3.txt
        source "$PY3_PATH"/bin/activate
        pip3 install -r "$HOME"/.requirements-3.txt
        mv "$DEFAULT_VENV" "$DEFAULT_VENV".backup
        ln -s "$PY3_PATH" "$DEFAULT_VENV"
    fi
elif [ ! -d "$DEFAULT_VENV" ]; then
    if [[ "$DEFAULT_PYV" = "2" ]]; then
        ln -s "$PY2_PATH" "$DEFAULT_VENV"
    elif [[ "$DEFAULT_PYV" = "3" ]]; then
        ln -s "$PY3_PATH" "$DEFAULT_VENV"
    fi
elif [ -L "$DEFAULT_VENV" ]; then
    if [[ "$DEFAULT_PYV" = "2" ]]; then
        if [[ "$DEFAULT_VENV" -ef "$PY2_PATH" ]]; then
            :
        else
            rm "$DEFAULT_VENV"
            ln -s "$PY2_PATH" "$DEFAULT_VENV"
        fi
    elif [[ "$DEFAULT_PYV" = "3" ]]; then
        if [[ "$DEFAULT_VENV" -ef "$PY3_PATH" ]]; then
            :
        else
            rm "$DEFAULT_VENV"
            ln -s "$PY3_PATH" "$DEFAULT_VENV"
        fi
    fi
fi

# If a Python virtual environment exists called venv, source it. Otherwise we
# will source our default virtual environment.
function cd(){
    builtin cd "$@"
    check_virtualenvironments
}

# Activate default virtual environment on ls if not currently in a virtual
# environment
function ls(){
    builtin command ls "$@"
    check_virtualenvironments
}

# Function to check and manipulate virtualenvs
function check_virtualenvironments(){
    if [ -d ./venv ];then
        if [ "$VIRTUAL_ENV" ];then
            if [[ $VIRTUAL_ENV == "$VIRTUALENV_PATH"/ansible-* ]];then
                :
            else
                deactivate
                source ./venv/bin/activate
                export VIRTUAL_ENV="$PWD/venv"
            fi
        else
            source ./venv/bin/activate
            export VIRTUAL_ENV="$PWD/venv"
        fi
    elif [ "$VIRTUAL_ENV" ];then
        unset DISABLE_ENV
        if [[ $VIRTUAL_ENV == "$VIRTUALENV_PATH"/ansible-* ]];then
            :
        else
            parentdir="$(dirname "$VIRTUAL_ENV")"
            if [[ "$PWD"/ != "$parentdir"/* ]];then
                deactivate
                source "$DEFAULT_VENV"/bin/activate
            fi
        fi
    else
        if [ ! "$DISABLE_ENV" ]; then
            read -p "Enable default Python virtualenv (y/n)?" REPLY
            if [[ "$REPLY" == "y" || "$REPLY" == "yes" ]]; then
                source "$DEFAULT_VENV"/bin/activate
            else
                export DISABLE_ENV="True"
            fi
        fi
    fi
    set_default_virtualenvs
}

# We manage our default Python virtualenvs here to ensure we are in the correct
# virtualenv.
function set_default_virtualenvs(){
    PYV="$(python --version 2>&1 | awk '{ print $2 }' | awk -F. '{ print $1 }')"
    PYP="$(dirname $(which python 2>&1))"
    if [ "$VIRTUAL_ENV" ]; then
        if [[ "$PYV" = "$DEFAULT_PYV" ]]; then
            if [[ "$DEFAULT_PYV" = "2" ]]; then
                if [[ ":$PATH:" != *":$PY3_PATH/bin:"* ]]; then
                    deactivate
                    PATH="$PY3_PATH/bin:$PATH"
                    source "$PYP"/activate
                fi
            elif [[ "$DEFAULT_PYV" = "3" ]]; then
                if [[ ":$PATH:" != *":$PY2_PATH/bin:"* ]]; then
                    deactivate
                    PATH="$PY2_PATH/bin:$PATH"
                    source "$PYP"/activate
                fi
            fi
        elif [[ "$PYV" != "$DEFAULT_PYV" ]]; then
            if [[ "$DEFAULT_PYV" = "2" ]]; then
                if [[ ":$PATH:" != *":$PY2_PATH/bin:"* ]]; then
                    deactivate
                    PATH="$PY2_PATH/bin:$PATH"
                    source "$PYP"/activate
                fi
            elif [[ "$DEFAULT_PYV" = "3" ]]; then
                if [[ ":$PATH:" != *":$PY3_PATH/bin:"* ]]; then
                    deactivate
                    PATH="$PY3_PATH/bin:$PATH"
                    source "$PYP"/activate
                fi
            fi
        fi
    elif [ ! "$VIRTUAL_ENV" ]; then
        if [[ ":$PATH:" == *":$PY2_PATH/bin:"* ]]; then
            REMOVE_PY_PATH="$PY2_PATH/bin"
            PATH=:$PATH:
            PATH=${PATH//:$REMOVE_PY_PATH:/:}
            PATH=${PATH#:}; PATH=${PATH%:}
        fi
        if [[ ":$PATH:" == *":$PY3_PATH/bin:"* ]]; then
            REMOVE_PY_PATH="$PY3_PATH/bin"
            PATH=:$PATH:
            PATH=${PATH//:$REMOVE_PY_PATH:/:}
            PATH=${PATH#:}; PATH=${PATH%:}
        fi
    fi
}

source "$DEFAULT_VENV"/bin/activate
set_default_virtualenvs

pip freeze > "$HOME"/.dotfiles/requirements.txt

