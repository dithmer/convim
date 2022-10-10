#!/bin/bash
set -euo pipefail

NEOVIM_VERSION="0.8.0"

install_neovim() {
	sudo apt remove --purge neovim*
    wget https://github.com/neovim/neovim/releases/download/v"$NEOVIM_VERSION"/nvim-linux64.deb
	sudo dpkg -i nvim-linux64.deb
}

install_neovim
