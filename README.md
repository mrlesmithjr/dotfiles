<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

- [REPO INFO](#repo-info)
  - [Usage](#usage)
    - [Clone down to your `$HOME` folder](#clone-down-to-your-home-folder)
      - [Manually create `symlinks` to the files you would like to use into your `$HOME` folder](#manually-create-symlinks-to-the-files-you-would-like-to-use-into-your-home-folder)
      - [Automatically create `symlinks` using script](#automatically-create-symlinks-using-script)
      - [Setup **EVERYTHING** (dotfiles, Python, Brew, Brew packages, Brew cask packages,](#setup-everything-dotfiles-python-brew-brew-packages-brew-cask-packages)
  - [Various Setting Info](#various-setting-info)
    - [`.bashrc` and `.bash_profile`](#bashrc-and-bash_profile)
    - [`.gitconfig`](#gitconfig)
    - [`.vimrc` and `.vim`](#vimrc-and-vim)
  - [Some Example Plugins/bundles and etc.](#some-example-pluginsbundles-and-etc)
  - [Install Some Stuff](#install-some-stuff)
  - [License](#license)
  - [Author Information](#author-information)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# REPO INFO

This repo is for a collection of my `dotfiles` which I use.

My goal will be to make as many of these as portable between `Linux` distros
and `MacOS`.

## Usage

### Clone down to your `$HOME` folder

```bash
cd ~
git clone https://github.com/mrlesmithjr/dotfiles .dotfiles
```

#### Manually create `symlinks` to the files you would like to use into your `$HOME` folder

`Examples`:

```bash
cd ~
ln -s .dotfiles/.bash_profile .
ln -s .dotfiles/.bashrc .
ln -s .dotfiles/.gitconfig .
ln -s .dotfiles/.gitignore_global .
ln -s .dotfiles/.vim .
ln -s .dotfiles/.vimrc .
```

#### Automatically create `symlinks` using script

> NOTE: This script will backup any existing files/folders into

```bash
cd ~/.dotfiles
./setup.sh
```

#### Setup **EVERYTHING** (dotfiles, Python, Brew, Brew packages, Brew cask packages,

Ansible, Ansible Virtual Environments, Ansible Container Virtual Environments)

```bash
cd ~/.dotfiles/install
./setup.sh
```

## Various Setting Info

### `.bashrc` and `.bash_profile`

To make these portable between `Linux` and `MacOS` we need to use both. The
reason is that for `MacOS` the default is to use `.bash_profile` and ignore
`.bashrc` whereas on `Linux` `.bash_profile` is only used for interactive
logins (ssh, terminal, and etc.) and ignored from GUI based terminal sessions.
So to make these portable the only thing added to `.bash_profile` is below:

```bash
# .bash_profile

if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi
```

And then we can add all of our goodies to `.bashrc`. And in doing so,
everything works as planned in all scenarios between `Linux` and `MacOS`.

### `.gitconfig`

Make sure to edit this file to match your preferences. Especially the below:

```bash
[user]
	email = mrlesmithjr@gmail.com
	name = Larry Smith Jr.
[credential]
	# Fedora
	# helper = /usr/libexec/git-core/git-credential-gnome-keyring
	# MacOS
	helper = osxkeychain
[diff]
	tool = meld
[difftool]
	prompt = false
[merge]
	tool = meld
[mergetool]
	prompt = false
```

### `.vimrc` and `.vim`

Some personal settings to make `vim` more pleasing on the eyes.

-   Install [VundleVim](https://github.com/VundleVim/Vundle.vim)

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

-   Install bundles/plugins

```bash
vim ~/.vimrc
:BundleInstall
```

## Some Example Plugins/bundles and etc.

-   [`pathogen`](https://github.com/tpope/vim-pathogen) - Manage your
    `runtimepath` with ease.
-   [`vim-ansible-yaml`](https://github.com/chase/vim-ansible-yaml) - Adds
    additional syntax highlighting and fixes indentation for Ansible's dialect
    of YAML.
-   [`vim-jinja`](https://github.com/lepture/vim-jinja) - Jinja bundle for `vim`
-   [`vim-markdown`](https://github.com/plasticboy/vim-markdown) - Markdown Vim
    Mode

## Install Some Stuff

-   [`install/bootstrap.sh`](install/bootstrap.sh)
    -   Bootstrap systems with pre-reqs and package installation
-   [`install/ansible-macos-homebrew-packages.yml`](install/ansible-macos-homebrew-packages.yml)
    -   Install `MacOS` `brew` packages using `Ansible`.
-   [`install/setup_ansible_virtualenvs.sh`](install/setup_ansible_virtualenvs.sh)
    -   Setup `Ansible` `Python` virtual environments.

## License

MIT

## Author Information

Larry Smith Jr.

-   [@mrlesmithjr](https://www.twitter.com/mrlesmithjr)
-   [EverythingShouldBeVirtual](http://everythingshouldbevirtual.com)
-   mrlesmithjr [at] gmail.com
