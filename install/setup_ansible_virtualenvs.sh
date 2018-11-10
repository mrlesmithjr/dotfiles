#!/usr/bin/env bash

ANSIBLE_VERSIONS=("2.5.0" "2.5.1" "2.5.3" "2.5.4" "2.5.5" "2.5.6" "2.5.7" \
  "2.5.8" "2.5.9" "2.5.10" "2.6.0" "2.6.1" "2.6.2" "2.6.3" "2.6.4" "2.6.5" \
  "2.6.6" "2.7.0" "2.7.1")
ANSIBLE_CONTAINER_VERSIONS=("0.1.0" "0.2.0" "0.3.0" "0.9.0.0" "0.9.1" "0.9.2")
VIRTUALENV_PATH="$HOME/python-virtualenvs"

# Detect pip command
command -v pip >/dev/null 2>&1
PIP_CHECK=$?
command -v pip2 >/dev/null 2>&1
PIP2_CHECK=$?
if [ $PIP_CHECK -eq 0 ]; then
  PIP_CMD="pip"
elif [ $PIP2_CHECK -eq 0 ]; then
  PIP_CMD="pip2"
fi

sudo $PIP_CMD install -U pip cffi pyOpenSSL
sudo $PIP_CMD install virtualenv

read -p "Install previous Ansible versions (y/n)?" choice
case "$choice" in
  y|Y ) echo "yes";;
  n|N ) echo "no";;
  * ) echo "invalid";;
esac

if [ "$choice" = "y" ]; then
  # Setup Ansible Virtual Environments
  for ANSVER in "${ANSIBLE_VERSIONS[@]}"
  do
    if [ ! -d "$VIRTUALENV_PATH/ansible-$ANSVER" ]; then
      virtualenv $VIRTUALENV_PATH/ansible-$ANSVER
      source $VIRTUALENV_PATH/ansible-$ANSVER/bin/activate
      $PIP_CMD install ansible==$ANSVER ansible-lint
      deactivate
    fi
  done
fi

# Setup Ansible Container Virtual Environments
# for ANSCONTVER in "${ANSIBLE_CONTAINER_VERSIONS[@]}"
# do
#   if [ ! -d "$VIRTUALENV_PATH/ansible-container-$ANSCONTVER" ]; then
#     virtualenv $VIRTUALENV_PATH/ansible-container-$ANSCONTVER
#     source $VIRTUALENV_PATH/ansible-container-$ANSCONTVER/bin/activate
#     $PIP_CMD install ansible-container[docker]==$ANSCONTVER ansible-lint
#     deactivate
#   fi
# done
