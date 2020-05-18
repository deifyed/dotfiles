#!/bin/bash
ln aliases ~/.aliases
ln functions ~/.functions
ln vimrc ~/.vimrc

mkdir -p ~/.local/bin
mkdir -p ~/.config

infect() {
  echo ". ~/.balias" >> $1
  echo ". ~/.bfunctions" >> $1
  echo "export PATH=$PATH:~/.local/bin" >> $1
}

[ -f "~/.bashrc" ] && infect ~/.bashrc
[ -f "~/.zshrc" ] && infect ~/.zshrc
