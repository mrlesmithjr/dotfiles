#!/usr/bin/env bash
set -e
# Define where dotfiles repo exists
DOTFILES_DIR="$HOME/.dotfiles"

# Define folder where to backup any existing dotfiles
DOTFILES_DIR_BACKUP="$HOME/.dotfiles_old"

# Define dotfiles to manage
dotfiles=(".atom" ".bash_profile" ".bashrc" ".gitconfig" ".gitignore_global" \
".pylintrc" ".vim" ".vimrc" ".zshrc")

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

if [ ! -d "$DOTFILES_DIR_BACKUP" ]; then
    echo "Creating $DOTFILES_DIR_BACKUP to store any existing dotfiles..."
    mkdir -p "$DOTFILES_DIR_BACKUP"
    echo "Done"
fi

echo "Changing to $DOTFILES_DIR directory..."
cd "$DOTFILES_DIR" || exit

for dotfile in "${dotfiles[@]}"
do
    if [ -f "$HOME/$dotfile" ]; then
        if [[ ! "$HOME/$dotfile" -ef "$DOTFILES_DIR/$dotfile" ]]; then
            echo "Backing up $dotfile to $DOTFILES_DIR_BACKUP/$dotfile.$timestamp..."
            mv -f "$HOME/$dotfile" "$DOTFILES_DIR_BACKUP"/"$dotfile"."$timestamp"
            echo "Done"
        fi
    fi
    if [ -d "$HOME/$dotfile" ]; then
        if [[ ! "$HOME/$dotfile" -ef "$DOTFILES_DIR/$dotfile" ]]; then
            echo "Backing up $dotfile directory to $DOTFILES_DIR_BACKUP/$dotfile.$timestamp..."
            mv -f "$HOME/$dotfile" "$DOTFILES_DIR_BACKUP"/"$dotfile"."$timestamp"
            echo "Done"
        fi
    fi
done

cd "$HOME" || exit
for dotfile in "${dotfiles[@]}"
do
    if [ ! -e "$dotfile" ]; then
        echo "Creating symlink for $DOTFILES_DIR/$dotfile..."
        ln -s "$DOTFILES_DIR/$dotfile" .
        echo "Done"
    else
        echo "$HOME/$dotfile symlink already exists..."
    fi
done

