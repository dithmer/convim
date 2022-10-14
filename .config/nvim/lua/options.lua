-- Performance
local disabled_built_ins = {
  "2html_plugin",
  "getscript",
  "getscriptPlugin",
  "gzip",
  "logipat",
  "netrw",
  "netrwPlugin",
  "netrwSettings",
  "netrwFileHandlers",
  "matchit",
  "matchparen",
  "tar",
  "tarPlugin",
  "rrhelper",
  "vimball",
  "vimballPlugin",
  "zip",
  "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
  vim.g["loaded_" .. plugin] = 1
end

vim.g.mapleader = ','

vim.opt.termguicolors = true
vim.opt.showmatch = true
vim.opt.ignorecase = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.ttyfast = true
vim.opt.updatetime = 100
vim.opt.signcolumn = "yes"
vim.opt.autowrite = true
vim.opt.timeoutlen = 300
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

vim.opt.background = "dark"

local colorscheme = 'gruvbox'
local ok, _ = pcall(require, colorscheme)
if ok then
    vim.cmd([[colorscheme ]] .. colorscheme)
else
    vim.cmd([[colorscheme default]])
end

vim.opt.scrolloff = 20
