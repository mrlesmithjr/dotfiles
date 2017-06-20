#!/usr/bin/env bash

# Define where dotfiles repo exists
DOTFILES_DIR=$HOME/.dotfiles

# Define folder where to backup any existing dotfiles
DOTFILES_DIR_BACKUP=$HOME/.dotfiles_old

# Define dotfiles to manage
dotfiles=(".atom" ".bash_profile" ".bashrc" ".gitconfig" ".gitignore_global" \
".vim" ".vimrc")

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
