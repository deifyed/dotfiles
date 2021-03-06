# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/deifyed/.oh-my-zsh"

export OK_DIR=/home/deifyed/origo

# Setting env
export LC_ALL=en_US.UTF-8
#export GOPATH=/home/deifyed/.local/lib/go
export EDITOR=vim
export VDIRSYNCER_CONFIG=/home/deifyed/life/contacts/.vdirsyncer/config

USER_HOME="/home/deifyed"
export XDG_DESKTOP_DIR="/tmp"
export XDG_DOWNLOAD_DIR="${USER_HOME}/downloads"
export XDG_CONFIG_HOME="${USER_HOME}/.config"

export HELM_HOME="${USER_HOME}/.config/helm"

export PATH=/home/deifyed/.local/bin:/home/deifyed/.local/share/npm/modules/bin:$PATH:$(go env GOPATH)/bin
export RPI="10.58.25.238"

source ~/.aliases
source ~/.functions

# Fix java applications in wayland
export _JAVA_AWT_WM_NONREPARENTING=1

# Wayland
export MOZ_ENABLE_WAYLAND=1

export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

#export WAYLAND_DEBUG=1
#export GDK_BACKEND=wayland

# Keys
eval $(keychain --eval --quiet --agents gpg,ssh)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	docker
	kubectl
	zsh-vim-mode
	fzf
	emoji-cli
)

source $ZSH/oh-my-zsh.sh

source /home/deifyed/.local/src/z/z.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/share/nvm/init-nvm.sh

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/mcli mcli

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/deifyed/.sdkman"
[[ -s "/home/deifyed/.sdkman/bin/sdkman-init.sh" ]] && source "/home/deifyed/.sdkman/bin/sdkman-init.sh"

[[ -s "/home/deifyed/.gvm/scripts/gvm" ]] && source "/home/deifyed/.gvm/scripts/gvm"

complete -o nospace -C /usr/bin/terraform terraform
complete -o nospace -C /usr/bin/kustomize kustomize
