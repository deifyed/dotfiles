SHELL := /bin/bash

YAY_SRC_DIR=${HOME}/.local/src/yay
/usr/bin/yay:
	git clone https://aur.archlinux.org/yay.git ${YAY_SRC_DIR}
	cd ${YAY_SRC_DIR} && makepkg -si

OHMYZSH_INSTALLER_PATH=${HOME}/downloads/ohmyzsh-install.sh
${HOME}/.oh-my-zsh: ${OHMYZSH_INSTALLER_PATH}
	curl https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh --output ${OHMYZSH_INSTALLER_PATH}
	sh ${OHMYZSH_INSTALLER_PATH}

GVM_INSTALLER_PATH=${HOME}/downloads/gvm-installer
${GVM_INSTALLER_PATH}:
	curl https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer --output ${GVM_INSTALLER_PATH}

STATUS_MSG_SRC_PATH=${HOME}/.local/src/statusmsg
STATUS_MSG_BIN_PATH=${HOME}/.local/bin/statusmsg
${STATUS_MSG_SRC_PATH}:
	git clone https://github.com/deifyed/statusmsg.git ${STATUS_MSG_SRC_PATH}
${STATUS_MSG_BIN_PATH}: ${STATUS_MSG_SRC_PATH}
	cd ${STATUS_MSG_SRC_PATH} && make build && make install

TOPBG_SRC_PATH=${HOME}/.local/src/topbg
TOPBG_BIN_PATH=${HOME}/.local/bin/topbg
${TOPBG_SRC_PATH}:
	git clone https://github.com/deifyed/topbg.git ${TOPBG_SRC_PATH}
${TOPBG_BIN_PATH}: ${TOPBG_SRC_PATH}
	cd ${TOPBG_SRC_PATH} && make build && make install

WS_TOGGLER_SRC_PATH=${HOME}/.local/src/wstoggler
WS_TOGGLER_BIN_PATH=${HOME}/.local/bin/wstoggler
${WS_TOGGLER_SRC_PATH}:
	git clone https://github.com/deifyed/wstoggler.git ${WS_TOGGLER_SRC_PATH}
${WS_TOGGLER_BIN_PATH}: ${WS_TOGGLER_SRC_PATH}
	cd ${WS_TOGGLER_SRC_PATH} && make build && make install

${HOME}/.gvm/:
	yay --noconfirm -S go
	sh ${GVM_INSTALLER_PATH}
	source ${HOME}/.gvm/scripts/gvm && gvm install go1.22.1
	source ${HOME}/.gvm/scripts/gvm && gvm use go1.22.1 --default
	yay --noconfirm -Rs go

/usr/bin/sway:
	yay --noconfirm -S \
		ttf-firacode ttf-firacode-nerd \
		sway swayidle swaylock swaybg wofi \
		alacritty \
		firefox

help:  ## Shows available Makefile targets in a list ordered by expected execution
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

directories:  ## Ensure expected directories
	mkdir -p ${HOME}/.local/{share,src,bin}
	mkdir -p ${HOME}/{downloads,output,input}

files:  ## Ensure files expected by different configuration files
	echo '${HOME}/output/' > ${HOME}/.workdir-path
	echo "" > ${HOME}/.aliases.secret

cli: /usr/bin/yay ${HOME}/.oh-my-zsh  ## Install and configure CLI
	yay --noconfirm -S chezmoi tree eza curlie bat jq go-yq fzf ripgrep unzip z

dotfiles: ## Configure dotfiles
	chezmoi init --apply deifyed
	echo "vi ${HOME}/.config/chezmoi/chezmoi.toml to fill out required data"

gvm: ${GVM_INSTALLER_PATH} ${HOME}/.gvm/ ## Install Go version manager

desktop: /usr/bin/yay /usr/bin/sway ${STATUS_MSG_BIN_PATH} ${TOPBG_BIN_PATH} ${WS_TOGGLER_BIN_PATH}  ## Install and configure the desktop environment

keyboard: /usr/bin/yay  ## Install and configure keyboard related stuff
	yay -S interception-tools interception-dual-function-keys interception-caps2esc
	sudo mkdir -p /etc/interception/conf.d/
	sudo cp ${HOME}/.local/share/chezmoi/div/interception/conf.d/dual-shifts-en.yaml /etc/interception/conf.d/dual-shifts-en.yaml
	sudo cp ${HOME}/.local/share/chezmoi/div/interception/udevmon.yaml /etc/interception/udevmon.yaml
	sudo systemctl enable --now udevmon

audio: /usr/bin/yay  ## Install and configure audio
	yay -S pipewire pipewire-alsa pipewire-jack wireplumber qpwgraph
