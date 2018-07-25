#!/usr/bin/env bash

if [[ $(uname) == "Linux" ]]; then
  # Ubuntu
  if [ -f /etc/debian_version ]; then
    codename="$(lsb_release -c | awk '{print $2}')"
    sudo apt-get update
    sudo apt-get -y install build-essential libffi-dev libssl-dev python-dev \
      python-minimal python-pip python-setuptools python-virtualenv virtualenv
  fi

  # RHEL
  if [ -f /etc/redhat-release ]; then
    codename="$(cat /etc/redhat-release | awk '{print $1}')"
    if [[ $codename == "Fedora" ]]; then
      sudo dnf -y install gmp-devel libffi-devel openssl-devel python-crypto \
        python-devel python-dnf python-pip python-setuptools python-virtualenv \
        redhat-rpm-config && \
        sudo dnf -y group install "C Development Tools and Libraries"
    elif [[ $codename == "CentOS" ]]; then
      sudo yum -y install gmp-devel libffi-devel openssl-devel python-crypto \
        python-devel python-pip python-setuptools python-virtualenv \
        redhat-rpm-config && \
        sudo yum -y group install "Development Tools"
    fi
  fi
fi

# MacOS
if [[ $(uname) == "Darwin" ]]; then
  if ! xcode-select --print-path &> /dev/null; then
    xcode-select --install &> /dev/null
  fi
  command -v brew >/dev/null 2>&1
  BREW_CHECK=$?
  if [ $BREW_CHECK -eq 0 ]; then
    echo "Brew already installed"
  else
    /usr/bin/ruby -e \
      "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew list | grep python >/dev/null 2>&1
  PYTHON_CHECK=$?
  if [ $PYTHON_CHECK -eq 0 ]; then
    echo "Python already installed"
  else
    brew install python@3 python@2
  fi
fi
