help:  ## Shows available Makefile targets in a list ordered by expected execution
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

directories:  ## Ensure expected directories
	mkdir -p ${HOME}/.local/{share,src,bin}

files:  ## Ensure files expected by different configuration files
	echo '$HOME/output/' > ${HOME}/.workdir-path
	echo "" > ${HOME}/.aliases.secret

oh-my-zsh:  ## Install oh-my-zsh, should be done before installing dotfiles
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

dotfiles:  ## Install dotfiles with chezmoi
	sudo pacman -S chezmoi && chezmoi init --apply deifyed

yay:  ## Install yay
	git clone https://aur.archlinux.org/yay.git ${HOME}/.local/src/yay && cd $_ && makepkg -si

custom-binaries:  ## Install custom binaries
	git clone https://github.com/deifyed/statusmsg.git ${HOME}/.local/src/statusmsg && cd ${HOME}/.local/src/statusmsg && make && make install
	git clone https://github.com/deifyed/topbg.git ${HOME}/.local/src/topbg && cd ${HOME}/.local/src/topbg && make && make install

pacman-packages:  ## Install pacman packages
	sudo pacman -S tree eza curlie

