call plug#begin()
" Native LSP
Plug 'neovim/nvim-lspconfig'

" nvim-tree
Plug 'kyazdani42/nvim-web-devicons' " optional, for file icons
Plug 'kyazdani42/nvim-tree.lua'

" vim-surround
Plug 'tpope/vim-surround'

" Dracula Theme
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'folke/todo-comments.nvim'
Plug 'Pocco81/true-zen.nvim'
Plug 'FeiyouG/command_center.nvim'

" fugitive
Plug 'tpope/vim-fugitive'

" Github CoPilot
Plug 'github/copilot.vim'
" emmet
Plug 'mattn/emmet-vim'
" vim npm plugin
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}

" vim-go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" let g:copilot_no_tab_map = v:true
" imap <silent><script><expr> <C-J> copilot#Accept("\<CR>")

" Add return as shortcut for coc completion
inoremap <silent><expr> <C-J> coc#pum#visible() ? coc#pum#confirm() : "\<C-J>"

syntax enable
colorscheme dracula

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

inoremap jk <Esc>

" Split navigation shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" resize shortcuts
nnoremap <A-m> :resize -2<CR>
nnoremap <A-n> :resize +2<CR>

" New tab on n
nnoremap <silent> nt :tabnew<CR>

" Switch tabs with arrow left and right
nnoremap <silent> <C-Left> :tabprevious<CR>
nnoremap <silent> <C-Right> :tabnext<CR>

let mapleader = ","

nnoremap <leader>ev :e $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>

nnoremap <leader>pi :PlugInstall<CR>

" Truezen shortcuts
nnoremap <leader>za :TZAtaraxis<CR>
nnoremap <leader>zm :TZMinimalist<CR>
nnoremap <leader>zf :TZFocus<CR>
nnoremap <leader>zn :TZNarrow<CR>
vnoremap <leader>zr :'<,'>TZNarrow<CR>

" terminal emulation
nnoremap <silent> <leader>sh :bel 8split term://bash<CR>

nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>

autocmd StdinReadPre * let s:std_in=1

" Find current file in nvim-tree
nnoremap <leader>f :NvimTreeFindFile<CR>
" Open nvim-tree
nnoremap <leader>o :NvimTreeToggle<CR>

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType vue,html,css EmmetInstall

" Open telescrop on CTRL-d
nnoremap <C-d> :Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>
" Open telescope buffers on ctrl-b
nnoremap <C-b> :Telescope buffers<CR>
" Open telescope live grep on ctrl-g
nnoremap <C-g> :Telescope live_grep<CR>
" Open telescope commands on ctrl-s
nnoremap <C-s> :Telescope commands<CR>
" Open telescope quickfix on ctrl-q
nnoremap <C-q> :Telescope quickfix<CR>
" Open telescope man on ctrl-m
nnoremap <C-y> :Telescope help_tags<CR>

" fugitive shortcuts
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>

" load lua config
lua require('config')

command! CMDS lua require('config').NpmRunAsync()
