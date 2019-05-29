<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->

**Table of Contents** _generated with [DocToc](https://github.com/thlorenz/doctoc)_

- [REPO INFO](#repo-info)
  - [Usage](#usage)
    - [Clone down to your `$HOME` folder](#clone-down-to-your-home-folder)
      - [Setup **EVERYTHING**](#setup-everything)
  - [Various Setting Info](#various-setting-info)
    - [`.bashrc` and `.bash_profile`](#bashrc-and-bash_profile)
    - [`.gitconfig`](#gitconfig)
    - [`.vimrc` and `.vim`](#vimrc-and-vim)
  - [Some Example Plugins/bundles and etc](#some-example-pluginsbundles-and-etc)
  - [Visual Studio Code Extensions](#visual-studio-code-extensions)
  - [Manipulating packages to install](#manipulating-packages-to-install)
  - [License](#license)
  - [Author Information](#author-information)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

# REPO INFO

This repo is for a collection of my `dotfiles` which I use. And also installs
numerous applications which I use for development, automation, etc.

My goal will be to make as many of these as portable between `Linux` distros
and `MacOS`.

## Usage

### Clone down to your `$HOME` folder

```bash
cd ~
git clone https://github.com/mrlesmithjr/dotfiles .dotfiles --recursive
```

#### Setup **EVERYTHING**

The following will be setup using this method:

- dotfiles
- Python
- Brew
- Brew packages
- Brew cask packages
- Ansible
- Ansible Virtual Environments

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
[apply]
  # Detect whitespace errors when applying a patch
  whitespace = fix
[core]
  excludesfile = ~/.gitignore_global
  # editor = atom --wait
  # editor = code --wait
  # editor = vi
  editor = vim
  # Treat spaces before tabs and all kinds of trailing whitespace as an error
  # [default] trailing-space: looks for spaces at the end of a line
  # [default] space-before-tab: looks for spaces before tabs at the beginning of a line
  whitespace = space-before-tab,-indent-with-non-tab,trailing-space
[user]
  email = mrlesmithjr@gmail.com
  name = Larry Smith Jr.
[credential]
  # Fedora
  # helper = /usr/libexec/git-core/git-credential-gnome-keyring
  # MacOS
  helper = osxkeychain
  # Ubuntu
  # helper = cache
  useHttpPath = true
[color]
  status = auto
  branch = auto
  interactive = auto
  diff = auto
[color]
  status = auto
  branch = auto
  interactive = auto
  diff = auto
  ui = auto
[diff]
  tool = default-difftool
[difftool "default-difftool"]
  cmd = code --wait --diff $LOCAL $REMOTE
[includeIf "gitdir:~/Git_Projects/Work/"]
  path = ~/.gitconfig-work
[includeIf "gitdir:~/projects/devops_automation/"]
  path = ~/.gitconfig-work
[status]
  submoduleSummary = true
[pager]
  branch = false
[url "git@github.com:"]
  insteadOf = https://github.com/
[url "git@gitlab.com:"]
  insteadOf = https://gitlab.com/
```

### `.vimrc` and `.vim`

Some personal settings to make `vim` more pleasing on the eyes.

- Install [VundleVim](https://github.com/VundleVim/Vundle.vim)

```bash
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

- Install bundles/plugins

```bash
vim ~/.vimrc
:BundleInstall
```

## Some Example Plugins/bundles and etc

- [`pathogen`](https://github.com/tpope/vim-pathogen) - Manage your
  `runtimepath` with ease.
- [`vim-ansible-yaml`](https://github.com/chase/vim-ansible-yaml) - Adds
  additional syntax highlighting and fixes indentation for Ansible's dialect
  of YAML.
- [`vim-jinja`](https://github.com/lepture/vim-jinja) - Jinja bundle for `vim`
- [`vim-markdown`](https://github.com/plasticboy/vim-markdown) - Markdown Vim
  Mode

## Visual Studio Code Extensions

You can find some VS Code extensions exported [here](Code/extensions.list) which
you can easily import if you would like by executing the following:

```bash
cat $HOME/.dotfiles/Code/extensions.list | xargs -L1 code --install-extension
```

> NOTE: These extensions are installed automatically via Ansible provisioning when
> following [this method](#setup-everything).

## Manipulating packages to install

Most all apps and etc. are provisioned via Ansible once Ansible is installed. You
can modify packages to your liking by editing the applicable YAML files in
`install/group_vars/all/`. Most packages will have a `state` associated with them
so you can easily set to `present` or `absent` and Ansible will take care of the
packages for you.

## License

MIT

## Author Information

Larry Smith Jr.

- [@mrlesmithjr](https://www.twitter.com/mrlesmithjr)
- [EverythingShouldBeVirtual](http://everythingshouldbevirtual.com)
- [mrlesmithjr@gmail.com](mailto:mrlesmithjr@gmail.com)
