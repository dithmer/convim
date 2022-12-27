local telescope_builtin = require("telescope.builtin")
local luasnip = require("luasnip")
local legendary = require("legendary")
local commented = require("commented")
local dap = require("dap")
local dapui = require("dapui")
local hop = require("hop")
legendary.setup({
	include_builtin = false,
	include_legendary_cmds = false,
	keymaps = {
		{ "<tab><tab>", legendary.find, mode = { "n", "v" } },
		{ "jk", "<esc>", description = "jk to escape", hide = true, mode = { "i" } },
		{ "x", '"_x', description = "no yank on x", hide = true },
		{
			"<C-k>",
			function()
				if luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				end
			end,
			description = "luasnip expand or jump",
			hide = true,
			mode = { "i" },
		},
		{ "<leader>rl", ":windo e<cr>", desc = "Reload all windows" },
		{ "<leader>q", ":q<cr>", description = "Close buffer" },
		{ "Q", ":qa<cr>", description = "Close all buffers/neovim" },
		{ "<leader>w", ":w<cr>", description = "Save file" },
		{
			"<leader>/",
			{ x = commented.commented, n = commented.commented_line },
			description = "Comment line or selection",
			opts = { expr = true },
		},
		{
			"<leader>sc",
			function()
				require("reload").current_file()
			end,
			description = "Reload current file",
		},
		{
			itemgroup = "Hop",
			description = "Hop keymaps",
			icon = "",
			keymaps = {
				{ "f", hop.hint_char1, description = "Hop char1" },
				{ "F", hop.hint_words, description = "Hop words" },
			},
		},
		{ "<leader>sh", ":ToggleTerm direction=float<cr>", description = "Open floating toggle term" },
		{ "<leader>ps", ":PackerSync<cr>", desc = "packer sync" },
		{ "<leader>o", ":NvimTreeToggle<cr>", desc = "toggle NvimTree" },
		{ "<C-n>", "<C-\\><C-n>", desc = "leave the input mode in terminal", mode = { "t" } },
	},
	itemgroups = {
		{
			itemgroup = "Splits",
			icon = "",
			description = "Split keymaps",
			keymaps = {
				{ "s[", ":belowright split<cr>", description = "split below" },
				{ "s]", ":belowright vsplit<cr>", description = "split right" },
				{ "<leader>ss", ":SwapSplit<cr>", description = "swap splits" },

				{ "<a-j>", ":resize -2<cr>", description = "resize split down" },
				{ "<a-k>", ":resize +2<cr>", description = "resize split up" },
				{ "<a-h>", ":vertical resize -5<cr>", description = "resize split left" },
				{ "<a-l>", ":vertical resize +5<cr>", description = "resize split right" },

				{ "<C-h>", "<C-w>h", description = "navigate to left split" },
				{ "<C-j>", "<C-w>j", description = "navigate to down split" },
				{ "<C-k>", "<C-w>k", description = "navigate to up split" },
				{ "<C-l>", "<C-w>l", description = "navigate to right split" },

				{ "H", "^", description = "go to start of line", mode = { "n", "v" } },
				{ "L", "$", description = "go to end of line", mode = { "n", "v" } },
			},
		},
		{
			itemgroup = "Tabs",
			description = "Tabs keymaps",
			icon = "ﱚ",
			keymaps = {

				{ "<leader>tt", ":tabnew<cr>", description = "new tab" },
				{ "<leader>tc", ":tabclose<cr>", description = "close tab" },
				{ "<M-n>", ":tabprevious<cr>", description = "previous tab" },
				{ "<M-m>", ":tabnext<cr>", description = "next tab" },
			},
		},
		{
			itemgroup = "Harpoon",
			description = "Harpoon keymaps",
			icon = "↿",
			keymaps = {

				{
					"<leader>fa",
					":lua require('harpoon.ui').toggle_quick_menu()<cr>",
					description = "harpoon quick menu",
				},
				{
					"<leader><leader>f",
					function()
						require("harpoon.mark").add_file()
					end,
					description = "harpoon add file",
				},
				{ "<leader>fn", ":lua require('harpoon.ui').nav_next()<cr>", description = "harpoon next file" },
				{ "<leader>fm", ":lua require('harpoon.ui').nav_prev()<cr>", description = "harpoon previous file" },
			},
		},
		{
			itemgroup = "Telescope",
			icon = "",
			description = "Telescope keymaps",
			keymaps = {
				{
					"<leader>ff",
					function()
						telescope_builtin.find_files({ hidden = true })
					end,
					description = "telescope find files",
				},
				{ "<leader>fg", telescope_builtin.live_grep, description = "telescope live grep" },
				{ "<leader>fb", telescope_builtin.buffers, description = "telescope buffers" },
				{ "<leader>fh", telescope_builtin.help_tags, description = "telescope help tags" },
				{ "<leader>fd", telescope_builtin.diagnostics, description = "telescope diagnostics" },
				{
					"<leader>fs",
					telescope_builtin.lsp_document_symbols,
					description = "telescope lsp document symbols",
				},
				{
					"<leader>fw",
					telescope_builtin.lsp_dynamic_workspace_symbols,
					description = "telescope lsp workspace symbols",
				},
				{ "<leader>fc", telescope_builtin.command_history, description = "telescope command history" },
				{ "<leader>fx", telescope_builtin.symbols, description = "telescope symbols" },
				{
					"<leader>fp",
					function()
						vim.cmd("Telescope projections")
					end,
					description = "telescope projections",
				},
			},
		},
		{
			itemgroup = "LSP",
			icon = "",
			description = "LSP keymaps",
			keymaps = {
				{ "gd", vim.lsp.buf.definition, description = "go to definition" },
				{ "gD", vim.lsp.buf.declaration, description = "go to declaration" },
				{ "gr", ":Telescope lsp_references<cr>", description = "go to references" },
				{ "K", vim.lsp.buf.hover, description = "show hover" },
				{ "<space>ff", vim.lsp.buf.format, description = "format" },
				{ "<space>rn", vim.lsp.buf.rename, description = "rename" },
				{ "ga", { v = vim.lsp.buf.code_action, n = vim.lsp.buf.code_action }, description = "code action" },
			},
		},
		{
			itemgroup = "Diagnostic",
			icon = "",
			description = "Diagnostic keymaps",
			keymaps = {
				{
					"<space>dn",
					function()
						vim.diagnostic.goto_next()
					end,
					description = "next diagnostic",
				},
				{
					"<space>dp",
					function()
						vim.diagnostic.goto_prev()
					end,
					description = "previous diagnostic",
				},
			},
		},
		{
			itemgroup = "DAP",
			icon = "",
			description = "DAP keymaps",
			keymaps = {
				{ "<leader>db", require("dap").toggle_breakpoint, description = "toggle breakpoint" },
				{
					"<leader>dB",
					function()
						require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
					end,
					description = "set conditional breakpoint",
				},
				{ "<leader>dc", require("dap").continue, description = "continue" },
				{ "<leader>di", require("dap").step_into, description = "step into" },
				{ "<leader>do", require("dap").step_over, description = "step over" },
				{ "<leader>du", require("dap").step_out, description = "step out" },
				{
					"<leader>ds",
					function()
						vim.diagnostic.show()

						dap.close()
						dapui.close()
					end,
					description = "stop",
				},
				{ "<leader>dur", require("dap").repl.open, description = "repl open" },
				{ "<leader>dui", require("dapui").toggle, description = "toggle dap ui" },
			},
		},
		{
			itemgroup = "Git",
			icon = "",
			description = "Git",
			commands = {
				{
					"G",
					function()
						require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", direction = "float" }):toggle()
					end,
					description = "open lazygit",
				},
			},
		},
		{
			itemgroup = "Go",
			icon = "",
			description = "Go",
			keymaps = {
				{
					"<leader>dt",
					function()
						if vim.bo.filetype == "go" then
							local dapgo = require("dap-go")
							if not dapgo.debug_test() then
								dapgo.debug_last_test()
							end
						else
							print("Debug test not implemented for current filetype")
						end
					end,
					description = "Debug current or latest test",
				},
			},
			commands = {
				{
					"GoTest",
					function()
						require("go").RunTests()
					end,
					description = "Run go tests and output in diagnostics",
				},
			},
		},
	},
})
