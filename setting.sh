#!/bin/sh

# Vim Packer
if [ -e ~/.local/share/nvim/site/pack/packer/start/packer.nvim ]; then
  rm -rf ~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

CURRENT=$(pwd)

if [ -e ~/.config/nvim/init.lua ]; then
  unlink ~/.config/nvim/init.lua
fi
mkdir -p ~/.config/nvim
ln -s $CURRENT/nvim/init.lua ~/.config/nvim

if [ -e ~/.zshrc ]; then
  unlink ~/.zshrc
fi
ln -s $CURRENT/.zshrc ~

if [ -e ~/.gitconfig ]; then
  unlink ~/.gitconfig
fi
ln -s $CURRENT/.gitconfig ~
