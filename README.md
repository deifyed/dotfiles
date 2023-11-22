# README

## Initializing

1. In the new user/machine, generate an SSH key pair by following the instructions [here](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/). Follow the /hostname/username/github/email format for naming.
2. Upload the public key to the Github account.
3. Run `chezmoi init --apply deifyed` to initialize the dotfiles and apply them to the system.
4. Run `cat "$HOME/output/" >> ~/.workdir-path`. This is where the `cdw` alias will teleport you to.
5. Run `cat "" >> ~/.aliases.secret`. This is where secret aliases that are not version controlled live.
6. Run `mkdir -p ~/.local/src/` to ensure existing folder, then `git clone https://github.com/rupa/z.git ~/.local/src/z`
