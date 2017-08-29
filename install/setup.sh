#!/usr/bin/env bash

DOTFILES_DIR=$HOME/.dotfiles

$DOTFILES_DIR/setup.sh
$DOTFILES_DIR/install/setup_common_folders.sh
$DOTFILES_DIR/install/bootstrap.sh
$DOTFILES_DIR/install/setup_ansible_virtualenvs.sh

command -v ansible >/dev/null 2>&1
ANSIBLE_CHECK=$?
if [ $ANSIBLE_CHECK -eq 0 ]; then
  echo "Ansible already installed"
else
  command -v pip >/dev/null 2>&1
  PIP_CHECK=$?
  command -v pip2 >/dev/null 2>&1
  PIP2_CHECK=$?
  if [ $PIP_CHECK -eq 0 ]; then
    sudo pip install ansible ansible-lint
    elif [ $PIP2_CHECK -eq 0 ]; then
    sudo pip2 install ansible ansible-lint
  fi
fi

ansible-playbook $DOTFILES_DIR/install/ansible-install-os-packages.yml -K
