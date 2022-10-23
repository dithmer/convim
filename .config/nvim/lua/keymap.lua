-- remap esc to jk
vim.keymap.set("i", "jk", "<esc>", { noremap = true })
vim.keymap.set("v", "jk", "<esc>", { noremap = true })

-- save, quit, hard quit
vim.keymap.set("n", "<leader>q", ":q<cr>", { noremap = true })
vim.keymap.set("n", "<leader>Q", ":q!<cr>", { noremap = true })
vim.keymap.set("n", "<leader>w", ":w<cr>", { noremap = true })
vim.keymap.set("n", "<leader>W", ":w !sudo tee %<cr>", { noremap = true })

-- easier splits
vim.keymap.set("n", "s[", ":belowright split<cr>", { silent = true, noremap = true })
vim.keymap.set("n", "s]", ":belowright vsplit<cr>", { silent = true, noremap = true })

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

-- tabs and tab navigation
vim.keymap.set("n", "<leader>tt", ":tabnew<cr>", { noremap = true })
vim.keymap.set("n", "<leader>tc", ":tabclose<cr>", { noremap = true })
vim.keymap.set("n", "<M-n>", ":tabprevious<cr>", { noremap = true })
vim.keymap.set("n", "<M-m>", ":tabnext<cr>", { noremap = true })

-- packer commands
vim.keymap.set("n", "<leader>ps", ":PackerSync<cr>", { noremap = true })

-- toggle NvimTree
vim.keymap.set("n", "<leader>o", ":NvimTreeToggle<cr>", { noremap = true })

-- harpoon
vim.keymap.set("n", "<leader>hh", ":lua require('harpoon.ui').toggle_quick_menu()<cr>", { noremap = true })
vim.keymap.set("n", "<leader><leader>h", function()
	require("harpoon.mark").add_file()
end, { noremap = true })

for i = 1, 4 do
	vim.keymap.set("n", "<leader>h" .. i, function()
		require("harpoon.ui").nav_file(i)
	end, { noremap = true })
end

-- luasnip
local ls = require("luasnip")
vim.keymap.set({ "i", "s" }, "<C-k>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { noremap = true })

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
vim.keymap.set("n", "<leader>fw", telescope_builtin.lsp_dynamic_workspace_symbols, { noremap = true })
vim.keymap.set("n", "<leader>fc", telescope_builtin.command_history, { noremap = true })
vim.keymap.set("n", "<leader>fx", telescope_builtin.symbols, { noremap = true })

-- LSP
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { noremap = true })
vim.keymap.set("n", "<space>ff", vim.lsp.buf.format, { noremap = true })
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, { noremap = true })

-- diagnostics
vim.keymap.set("n", "<space>dn", vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set("n", "<space>dp", vim.diagnostic.goto_prev, { noremap = true })

-- commented
local commented = require("commented")
vim.keymap.set("n", "<leader>c", commented.commented, { noremap = true, expr = true, silent = true })
vim.keymap.set("x", "<leader>/", commented.commented, { noremap = true, expr = true, silent = true })
vim.keymap.set("n", "<leader>/", commented.commented_line, { noremap = true, expr = true, silent = true })

-- hop
local hop = require("hop")
vim.keymap.set("", "f", function()
	hop.hint_char1()
end, { remap = true })
vim.keymap.set("", "F", function()
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
vim.keymap.set("n", "<leader>ds", require("dap").stop, { noremap = true })

-- dapui
vim.keymap.set("n", "<leader>dui", require("dapui").toggle, { noremap = true })

-- execute current luafile
vim.keymap.set("n", "<leader>x", function()
	vim.cmd("luafile " .. vim.fn.expand("%"))
end, { noremap = true })

-- toggleterm
vim.keymap.set("n", "<leader>sh", ":ToggleTerm direction=float<cr>", { noremap = true })
