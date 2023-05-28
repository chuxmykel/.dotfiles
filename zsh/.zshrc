# nvm
export NVM_DIR=${HOME}/.nvm
export NVM_COMPLETION=true

source ${HOME}/.zsh_plugins.sh

# aliases
alias vim="nvim"
alias cat="bat"
alias ls="ls -ahl"

# DIRCOLORS (MacOS)
export CLICOLOR=1

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'; fi

