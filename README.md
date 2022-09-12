# Checkout
git clone --bare "git@github.com:dithmer/convim.git" "$HOME/.convim"

alias convim='/usr/bin/git --git-dir=$HOME/.convim/ --work-tree=$HOME'

convim checkout
