require("nvim-tree").setup({
	sync_root_with_cwd = true,
	reload_on_bufenter = true,
	update_focused_file = {
		enable = true,
		update_root = true,
	},
	respect_buf_cwd = true,
	hijack_cursor = true,
	open_on_tab = true,
})
