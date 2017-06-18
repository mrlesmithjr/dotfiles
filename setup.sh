#!/usr/bin/env bash

# Define where dotfiles repo exists
dir=$HOME/.dotfiles

# Define folder where to backup any existing dotfiles
dir_backup=$HOME/.dotfiles_old

# Define dotfiles to manage
dotfiles=(".atom" ".bash_profile" ".bashrc" ".gitconfig" ".gitignore_global" \
".vim" ".vimrc")

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")

if [ ! -d $dir_backup ]; then
  echo "Creating $dir_backup to store any existing dotfiles..."
  mkdir -p $dir_backup
  echo "Done"
fi

echo "Changing to $dir directory..."
cd $dir || exit

for dotfile in "${dotfiles[@]}"
do
  if [ -f $HOME/$dotfile ]; then
    echo "Backing up $dotfile to $dir_backup/$dotfile.$timestamp..."
    mv -f $HOME/$dotfile $dir_backup/$dotfile.$timestamp
    echo "Done"
  fi
  if [ -d $HOME/$dotfile ]; then
    echo "Backing up $dotfile directory to $dir_backup/$dotfile.$timestamp..."
    mv -f $HOME/$dotfile $dir_backup/$dotfile.$timestamp
    echo "Done"
  fi
done

cd $HOME || exit
for dotfile in "${dotfiles[@]}"
do
  echo "Creating symlink for $dir/$dotfile..."
  ln -s $dir/$dotfile .
  echo "Done"
done
