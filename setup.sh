#!/usr/bin/env bash

# Define where dotfiles repo exists
DOTFILES_DIR=$HOME/.dotfiles

# Define folder where to backup any existing dotfiles
DOTFILES_DIR_BACKUP=$HOME/.dotfiles_old

# Define dotfiles to manage
dotfiles=(".atom" ".bash_profile" ".bashrc" ".gitconfig" ".gitignore_global" \
".vim" ".vimrc" ".zshrc")

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

if [ ! -d $DOTFILES_DIR_BACKUP ]; then
  echo "Creating $DOTFILES_DIR_BACKUP to store any existing dotfiles..."
  mkdir -p $DOTFILES_DIR_BACKUP
  echo "Done"
fi

echo "Changing to $DOTFILES_DIR directory..."
cd $DOTFILES_DIR || exit

for dotfile in "${dotfiles[@]}"
do
  if [ -f $HOME/$dotfile ]; then
    echo "Backing up $dotfile to $DOTFILES_DIR_BACKUP/$dotfile.$timestamp..."
    mv -f $HOME/$dotfile $DOTFILES_DIR_BACKUP/$dotfile.$timestamp
    echo "Done"
  fi
  if [ -d $HOME/$dotfile ]; then
    echo "Backing up $dotfile directory to $DOTFILES_DIR_BACKUP/$dotfile.$timestamp..."
    mv -f $HOME/$dotfile $DOTFILES_DIR_BACKUP/$dotfile.$timestamp
    echo "Done"
  fi
done

cd $HOME || exit
for dotfile in "${dotfiles[@]}"
do
  echo "Creating symlink for $DOTFILES_DIR/$dotfile..."
  ln -s $DOTFILES_DIR/$dotfile .
  echo "Done"
done

# Check if bash-git-prompt is already installed and install if not
if [[ $(uname) == "Linux" ]]; then
  if [ ! -f $HOME/.bash-git-prompt/gitprompt.sh ]; then
    git clone https://github.com/magicmonty/bash-git-prompt.git $HOME/.bash-git-prompt --depth=1
  fi
fi

# Check for existing Vundle Plugin Manager and install if missing
# https://github.com/VundleVim/Vundle.vim
if [ "$(ls -A $DOTFILES_DIR/.vim/bundle/Vundle.vim/autoload)" ]; then
  echo "Vundle already installed"
else
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +BundleInstall +qall 2&> /dev/null
fi

if [[ $(uname) == "Darwin" ]]; then
  # Sets up VSCode .dotfiles per https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
  VSCODE_USER_HOME=($HOME/Library/Application\ Support/Code/User)
fi

if [[ $(uname) == "Linux" ]]; then
  # Sets up VSCode .dotfiles per https://pawelgrzybek.com/sync-vscode-settings-and-snippets-via-dotfiles-on-github/
  VSCODE_USER_HOME=($HOME/.config/Code/User/)
fi

if [[ ! -d $VSCODE_USER_HOME ]]; then
  echo "Creating $VSCODE_USER_HOME ..."
  mkdir -p $VSCODE_USER_HOME
  echo "Done"
else
  echo "$VSCODE_USER_HOME already exists..."
fi

# Defines path to this repos .dotfiles for VSCode
VSCODE_DOTFILES_DIR=$DOTFILES_DIR/Code

VSCODE_DOTFILES=("settings.json" "keybindings.json")

# Creates symlinks if they do not exist or creates a copy of an existing one if it exists and is not to the correct location
for VSCODE_DOTFILE in "${VSCODE_DOTFILES[@]}"
do
  if [[ -L "$VSCODE_USER_HOME/$VSCODE_DOTFILE" ]]; then
    if [[ "$VSCODE_USER_HOME/$VSCODE_DOTFILE" -ef "$VSCODE_DOTFILES_DIR/$VSCODE_DOTFILE" ]]; then
      echo "$VSCODE_USER_HOME/$VSCODE_DOTFILE symlink already correct..."
    else
      echo "Copying $VSCODE_USER_HOME/$VSCODE_DOTFILE $VSCODE_USER_HOME/$VSCODE_DOTFILE.$timestamp..."
      mv $VSCODE_USER_HOME/$VSCODE_DOTFILE $VSCODE_USER_HOME/$VSCODE_DOTFILE.$timestamp
      echo "Creating symlink for $VSCODE_USER_HOME/$VSCODE_DOTFILE..."
      ln -s $VSCODE_DOTFILES_DIR/$VSCODE_DOTFILE $VSCODE_USER_HOME/$VSCODE_DOTFILE
    fi
  else
    echo "Creating symlink for $VSCODE_USER_HOME/$VSCODE_DOTFILE..."
    ln -s $VSCODE_DOTFILES_DIR/$VSCODE_DOTFILE $VSCODE_USER_HOME/$VSCODE_DOTFILE
  fi
done

if [[ -L $VSCODE_USER_HOME/snippets ]]; then
  if [[ "$VSCODE_USER_HOME/snippets" -ef "$VSCODE_DOTFILES_DIR/snippets" ]]; then
    echo "$VSCODE_USER_HOME/snippets symlink already correct..."
  else
    echo "Copying $VSCODE_USER_HOME/snippets $VSCODE_USER_HOME/snippets.$timestamp..."
    mv $VSCODE_USER_HOME/snippets $VSCODE_USER_HOME/snippets.$timestamp
    echo "Creating symlink for $VSCODE_USER_HOME/snippets..."
    ln -s $VSCODE_DOTFILES_DIR/snippets/ $VSCODE_USER_HOME/snippets
  fi
else
  echo "Creating symlink for $VSCODE_USER_HOME/snippets..."
  ln -s $VSCODE_DOTFILES_DIR/snippets/ $VSCODE_USER_HOME/snippets
fi
