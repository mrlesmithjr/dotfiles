#!/usr/bin/env bash

DOTFILES_DIR=$HOME/.dotfiles

$DOTFILES_DIR/setup.sh
$DOTFILES_DIR/install/setup_common_folders.sh
$DOTFILES_DIR/install/bootstrap.sh
$DOTFILES_DIR/install/setup_ansible_virtualenvs.sh

which ansible >/dev/null 2>&1
ANSIBLE_CHECK=$?
if [ $ANSIBLE_CHECK -eq 0 ]; then
  echo "Ansible already installed"
  elif [ $ANSIBLE_CHECK -ne 0 ]; then
  pip install ansible ansible-lint
fi

if [[ $(uname) == "Darwin" ]]; then
  ansible-playbook $DOTFILES_DIR/install/ansible-macos-homebrew-packages.yml
fi
