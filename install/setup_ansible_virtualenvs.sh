#!/usr/bin/env bash

ANSIBLE_VERSIONS=("1.9.4" "1.9.5" "1.9.6" "2.0.0.0" "2.0.0.1" "2.0.0.2" \
  "2.0.1.0" "2.0.2.0" "2.1.0.0" "2.1.1.0" "2.1.2.0" "2.1.3.0" \
  "2.1.4.0" "2.1.5.0" "2.1.6.0" "2.2.0.0" "2.2.1.0" "2.2.2.0" \
  "2.2.3.0" "2.3.0.0" "2.3.1.0" "2.3.2.0" "2.3.3.0" "2.4.0.0" "2.4.1.0" \
  "2.4.2.0" "2.4.3.0" "2.4.4.0" "2.4.5.0" "2.5.0" "2.5.1" "2.5.3" "2.5.4" \
  "2.5.5")
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

sudo $PIP_CMD install virtualenv

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
