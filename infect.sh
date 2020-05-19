#!/bin/bash
mkdir -p ~/.local/bin
mkdir -p ~/.config

ln aliases ~/.aliases || true
ln functions ~/.functions || true
ln vimrc ~/.vimrc || true
ln zshrc ~/.zshrc || true

ln bin/k ~/.local/bin/k || true

infect() {
	# Not needed since I'm storing my .zshrc
  echo ". ~/.aliases" >> $1
  echo ". ~/.functions" >> $1
  echo "export PATH=$PATH:~/.local/bin" >> $1
}

#[ -f "~/.bashrc" ] && infect ~/.bashrc
#[ -f "~/.zshrc" ] && infect ~/.zshrc
