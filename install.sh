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
	nixpkgs.ripgrep

# stow packages
stow git
stow zsh
stow alacritty
stow nvim
stow zellij
stow fonts

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as the default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh

