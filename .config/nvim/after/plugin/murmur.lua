MURMUR_AUGROUP = "murmur_augroup"
vim.api.nvim_create_augroup(MURMUR_AUGROUP, { clear = true })

local murmur = require("murmur")
murmur.setup({
	cursor_rgb = "green",
})
