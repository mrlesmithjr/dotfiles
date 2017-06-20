#!/usr/bin/env bash

ANSIBLE_VERSIONS=("1.9.4" "1.9.5" "1.9.6" "2.0.0.0" "2.0.0.1" "2.0.0.2" \
  "2.0.1.0" "2.0.2.0" "2.1.0.0" "2.1.1.0" "2.1.2.0" "2.1.3.0" \
  "2.1.4.0" "2.1.5.0" "2.1.6.0" "2.2.0.0" "2.2.1.0" "2.2.2.0" \
"2.2.3.0" "2.3.0.0" "2.3.1.0")
ANSIBLE_CONTAINER_VERSIONS=("0.1.0" "0.2.0" "0.3.0" "0.9.0.0" "0.9.1")
VIRTUALENV_PATH="$HOME/python-virtualenvs"

# Check if Python Virtualenv already installed and install if not
which virtualenv >/dev/null 2>&1
VIRTUALENV_CHECK=$?
if [ $VIRTUALENV_CHECK -eq 0 ]; then
  echo "Python Virtualenv already installed"
  elif [ $VIRTUALENV_CHECK -ne 0 ]; then
  pip install virtualenv
fi

# Setup Ansible Virtual Environments
for ANSVER in "${ANSIBLE_VERSIONS[@]}"
do
  if [ ! -d "$VIRTUALENV_PATH/ansible-$ANSVER" ]; then
    virtualenv $VIRTUALENV_PATH/ansible-$ANSVER
    source $VIRTUALENV_PATH/ansible-$ANSVER/bin/activate
    pip install ansible==$ANSVER ansible-lint
    deactivate
  fi
done

# Setup Ansible Container Virtual Environments
for ANSCONTVER in "${ANSIBLE_CONTAINER_VERSIONS[@]}"
do
  if [ ! -d "$VIRTUALENV_PATH/ansible-container-$ANSCONTVER" ]; then
    virtualenv $VIRTUALENV_PATH/ansible-container-$ANSCONTVER
    source $VIRTUALENV_PATH/ansible-container-$ANSCONTVER/bin/activate
    pip install ansible-container[docker]==$ANSCONTVER ansible-lint
    deactivate
  fi
done
