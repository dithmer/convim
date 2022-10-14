# Enable the subsequent settings only in interactive sessions
case $- in
  *i*) ;;
    *) return;;
esac

# Path to your oh-my-bash installation.
export OSH="$HOME/.oh-my-bash"

#  OSH_THEME="font"
OSH_THEME="random"

export UPDATE_OSH_DAYS=1

OMB_USE_SUDO=true

# Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# Custom completions may be added to ~/.oh-my-bash/custom/completions/
# Example format: completions=(ssh git bundler gem pip pip3)
# Add wisely, as too many completions slow down shell startup.
completions=(
  git
  composer
  ssh
)

# Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# Example format: aliases=(vagrant composer git-avh)
# Add wisely, as too many aliases slow down shell startup.
aliases=(
  general
)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bashmarks
)

if [ "$DISPLAY" ] || [ "$SSH" ]; then
    plugins+=(tmux-autoattach)
fi

source "$OSH"/oh-my-bash.sh

export EDITOR="nvim"
export LANG=en_US.UTF-8

alias bashconfig="nvim +'cd $HOME' $HOME/.bashrc"
alias nvimconfig="nvim +'cd $HOME/.config/nvim' +'e init.lua' +'NvimTreeFindFile'"
alias i3config="nvim +'cd $HOME/.config/i3/' +'e config'"
alias convim='/usr/bin/git --git-dir=$HOME/.convim/ --work-tree=$HOME'

alias pinstall='pacman -Slq | fzf --multi --preview '\''pacman -Si {1}'\'' | xargs -re sudo pacman --noconfirm -S'
