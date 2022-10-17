-- lsp setup
--  local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local capabilities =require("cmp_nvim_lsp").default_capabilities()
local nvim_lsp = require("lspconfig")

nvim_lsp.gopls.setup({
	capabilities = capabilities,
})

nvim_lsp.golangci_lint_ls.setup({
	capabilities = capabilities,
	init_options = {
		command = {
			"golangci-lint",
			"run",
			"--out-format",
			"json",
			"--enable-all",
			"--disable",
			"forbidigo,wsl,gci,gofumpt,gochecknoglobals,exhaustivestruct,exhaustruct",
		},
	},
})

-- Debian differs from Arch for global npm installation
local tsdk_path = '/usr/lib/node_modules/typescript/lib'
if not vim.fn.isdirectory(tsdk_path) then
    tsdk_path = '/usr/local/lib/node_modules/typescript/lib'
end

nvim_lsp.volar.setup({
	capabilities = capabilities,
	filetypes = { "html", "vue", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	init_options = {
		typescript = {
			tsdk = tsdk_path,
		},
	},
})

nvim_lsp.tsserver.setup({
	capabilities = capabilities,
})

nvim_lsp.tailwindcss.setup({
	capabilities = capabilities,
})

require("neodev").setup({})
nvim_lsp.sumneko_lua.setup({
	capabilities = capabilities,
	cmd = { "/opt/lua-language-server/bin/lua-language-server" },
})

vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
nvim_lsp.terraformls.setup({
	capabilities = capabilities,
	filetypes = { "terraform", "tf" },
	cmd = { "terraform-ls", "serve" },
})

nvim_lsp.tflint.setup({
	capabilities = capabilities,
	filetypes = { "terraform", "tf" },
	cmd = { "tflint", "--langserver" },
})

nvim_lsp.bashls.setup({
	capabilities = capabilities,
})

nvim_lsp.rust_analyzer.setup({})
