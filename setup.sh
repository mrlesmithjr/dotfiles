#!/bin/bash
set -e
set -x

if [[ $(uname) == "Linux" ]]; then
	# Arch
	if [ -f /etc/arch-release ]; then
		codename="$(awk </etc/arch-release '{print $1}')"
		if [[ $codename == "Manjaro" ]]; then
			yes | sudo pacman -Syyu && yes | sudo pacman -S gc guile autoconf automake \
				binutils bison curl fakeroot file findutils flex gawk gcc gettext grep \
				groff gzip libtool m4 make pacman patch pkgconf sed sudo systemd \
				texinfo util-linux which python-setuptools python-virtualenv python-pip \
				python-pyopenssl python2-setuptools python2-virtualenv python2-pip \
				python2-pyopenssl
		fi
	fi

	# Ubuntu
	if [ -f /etc/debian_version ]; then
		# shellcheck source=/dev/null
		source /etc/os-release
		# id=$ID
		os_version_id=$VERSION_ID
		sudo apt-get update
		sudo apt-get install -y bc
		if (($(echo "$os_version_id" '<' 20.04 | bc))); then
			sudo apt-get -y install build-essential curl fontconfig libbz2-dev libffi-dev \
				libreadline-dev libsqlite3-dev libssl-dev python-dev python-minimal python-pip \
				python-setuptools python-virtualenv python3-pip python3-venv vim virtualenv zlib1g-dev zsh
		else
			sudo apt-get -y install build-essential curl fontconfig libbz2-dev libffi-dev \
				liblzma-dev libreadline-dev libsqlite3-dev libssl-dev python-is-python3 python3-dev \
				python3-minimal python3-pip python3-setuptools python3-virtualenv \
				python3-venv vim virtualenv zlib1g-dev zsh
		fi
		if [ ! -d "$HOME/.fonts" ]; then
			mkdir "$HOME/.fonts"
		fi
		if [ ! -d "$HOME/.config/fontconfig" ]; then
			mkdir -p "$HOME/.config/fontconfig/conf.d"
		fi
		if [ ! -f "$HOME/.fonts/PowerlineSymbols.otf" ]; then
			wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf -O "$HOME"/.fonts/PowerlineSymbols.otf
		fi
		if [ ! -f "$HOME/.config/fontconfig/conf.d/10-powerline-symbols.conf" ]; then
			fc-cache -vf "$HOME"/.fonts/
			wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf -O "$HOME"/.config/fontconfig/conf.d/10-powerline-symbols.conf
		fi
	fi

	# RHEL
	if [ -f /etc/redhat-release ]; then
		codename="$(awk </etc/redhat-release '{print $1}')"
		if [[ $codename == "Fedora" ]]; then
			sudo dnf -y install curl bzip2 bzip2-devel gmp-devel libffi-devel openssl-devel \
				python-crypto python-devel python-dnf python-pip python-setuptools python-virtualenv \
				python3-devel python3-dnf python3-setuptools python3-virtualenv \
				redhat-rpm-config readline-devel sqlite sqlite-devel wget xz xz-devel zlib-devel zsh &&
				sudo dnf -y group install "C Development Tools and Libraries"
		elif [[ $codename == "CentOS" ]]; then
			sudo yum -y install bzip2 bzip2-devel curl gmp-devel libffi-devel openssl-devel \
				python-crypto python-devel python-pip python-setuptools python-virtualenv \
				redhat-rpm-config readline-devel sqlite sqlite-devel wget xz xz-devel zlib-devel zsh &&
				sudo yum -y group install "Development Tools"
		fi
	fi
fi

### Homebrew ###
if [[ $(uname) == "Darwin" ]]; then
	if ! xcode-select --print-path &>/dev/null; then
		xcode-select --install &>/dev/null
	fi
	set +e
	command -v brew >/dev/null 2>&1
	BREW_CHECK=$?
	if [ $BREW_CHECK -eq 0 ]; then
		echo "Brew already installed"
	else
		/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	fi
