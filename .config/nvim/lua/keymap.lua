-- remap esc to jk
vim.keymap.set('i', 'jk', '<esc>', { noremap = true })

-- save, quit, hard quit
vim.keymap.set('n', '<leader>q', ':q<cr>', { noremap = true })
vim.keymap.set('n', '<leader>Q', ':q!<cr>', { noremap = true })
vim.keymap.set('n', '<leader>w', ':w<cr>', { noremap = true })

-- split navigation shortcuts
vim.keymap.set('n', '<C-h>', '<C-w>h', { noremap = true })
vim.keymap.set('n', '<C-j>', '<C-w>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-w>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-w>l', { noremap = true })

-- toggle NvimTree
vim.keymap.set('n', '<leader>o', ':NvimTreeToggle<cr>', { noremap = true })

-- TrueZen
vim.keymap.set('n', '<leader>zz', require("true-zen.ataraxis").toggle, { noremap = true })

-- Telescope
local telescope = require('telescope')
local telescope_builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function() telescope_builtin.find_files({ hidden = true }) end, { noremap = true })
vim.keymap.set('n', '<leader>fg', telescope_builtin.live_grep, { noremap = true })
vim.keymap.set('n', '<leader>fb', telescope_builtin.buffers, { noremap = true })
vim.keymap.set('n', '<leader>fh', telescope_builtin.help_tags, { noremap = true })
vim.keymap.set('n', '<leader>fq', telescope_builtin.quickfix, { noremap = true })
vim.keymap.set('n', '<leader>fs', telescope_builtin.lsp_document_symbols, { noremap = true })
vim.keymap.set('n', '<leader>fc', telescope_builtin.command_history, { noremap = true })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
vim.keymap.set("n", "<space>ff", vim.lsp.buf.format, { noremap = true })

-- hop
local hop = require('hop')
vim.keymap.set('', 'f', function() hop.hint_words() end, { remap = true })
