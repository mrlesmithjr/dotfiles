export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="af-magic"
# ZSH_THEME="pygmalion"
ZSH_THEME="avit"
plugins=(docker git pip python vagrant)

source "$ZSH"/oh-my-zsh.sh

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

#### MacOS OS Check ####

if [[ $(uname) == "Darwin" ]]; then
    brew list | grep python >/dev/null 2>&1
    PYTHON_CHECK=$?
    if [ $PYTHON_CHECK -ne 0 ]; then
        brew install python@3 python@2
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
    alias update="pip list --outdated --local | awk 'NR>2' | awk '{print $1}' | xargs pip install -U; deactivate; sudo softwareupdate -i -a; brew update; brew upgrade; brew cask upgrade; brew cleanup"

    if [ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
        source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    if [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
        source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

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
    test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi
fi

# Set aliases
alias grep='grep --color=auto'
alias ll='ls -la'
alias lr='ls -latr'

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
            read REPLY\?"Enable default Python virtualenv (y/n)?"
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

# added by travis gem
[ -f "$HOME"/.travis/travis.sh ] && source "$HOME"/.travis/travis.sh
