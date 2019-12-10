#!/bin/bash
ln balias ~/.balias
ln bfunctions ~/.bfunctions

mkdir -p ~/.local/bin

infect() {
  echo "export PATH=$PATH:~/.local/bin" >> $1
}

[ -f "~/.bashrc" ] && infect ~/.bashrc
[ -f "~/.zshrc" ] && infect ~/.zshrc
