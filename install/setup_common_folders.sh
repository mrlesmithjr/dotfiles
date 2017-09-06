#!/usr/bin/env bash

folders=("$HOME/Git_Projects" "$HOME/Git_Projects/Personal/GitHub" \
  "$HOME/Git_Projects/Personal/GitHub/mrlesmithjr" \
  "$HOME/Git_Projects/Personal/GitLab" "$HOME/Git_Projects/Work" \
"$HOME/projects")

for folder in "${folders[@]}"
do
  if [ ! -d $folder ]; then
    echo "Creating folder $folder ..."
    mkdir -p $folder
    echo "Done"
  else [ -d $folder ]
    echo "Folder $folder already exists ..."
  fi
done
