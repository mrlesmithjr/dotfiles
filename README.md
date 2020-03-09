<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

**Table of Contents** _generated with [DocToc](https://github.com/thlorenz/doctoc)_

- [Dotfiles](#dotfiles)
  - [Usage](#usage)
    - [Clone down to your `$HOME` folder](#clone-down-to-your-home-folder)
    - [Setup](#setup)
  - [Various Setting Info](#various-setting-info)
    - [.bashrc and .bash_profile](#bashrc-and-bash_profile)
    - [.gitconfig](#gitconfig)
    - [.vimrc and .vim](#vimrc-and-vim)
  - [Some Example Plugins/bundles and etc](#some-example-pluginsbundles-and-etc)
  - [Visual Studio Code Extensions](#visual-studio-code-extensions)
  - [License](#license)
  - [Author Information](#author-information)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# Dotfiles

A collection of my `.dotfiles` including a [setup](setup.sh) script. This script
will setup all the things.

## Usage

### Clone down to your `$HOME` folder

```bash
cd ~
git clone https://github.com/mrlesmithjr/dotfiles .dotfiles --recursive
```

### Setup

The following will be setup using this method:

- dotfiles
- Python
- Brew

```bash
cd ~/.dotfiles
./setup.sh
```

## Various Setting Info

### .bashrc and .bash_profile

To make these portable between `Linux` and `MacOS` we need to use both. The
reason is that for `MacOS` the default is to use `.bash_profile` and ignore
`.bashrc` whereas on `Linux` `.bash_profile` is only used for interactive
logins (ssh, terminal, and etc.) and ignored from GUI based terminal sessions.

And then we can add all of our goodies to `.bashrc`. And in doing so,
everything works as planned in all scenarios between `Linux` and `MacOS`.

### .gitconfig

Make sure to reset the user and email. Or you'll be using mine.

```bash
git config --global user.name "Your_Name"
git config --global user.email "Your_Name@example.org"
```

### .vimrc and .vim

Some personal settings to make `vim` more pleasing on the eyes.

- [VundleVim](https://github.com/VundleVim/Vundle.vim)

## Some Example Plugins/bundles and etc

- [pathogen](https://github.com/tpope/vim-pathogen) - Manage your
  `runtimepath` with ease.
- [vim-ansible-yaml](https://github.com/chase/vim-ansible-yaml) - Adds
  additional syntax highlighting and fixes indentation for Ansible's dialect
  of YAML.
- [vim-jinja](https://github.com/lepture/vim-jinja) - Jinja bundle for `vim`
- [vim-markdown](https://github.com/plasticboy/vim-markdown) - Markdown Vim
  Mode

## Visual Studio Code Extensions

You can find some VS Code extensions exported [here](Code/extensions.list) which
you can easily import if you would like by executing the following:

```bash
cat $HOME/.dotfiles/Code/extensions.list | xargs -L1 code --install-extension
```

## License

MIT

## Author Information

Larry Smith Jr.

- [@mrlesmithjr](https://www.twitter.com/mrlesmithjr)
- [EverythingShouldBeVirtual](http://everythingshouldbevirtual.com)
- [mrlesmithjr@gmail.com](mailto:mrlesmithjr@gmail.com)
