call plug#begin()
" Github CoPilot
Plug 'github/copilot.vim'

" fugitive
Plug 'tpope/vim-fugitive'

" NerdTREE
Plug 'preservim/nerdtree'
" Dracula Theme
Plug 'dracula/vim', { 'as': 'dracula' }
" Truezen
Plug 'Pocco81/true-zen.nvim'
lua << EOF
	require("true-zen").setup {
		-- your config goes here
		-- or just leave it empty :)
	}
EOF

" vim-airline
Plug 'vim-airline/vim-airline'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" coc
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" emmet
Plug 'mattn/emmet-vim'
" vim-surround
Plug 'tpope/vim-surround'

" vim npm plugin
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}

" vim-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

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

inoremap jk <Esc>

" Split navigation shortcuts
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

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
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
nnoremap <leader>f :NERDTreeFind<CR>
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']

" auto update plugins on startup
" autocmd VimEnter * PlugUpdate --sync | bd

let g:user_emmet_leader_key='<C-Z>'
let g:user_emmet_install_global = 0
autocmd FileType vue,html,css EmmetInstall

" Open FZF on CTRL-d
nnoremap <C-d> :Files<CR>
" Open FZF buffers on ctrl-b
nnoremap <C-b> :Buffers<CR>

set updatetime=100
set signcolumn=yes

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" fugitive shortcuts
nnoremap <leader>ga :Git add %<CR>
nnoremap <leader>gc :Git commit<CR>
nnoremap <leader>gp :Git push<CR>

" Go File settings
let g:go_auto_type_info = 1
let g:go_auto_sameids = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"

" Coc Format on ctrl-f
nnoremap <silent> <C-f> :call CocAction('format')<CR>
