#!/bin/bash
# .bash_profile

if [ -f ~/.bashrc ]; then
  # shellcheck source=/dev/null
  . ~/.bashrc
fi

# shellcheck source=/dev/null
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
