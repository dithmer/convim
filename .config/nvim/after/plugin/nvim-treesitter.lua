require("nvim-treesitter.configs").setup({
	auto_install = true,
	highlight = {
		enable = true,
	},
	autotag = {
		enable = true,
	},
	incremental_selection = {
		enable = true,
		keymaps = {
			init_selection = "<space>i", -- set to `false` to disable one of the mappings
			node_incremental = "<space>i",
		},
	},
})
