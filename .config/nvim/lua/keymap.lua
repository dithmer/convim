-- remap esc to jk
vim.keymap.set("i", "jk", "<esc>", { noremap = true })

-- save, quit, hard quit
vim.keymap.set("n", "<leader>q", ":q<cr>", { noremap = true })
vim.keymap.set("n", "<leader>Q", ":q!<cr>", { noremap = true })
vim.keymap.set("n", "<leader>w", ":w<cr>", { noremap = true })
vim.keymap.set("n", "<leader>W", ":w !sudo tee %<cr>", { noremap = true })

-- split navigation shortcuts
vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true })

-- use H and L to go to start and end of line in normal and visual mode
vim.keymap.set("n", "H", "^", { noremap = true })
vim.keymap.set("n", "L", "$", { noremap = true })
vim.keymap.set("v", "H", "^", { noremap = true })
vim.keymap.set("v", "L", "$", { noremap = true })

-- packer commands
vim.keymap.set("n", "<leader>ps", ":PackerSync<cr>", { noremap = true })

-- toggle NvimTree
vim.keymap.set("n", "<leader>o", ":NvimTreeToggle<cr>", { noremap = true })

-- TrueZen
vim.keymap.set("n", "<leader>zz", require("true-zen.ataraxis").toggle, { noremap = true })

-- Telescope
local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", function()
	telescope_builtin.find_files({ hidden = true })
end, { noremap = true })
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { noremap = true })
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers, { noremap = true })
vim.keymap.set("n", "<leader>fh", telescope_builtin.help_tags, { noremap = true })
vim.keymap.set("n", "<leader>fd", telescope_builtin.diagnostics, { noremap = true })
vim.keymap.set("n", "<leader>fs", telescope_builtin.lsp_document_symbols, { noremap = true })
vim.keymap.set("n", "<leader>fc", telescope_builtin.command_history, { noremap = true })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
vim.keymap.set("n", "<space>ff", vim.lsp.buf.format, { noremap = true })
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { noremap = true })

-- commented
local commented = require("commented")
vim.keymap.set("n", "<leader>c", commented.commented, { noremap = true, expr = true, silent = true })
vim.keymap.set("x", "<leader>/", commented.commented, { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "<leader>/", commented.commented_line, { noremap = true, expr = true, silent = true })

-- hop
local hop = require("hop")
vim.keymap.set("", "f", function()
	hop.hint_words()
end, { remap = true })

-- reload
vim.keymap.set("n", "<leader>sv", require("reload").module_telescope, { noremap = true })
vim.keymap.set("n", "<leader>sc", require("reload").current_file, { noremap = true })

-- dap
vim.keymap.set("n", "<leader>db", require("dap").toggle_breakpoint, { noremap = true })
vim.keymap.set("n", "<leader>dc", require("dap").continue, { noremap = true })
vim.keymap.set("n", "<leader>di", require("dap").step_into, { noremap = true })
vim.keymap.set("n", "<leader>do", require("dap").step_over, { noremap = true })
vim.keymap.set("n", "<leader>dr", require("dap").repl.toggle, { noremap = true })

-- dapui
vim.keymap.set("n", "<leader>dui", require("dapui").toggle, { noremap = true })
