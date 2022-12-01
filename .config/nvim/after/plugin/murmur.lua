MURMUR_AUGROUP = "murmur_augroup"
vim.api.nvim_create_augroup(MURMUR_AUGROUP, { clear = true })

local murmur = require("murmur")
murmur.setup({
	cursor_rgb = "green",
})

vim.api.nvim_create_autocmd("CursorHold", {
	group = MURMUR_AUGROUP,
	pattern = "*.go",
	callback = function()
		-- skip when a float-win already exists.
		if vim.w.cursor_word ~= "" then
			vim.lsp.buf.hover()
		end
	end,
})
