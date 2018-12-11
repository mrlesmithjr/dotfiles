export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="af-magic"
# ZSH_THEME="pygmalion"
# ZSH_THEME="avit"
plugins=(docker git pip python vagrant zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

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
    # alias update="sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; brew cask outdated | xargs brew cask reinstall; npm install npm -g; npm update -g; $PIP_CMD freeze | xargs $PIP_CMD install -U; sudo gem update --system; sudo gem update; sudo gem cleanup; sudo purge"
    alias update="deactivate; sudo softwareupdate -i -a; brew update; brew upgrade; brew cask upgrade; brew cleanup"

    if [ -f "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]; then
        source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    fi

    if [ -f "/usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]; then
        source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    fi

    test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

    # Test for https://www.passwordstore.org/
    # test -e "/usr/local/share/zsh/site-functions/_pass" && source "/usr/local/share/zsh/site-functions/_pass"

    export PATH="/usr/local/sbin:$PATH"
fi

#### MacOS OS Check - END ####

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
VIRTUALENV_PATH="$HOME/python-virtualenvs"
DEFAULT_VENV="$VIRTUALENV_PATH/default"
if [ ! -d $DEFAULT_VENV ];then
    echo "Creating default Python virtual environment for usage."
    python2.7 -m virtualenv --system-site-packages $DEFAULT_VENV
fi

# If a Python virtual environment exists called venv, source it. Otherwise we
# will source our default virtual environment.
function cd(){
    builtin cd $@
    if [ -d ./venv ];then
        if [ $VIRTUAL_ENV ];then
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
    elif [ $VIRTUAL_ENV ];then
        unset DISABLE_ENV
        if [[ $VIRTUAL_ENV == "$VIRTUALENV_PATH"/ansible-* ]];then
            :
        else
            parentdir="$(dirname "$VIRTUAL_ENV")"
            if [[ "$PWD"/ != "$parentdir"/* ]];then
                deactivate
                source $DEFAULT_VENV/bin/activate
            fi
        fi
    else
        if [ ! $DISABLE_ENV ]; then
            read REPLY\?"Enable default Python virtualenv (y/n)?"
            if [[ "$REPLY" == "y" ]]; then
                source $DEFAULT_VENV/bin/activate
            else
                export DISABLE_ENV="True"
            fi
        fi
    fi
}

# Activate default virtual environment on ls if not currently in a virtual
# environment
function ls(){
    builtin command ls $@
    if [ ! $VIRTUAL_ENV ];then
        if [ -d ./venv ];then
            source ./venv/bin/activate
            export VIRTUAL_ENV="$PWD/venv"
        else
            if [ ! $DISABLE_ENV ]; then
                read REPLY\?"Enable default Python virtualenv (y/n)?"
                if [[ "$REPLY" == "y" ]]; then
                    source $DEFAULT_VENV/bin/activate
                else
                    export DISABLE_ENV="True"
                fi
            fi
        fi
    fi
}

source $DEFAULT_VENV/bin/activate
pip freeze > $HOME/.dotfiles/requirements.txt
