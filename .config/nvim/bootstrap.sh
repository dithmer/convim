cd "$(dirname "$(realpath "$0")")"
pushd /tmp

# install prerequisites
curl -fsSL https://deb.nodesource.com/setup_lts.x > node_setup_lts.sh
sudo bash node_setup_lts.sh
sudo apt-get install -y nodejs

# install newest neovim
sudo apt remove --purge neovim

wget https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb

sudo dpkg -i nvim-linux64.deb

# install plug.vim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

popd
nvim -S "bootstrap.vim"
