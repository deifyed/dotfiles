#!/bin/bash
ln balias ~/.balias
ln bfunctions ~/.bfunctions

mkdir -p ~/.local/bin

infect() {
  echo ". ~/.balias" >> $1
  echo ". ~/.bfunctions" >> $1
  echo "export PATH=$PATH:~/.local/bin" >> $1
}

[ -f "~/.bashrc" ] && infect ~/.bashrc
[ -f "~/.zshrc" ] && infect ~/.zshrc