elif [[ $(uname) == "Linux" ]]; then
	set +e
	if [[ $(arch) != "aarch64" ]]; then
		command -v brew >/dev/null 2>&1
		BREW_CHECK=$?
		if [ $BREW_CHECK -eq 0 ]; then
			echo "Brew already installed"
		else
			bash -c \
				"$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
			test -d /home/linuxbrew/.linuxbrew && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
		fi
		if [ ! -d /home/linuxbrew/.linuxbrew/var/homebrew/linked ]; then
			sudo mkdir -p /home/linuxbrew/.linuxbrew/var/homebrew/linked
			sudo chown -R "$(whoami)" /home/linuxbrew/.linuxbrew/var/homebrew/linked
		fi
	fi
fi

### Pyenv ###
export PYENV_ROOT="$HOME/.pyenv"

if [ ! -d "$PYENV_ROOT" ]; then
	git clone https://github.com/pyenv/pyenv.git "$PYENV_ROOT"
	git clone https://github.com/pyenv/pyenv-update.git "$PYENV_ROOT/plugins/pyenv-update"
	git clone https://github.com/pyenv/pyenv-virtualenv.git "$PYENV_ROOT/plugins/pyenv-virtualenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	if [ -f .python-version ]; then
		pyenv install
		pyenv global "$(cat .python-version)"
	else
		DEFAULT_PYTHON_VERSION=$(pyenv install --list | grep -v - | grep -v a | grep -v b | grep -v mini | grep -v rc | tail -1 | awk '{ print $1 }')
		pyenv install "$DEFAULT_PYTHON_VERSION"
		pyenv global "$DEFAULT_PYTHON_VERSION"
	fi
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
	# eval "$(pyenv virtualenv-init -)"
	pip install --upgrade pip pip-tools
	pip-sync "requirements.txt" "requirements-dev.txt"
else
	export PATH="$PYENV_ROOT/bin:$PATH"
	eval "$(pyenv init --path)"
	eval "$(pyenv init -)"
	# eval "$(pyenv virtualenv-init -)"
fi

### Fonts ###
if [[ $(uname) == "Darwin" ]]; then
	FONTS_DIR="$HOME"/Library/Fonts
elif [[ $(uname) == "Linux" ]]; then
	FONTS_DIR="$HOME"/.fonts
fi

if [[ ! -d "$FONTS_DIR" ]]; then
	mkdir -p "$FONTS_DIR"
fi

if [[ ! -f "$FONTS_DIR/MesloLGS NF Regular.ttf" ]]; then
	cd "$FONTS_DIR"
	curl -L https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf >"MesloLGS NF Regular.ttf"
	if [[ $(uname) == "Linux" ]]; then
		fc-cache -vf "$FONTS_DIR"
	fi
	cd -
fi

### Bash Git Prompt ###
if [[ $(uname) == "Linux" ]]; then
	if [ ! -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
		git clone https://github.com/magicmonty/bash-git-prompt.git "$HOME/.bash-git-prompt" --depth=1
	fi
fi

### Netrc ###
if [ ! -f "$HOME/.netrc" ]; then
	touch "$HOME/.netrc"
fi

### Oh My Zsh ###
OMZ_DIR=$HOME/.oh-my-zsh
OMZ_CUSTOM_DIR=$OMZ_DIR/custom
OMZ_PLUGINS_DIR=$OMZ_CUSTOM_DIR/plugins
OMZ_THEMES_DIR=$OMZ_CUSTOM_DIR/themes

if [ ! -d "$OMZ_DIR" ]; then
	git clone https://github.com/ohmyzsh/ohmyzsh.git "$OMZ_DIR"
fi

if [ ! -d "$OMZ_PLUGINS_DIR/zsh-autocomplete" ]; then
	git clone https://github.com/marlonrichert/zsh-autocomplete.git "$OMZ_PLUGINS_DIR/zsh-autocomplete"
fi

if [ ! -d "$OMZ_PLUGINS_DIR/zsh-autosuggestions" ]; then
	git clone https://github.com/zsh-users/zsh-autosuggestions.git "$OMZ_PLUGINS_DIR/zsh-autosuggestions"
fi

if [ ! -d "$OMZ_PLUGINS_DIR/zsh-syntax-highlighting" ]; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "$OMZ_PLUGINS_DIR/zsh-syntax-highlighting"
fi

if [ ! -d "$OMZ_THEMES_DIR/powerlevel10k" ]; then
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$OMZ_THEMES_DIR/powerlevel10k"
fi

### macOS ###
if [[ $(uname) == "Darwin" ]]; then
	source "$HOME/.macos"
fi
