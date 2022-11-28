-- run lsp format on save
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.format({
			timeout = 100,
		})
	end,
})
