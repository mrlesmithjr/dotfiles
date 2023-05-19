# Dotfiles

A collection of my `.dotfiles` including a [setup](setup.sh) script. This script will
set up all the things.

## Build Status

### GitHub Actions

![Dotfiles Testing](https://github.com/mrlesmithjr/dotfiles/workflows/Dotfiles%20Testing/badge.svg)

### Travis CI

[![Build Status](https://travis-ci.org/mrlesmithjr/dotfiles.svg?branch=master)](https://travis-ci.org/mrlesmithjr/dotfiles)

## Usage

### Clone down to your `$HOME` folder

```bash
cd ~
git clone https://github.com/mrlesmithjr/dotfiles .dotfiles --recursive
```

### Setup

The following will be set up using this method:

- dotfiles
- Python
- Brew

```bash
cd ~/.dotfiles
./install
```

## Various Setting Info

### .bashrc and .bash_profile

To make this portable between `Linux` and `macOS` we need to use both. The
the reason is that for `macOS` the default is to use `.bash_profile` and ignore
`.bashrc` whereas on `Linux` `.bash_profile` is only used for interactive
logins (ssh, terminal, etc.) and ignored from GUI-based terminal sessions.

And then we can add all of our goodies to `.bashrc`. And in doing so,
everything works as planned in all scenarios between `Linux` and `macOS`.

### .gitconfig

Make sure to reset the user, email, and other personal settings. Or you'll be using mine.

```bash
 git config --global --unset commit.gpgsign
 git config --global --unset gpg.format
 git config --global --unset gpg.ssh.allowedsignersfile
 git config --global --unset gpg.ssh.program
 git config --global --unset user.email
 git config --global --unset user.name
 git config --global --unset user.signingkey
```

## Homebrew Bundles

I've included a few different options to install Homebrew packages for simplicity.

### Homebrew minimal

To install a minimal setup execute:

```bash
brew bundle --file homebrew/Brewfile.minimal
```

### Homebrew full

To install a full setup execute either:

```bash
brew bundle --file homebrew/Brewfile
```

or:

```bash
brew bundle --global
```

## License

MIT

## Author Information

Larry Smith Jr.

- [@mrlesmithjr](https://www.twitter.com/mrlesmithjr)
- [EverythingShouldBeVirtual](http://everythingshouldbevirtual.com)
- [mrlesmithjr@gmail.com](mailto:mrlesmithjr@gmail.com)
