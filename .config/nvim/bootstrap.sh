#!/bin/bash
set -euo pipefail

GOLANG_VERSION="1.19.1"
STYLUA_VERSION="0.14.3"
SHFMT_VERSION="3.5.1"

install_nodejs() {
	curl -fsSL https://deb.nodesource.com/setup_lts.x >node_setup_lts.sh
	sudo bash node_setup_lts.sh
	sudo apt-get install -y nodejs
}

install_neovim() {
	sudo apt remove --purge neovim*
	wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb
	sudo dpkg -i nvim-linux64.deb
}

install_golang() {
	wget https://go.dev/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz
	sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go${GOLANG_VERSION}.linux-amd64.tar.gz
}

install_neovim_plug() {
	#sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           #https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
}

install_stylua() {
	wget https://github.com/JohnnyMorganz/StyLua/releases/download/v${STYLUA_VERSION}/stylua-linux.zip
	unzip stylua-linux.zip
	sudo mv stylua /usr/local/bin
}

install_shfmt() {
	sudo wget https://github.com/mvdan/sh/releases/download/v${SHFMT_VERSION}/shfmt_v${SHFMT_VERSION}_linux_amd64 -O /usr/local/bin/shfmt
	sudo chmod +x /usr/local/bin/shfmt
}

install_lua_language_server() {
	wget https://github.com/sumneko/lua-language-server/releases/download/3.5.6/lua-language-server-3.5.6-linux-x64.tar.gz
	sudo rm -rf /opt/lua-language-server
	sudo mkdir -p /opt/lua-language-server
	sudo tar -xvf lua-language-server-3.5.6-linux-x64.tar.gz -C /opt/lua-language-server
	USER=$(whoami)
	sudo chown -R "$USER:$USER" /opt/lua-language-server
}

install_shellcheck() {
	sudo apt-get install -y shellcheck
}

cd "$(dirname "$(realpath "$0")")" || return
pushd /tmp || exit 1
install_nodejs
install_golang

install_lua_language_server
install_shfmt
install_shellcheck
install_stylua

install_neovim
install_neovim_plug

popd || exit 1
