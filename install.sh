#!/bin/bash

# install nix
sh <(curl -L https://nixos.org/nix/install)

# source nix
source /etc/bashrc

# install packages
nix-env -iA \
	nixpkgs.zsh \
	nixpkgs.antibody \
	nixpkgs.git \
	nixpkgs.neovim \
	nixpkgs.zellij \
	nixpkgs.stow \
	nixpkgs.bat

# stow packages

stow alacritty
stow git
stow nvim
stow zsh
stow zellij

# add zsh to valid login shells
command -v zsh | sudo tee -a /etc/shells

# use zsh as the default shell
sudo chsh -s $(which zsh) $USER

# bundle zsh plugins
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh


