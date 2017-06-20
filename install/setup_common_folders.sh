#!/usr/bin/env bash

folders=("$HOME/Git_Projects" "$HOME/Git_Projects/GitHub" \
  "$HOME/Git_Projects/GitHub/mrlesmithjr" "$HOME/Git_Projects/GitLab" \
"$HOME/projects")

for folder in "${folders[@]}"
do
  if [ ! -d $folder ]; then
    echo "Creating folder $folder ..."
    mkdir -p $folder
    echo "Done"
    elif [ -d $folder ]; then
    echo "Folder $folder already exists ..."
  fi
done
