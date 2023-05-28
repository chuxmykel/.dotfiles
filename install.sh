#!/bin/bash

# install nix
sh <(curl -L https://nixos.org/nix/install)

# source nix
source /etc/bashrc

# install packages
nix-env -iA \
	nixpkgs.git \
	nixpkgs.zsh \
	nixpkgs.alacritty \
	nixpkgs.antibody \
	nixpkgs.neovim \
	nixpkgs.zellij \
	nixpkgs.stow \
	nixpkgs.bat \
	nixpkgs.ripgrep \
	nixpkgs.fd

# stow packages
stow git
stow zsh
stow alacritty
stow nvim
stow zellij
stow fonts

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# NOTE: looks like command -v zsh is pointing to the default zsh that comes with macos /bin/zsh
# if we are hardcore about the nix version, a workaround will be to access the nix zsh binary directly
# $HOME/.nix-profile/bin/zsh | sudo tee -a /etc/shells

# use zsh as the default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

