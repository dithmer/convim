#!/bin/bash
# Enable the subsequent settings only in interactive sessions
case $- in
*i*) ;;
*) return ;;
esac

# get linux distribution
if [ -f /etc/os-release ]; then
	# freedesktop.org and systemd
	. /etc/os-release
	export OS=$NAME
	export OS_VER=$VERSION_ID
elif type lsb_release >/dev/null 2>&1; then
	# linuxbase.org
	export OS=$(lsb_release -si)
	export OS_VER=$(lsb_release -sr)
elif [ -f /etc/lsb-release ]; then
	# For some versions of Debian/Ubuntu without lsb_release command
	. /etc/lsb-release
	export OS=$DISTRIB_ID
	export OS_VER=$DISTRIB_RELEASE
elif [ -f /etc/debian_version ]; then
	# Older Debian/Ubuntu/etc.
	export OS=Debian
	export OS_VER=$(cat /etc/debian_version)
elif [ -f /etc/SuSe-release ]; then
	# Older SuSE/etc.
	...
elif [ -f /etc/redhat-release ]; then
	# Older Red Hat, CentOS, etc.
	...
else
	# Fall back to uname, e.g. "Linux <version>", also works for BSD, etc.
	export OS=$(uname -s)
	export OS_VER=$(uname -r)
fi

# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"

#  OSH_THEME="font"
export OSH_THEME="powerline"

export UPDATE_OSH_DAYS=1

export OMB_USE_SUDO=true

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
export completions=(
	git
	composer
	ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
export aliases=(
	general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
export plugins=(
	git
	bashmarks
)

if [ "$DISPLAY" ] || [ "$SSH_TTY" ] || [ "$SSH_CLIENT" ]; then
	plugins+=(tmux-autoattach)
fi

source "$OSH"/oh-my-bash.sh

export EDITOR="nvim"
export LANG=en_US.UTF-8

alias bashconfig="nvim +'cd \$HOME' \$HOME/.bashrc"
alias nvimconfig="nvim +'cd \$HOME/.config/nvim' +'e init.lua' +'NvimTreeFindFile'"
alias i3config="nvim +'cd \$HOME/.config/i3/' +'e config'"
alias convim='/usr/bin/git --git-dir=$HOME/.convim/ --work-tree=$HOME'

if [[ "$OS" == "Arch Linux" ]]; then
	alias pinstall='yay -Slq | fzf --multi --preview '\''yay -Si {1}'\'' | xargs -re yay --noconfirm -S'
	alias pupdate='yay'
    alias plist='yay -Qqe'
elif [[ "$OS" == "Ubuntu" ]]; then
	alias pinstall="apt-cache dump | grep ^Package: | cut -d\" \" -f2 | fzf --multi --preview 'apt-cache show {1}' --preview-window=up | xargs -re sudo apt-get install -y"
	alias pupdate='sudo apt update && sudo apt full-upgrade'
fi

alias cat='bat'

export PATH="$HOME/.local/bin:$PATH"

# Add $HOME/go/bin to PATH if go is installed
if command -v go &>/dev/null; then
	export PATH="$PATH:$HOME/go/bin"
fi

# source fzf
if [ -d /usr/share/fzf ]; then
	source /usr/share/fzf/key-bindings.bash
	source /usr/share/fzf/completion.bash
fi

# add zoxide if installed
if command -v zoxide &>/dev/null; then
    eval "$(zoxide init bash)"
fi

# add gem binaries to PATH
if command -v gem &>/dev/null; then
    export PATH="$PATH:$(ruby -e 'puts Gem.user_dir')/bin"
fi

neofetch
