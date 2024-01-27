help:  ## Shows available Makefile targets in a list ordered by expected execution
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

directories:  ## Ensure expected directories
	mkdir -p ${HOME}/.local/{share,src,bin}
	mkdir -p ${HOME}/{downloads,output,input}

files:  ## Ensure files expected by different configuration files
	echo '${HOME}/output/' > ${HOME}/.workdir-path
	echo "" > ${HOME}/.aliases.secret

cli:  ## Install and configure CLI
	git clone https://aur.archlinux.org/yay.git ${HOME}/.local/src/yay && cd ${HOME}/.local/src/yay && makepkg -si
	yay --noconfirm -S chezmoi wget tree eza curlie bat jq go-yq fzf ripgrep unzip z
	cd ${HOME}/downloads && wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && sh install.sh
	chezmoi init --apply deifyed

gvm:  ## Install gvm
	yay --noconfirm -S go
	cd ${HOME}/downloads && wget https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer && sh gvm-installer
	gvm install go1.21.1
	gvm use go1.21.1 --default
	yay -Rs go

desktop:  ## Install and configure the desktop environment
	git clone https://github.com/deifyed/statusmsg.git ${HOME}/.local/src/statusmsg && cd ${HOME}/.local/src/statusmsg && make build && make install
	git clone https://github.com/deifyed/topbg.git ${HOME}/.local/src/topbg && cd ${HOME}/.local/src/topbg && make build && make install
	git clone https://github.com/deifyed/wstoggler.git ${HOME}/.local/src/wstoggler && cd ${HOME}/.local/src/wstoggler && make build && make install
	yay -S \
		ttf-firacode ttf-firacode-nerd \
		sway swayidle swaylock swaybg wofi \
		alacritty \
		firefox

keyboard:  ## Install and configure keyboard related stuff
	yay -S interception-tools interception-dual-function-keys interception-caps2esc
	sudo mkdir -p /etc/interception/conf.d/
	sudo cp ${HOME}/.local/share/chezmoi/div/interception/conf.d/dual-shifts-en.yaml /etc/interception/conf.d/dual-shifts-en.yaml
	sudo cp ${HOME}/.local/share/chezmoi/div/interception/udevmon.yaml /etc/interception/udevmon.yaml
	sudo systemctl enable --now udevmon

audio:  ## Install and configure audio
	yay -S pipewire pipewire-alsa pipewire-jack wireplumber qpwgraph