# Check if bash-git-prompt is already installed and install if not
if [[ $(uname) == "Linux" ]]; then
    if [ ! -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
        git clone https://github.com/magicmonty/bash-git-prompt.git "$HOME/.bash-git-prompt" --depth=1
    fi
fi

# Check for existing Vundle Plugin Manager and install if missing
# https://github.com/VundleVim/Vundle.vim
if [ "$(ls -A "$DOTFILES_DIR/.vim/bundle/Vundle.vim/autoload")" ]; then
    echo "Vundle already installed"
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +BundleInstall +qall 2&> /dev/null
fi

if [[ $(uname) == "Darwin" ]]; then
    # Sets up VSCode .dotfiles per https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
    VSCODE_USER_HOME=("$HOME/Library/Application\ Support/Code/User")
fi

if [[ $(uname) == "Linux" ]]; then
    # Sets up VSCode .dotfiles per https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
    VSCODE_USER_HOME=("$HOME/.config/Code/User/")
fi

if [[ ! -d $VSCODE_USER_HOME ]]; then
    echo "Creating $VSCODE_USER_HOME ..."
    mkdir -p "$VSCODE_USER_HOME"
    echo "Done"
else
    echo "$VSCODE_USER_HOME already exists..."
fi

# Defines path to this repos .dotfiles for VSCode
VSCODE_DOTFILES_DIR=$DOTFILES_DIR/Code
echo "$VSCODE_DOTFILES_DIR"

VSCODE_DOTFILES=("settings.json" "keybindings.json" "vsicons.settings.json")

# Creates symlinks if they do not exist or creates a copy of an existing one if it exists and is not to the correct location
for VSCODE_DOTFILE in "${VSCODE_DOTFILES[@]}"
do
    if [[ -L "$VSCODE_USER_HOME/$VSCODE_DOTFILE" ]]; then
        if [[ "$VSCODE_USER_HOME/$VSCODE_DOTFILE" -ef "$VSCODE_DOTFILES_DIR/$VSCODE_DOTFILE" ]]; then
            echo "$VSCODE_USER_HOME/$VSCODE_DOTFILE symlink already correct..."
        else
            echo "Copying $VSCODE_USER_HOME/$VSCODE_DOTFILE $VSCODE_USER_HOME/$VSCODE_DOTFILE.$timestamp..."
            mv "$VSCODE_USER_HOME/$VSCODE_DOTFILE" "$VSCODE_USER_HOME/$VSCODE_DOTFILE.$timestamp"
            echo "Creating symlink for $VSCODE_USER_HOME/$VSCODE_DOTFILE..."
            ln -s "$VSCODE_DOTFILES_DIR/$VSCODE_DOTFILE" "$VSCODE_USER_HOME/$VSCODE_DOTFILE"
        fi
    else
        if [[ ! -f "$VSCODE_USER_HOME/$VSCODE_DOTFILE" ]]; then
            echo "Creating symlink for $VSCODE_USER_HOME/$VSCODE_DOTFILE..."
            ln -s "$VSCODE_DOTFILES_DIR/$VSCODE_DOTFILE" "$VSCODE_USER_HOME/$VSCODE_DOTFILE"
        else
            echo "Copying $VSCODE_USER_HOME/$VSCODE_DOTFILE $VSCODE_USER_HOME/$VSCODE_DOTFILE.$timestamp..."
            mv "$VSCODE_USER_HOME/$VSCODE_DOTFILE" "$VSCODE_USER_HOME/$VSCODE_DOTFILE.$timestamp"
            echo "Creating symlink for $VSCODE_USER_HOME/$VSCODE_DOTFILE..."
            ln -s "$VSCODE_DOTFILES_DIR/$VSCODE_DOTFILE" "$VSCODE_USER_HOME/$VSCODE_DOTFILE"
        fi
    fi
done

if [[ -L "$VSCODE_USER_HOME/snippets" ]]; then
    if [[ "$VSCODE_USER_HOME/snippets" -ef "$VSCODE_DOTFILES_DIR/snippets" ]]; then
        echo "$VSCODE_USER_HOME/snippets symlink already correct..."
    else
        echo "Copying $VSCODE_USER_HOME/snippets $VSCODE_USER_HOME/snippets.$timestamp..."
        mv "$VSCODE_USER_HOME/snippets" "$VSCODE_USER_HOME/snippets.$timestamp"
        echo "Creating symlink for $VSCODE_USER_HOME/snippets..."
        ln -s "$VSCODE_DOTFILES_DIR/snippets/" "$VSCODE_USER_HOME/snippets"
    fi
else
    if [[ -d "$VSCODE_USER_HOME/snippets" ]]; then
        echo "Copying $VSCODE_USER_HOME/snippets $VSCODE_USER_HOME/snippets.$timestamp..."
        mv "$VSCODE_USER_HOME/snippets" "$VSCODE_USER_HOME/snippets.$timestamp"
        echo "Creating symlink for $VSCODE_USER_HOME/snippets..."
        ln -s "$VSCODE_DOTFILES_DIR/snippets" "$VSCODE_USER_HOME/snippets"
    else
        echo "Creating symlink for $VSCODE_USER_HOME/snippets..."
        ln -s "$VSCODE_DOTFILES_DIR/snippets" "$VSCODE_USER_HOME/snippets"
    fi
fi

folders=("$HOME/Git_Projects" "$HOME/Git_Projects/Personal/GitHub" \
    "$HOME/Git_Projects/Personal/GitHub/mrlesmithjr" \
    "$HOME/Git_Projects/Personal/GitLab" "$HOME/Git_Projects/Work" \
"$HOME/projects")

for folder in "${folders[@]}"
do
    if [ ! -d "$folder" ]; then
        echo "Creating folder $folder ..."
        mkdir -p "$folder"
        echo "Done"
    else [ -d "$folder" ]
        echo "Folder $folder already exists ..."
    fi
done

# yamllint
YAMLLINT_CONFIG="$HOME/.config/yamllint/config"
YAMLLINT_DIR="$(dirname "$YAMLLINT_CONFIG")"
if [ ! -d "$YAMLLINT_DIR" ]; then
    mkdir -p "$YAMLLINT_DIR"
fi
if [[ -L "$YAMLLINT_CONFIG" ]]; then
    if [[ "$YAMLLINT_CONFIG" -ef "$DOTFILES_DIR/.yamllint.yml" ]]; then
        echo "$YAMLLINT_CONFIG symlink already correct..."
    else
        echo "Copying $YAMLLINT_CONFIG $YAMLLINT_CONFIG.$timestamp..."
        mv "$YAMLLINT_CONFIG" "$YAMLLINT_CONFIG.$timestamp"
        echo "Creating symlink for $YAMLLINT_CONFIG..."
        ln -s "$DOTFILES_DIR/.yamllint.yml" "$YAMLLINT_CONFIG"
    fi
else
    if [[ ! -f "$YAMLLINT_CONFIG" ]]; then
        echo "Creating symlink for $YAMLLINT_CONFIG..."
        ln -s "$DOTFILES_DIR/.yamllint.yml" "$YAMLLINT_CONFIG"
    else
        echo "Copying $YAMLLINT_CONFIG $YAMLLINT_CONFIG.$timestamp..."
        mv "$YAMLLINT_CONFIG" "$YAMLLINT_CONFIG.$timestamp"
        echo "Creating symlink for $YAMLLINT_CONFIG..."
        ln -s "$DOTFILES_DIR/.yamllint.yml" "$YAMLLINT_CONFIG"
    fi
fi

if [[ $(uname) == "Linux" ]]; then
    # Arch
    if [ -f /etc/arch-release ]; then
        codename="$(cat /etc/arch-release | awk '{print $1}' )"
        if [[ $codename == "Manjaro" ]]; then
            yes | sudo pacman -Syyu && yes | sudo pacman -S gc guile autoconf automake \
            binutils bison fakeroot file findutils flex gawk gcc gettext grep \
            groff gzip libtool m4 make pacman patch pkgconf sed sudo systemd \
            texinfo util-linux which python-setuptools python-virtualenv python-pip \
            python-pyopenssl python2-setuptools python2-virtualenv python2-pip \
            python2-pyopenssl
        fi
    fi

    # Ubuntu
    if [ -f /etc/debian_version ]; then
        codename="$(lsb_release -c | awk '{print $2}')"
        sudo apt-get update
        sudo apt-get -y install build-essential libffi-dev libssl-dev python-dev \
        python-minimal python-pip python-setuptools python-virtualenv \
        python3-pip python3-venv virtualenv
        if [ ! -d "$HOME/.fonts" ];then
            mkdir "$HOME/.fonts"
        fi
        if [ ! -d "$HOME/.config/fontconfig" ];then
            mkdir -p "$HOME/.config/fontconfig/conf.d"
        fi
        if [ ! -f "$HOME/.fonts/PowerlineSymbols.otf" ];then
            wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O "$HOME"/.fonts/PowerlineSymbols.otf
        fi
        if [ ! -f "$HOME/.config/fontconfig/conf.d/10-powerline-symbols.conf" ];then
            fc-cache -vf "$HOME"/.fonts/
            wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O "$HOME"/.config/fontconfig/conf.d/10-powerline-symbols.conf
        fi
    fi

    # RHEL
    if [ -f /etc/redhat-release ]; then
        codename="$(cat /etc/redhat-release | awk '{print $1}')"
        if [[ $codename == "Fedora" ]]; then
            sudo dnf -y install gmp-devel libffi-devel openssl-devel python-crypto \
            python-devel python-dnf python-pip python-setuptools python-virtualenv \
            redhat-rpm-config && \
            sudo dnf -y group install "C Development Tools and Libraries"
            elif [[ $codename == "CentOS" ]]; then
            sudo yum -y install gmp-devel libffi-devel openssl-devel python-crypto \
            python-devel python-pip python-setuptools python-virtualenv \
            redhat-rpm-config && \
            sudo yum -y group install "Development Tools"
        fi
    fi
fi

# MacOS
if [[ $(uname) == "Darwin" ]]; then
    if ! xcode-select --print-path &> /dev/null; then
        xcode-select --install &> /dev/null
    fi
    command -v brew >/dev/null 2>&1
    BREW_CHECK=$?
    if [ $BREW_CHECK -eq 0 ]; then
        echo "Brew already installed"
    else
        /usr/bin/ruby -e \
        "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    fi
    brew list | grep python >/dev/null 2>&1
    PYTHON_CHECK=$?
    if [ $PYTHON_CHECK -eq 0 ]; then
        echo "Python already installed"
    else
        brew install python@3 python@2
    fi
    pip install virtualenv
fi

# We setup a default Python virtual environment to use rather than installing everything in system
DEFAULT_VENV="${HOME}/python-virtualenvs/default"
if [ ! -d "$DEFAULT_VENV" ];then
    echo "Creating default Python virtual environment for usage."
    python2.7 -m virtualenv --system-site-packages "$DEFAULT_VENV"
fi

source "$DEFAULT_VENV"/bin/activate

"$DOTFILES_DIR"/install/setup_ansible_virtualenvs.sh

source "$DEFAULT_VENV"/bin/activate

set +e
command -v ansible >/dev/null 2>&1
ANSIBLE_CHECK=$?
if [ $ANSIBLE_CHECK -eq 0 ]; then
    echo "Ansible already installed"
else
    command -v pip >/dev/null 2>&1
    PIP_CHECK=$?
    command -v pip2 >/dev/null 2>&1
    PIP2_CHECK=$?
    if [ $PIP_CHECK -eq 0 ]; then
        pip install ansible
        elif [ $PIP2_CHECK -eq 0 ]; then
        pip2 install ansible
    fi
fi

ansible-playbook "$DOTFILES_DIR"/install/ansible-install-os-packages.yml -K
ansible-playbook "$DOTFILES_DIR"/install/macos_defaults.yml

