syntax enable
colorscheme dracula

set termguicolors
set nocompatible
set showmatch
set ignorecase
set hlsearch
set incsearch
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4
set autoindent
set number
set relativenumber
set wildmode=longest,list
set cc=80
filetype plugin indent on
set clipboard=unnamedplus
filetype plugin on
set cursorline
set ttyfast
set updatetime=100
set signcolumn=yes
set autowrite
set timeoutlen=300
set completeopt=menu,menuone,noselect

lua require('options')
lua require('plugins')
lua require('keymap')
lua require('config')
