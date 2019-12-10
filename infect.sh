#!/bin/bash
ln balias ~/.balias
ln bfunctions ~/.bfunctions

mkdir -p ~/.local/bin
echo "export PATH=$PATH:~/.local/bin" >> ~/.profile
