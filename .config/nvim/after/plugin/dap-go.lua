require("dap-go").setup({})

-- map leader dt to debug test
-- but only in go files
vim.api.nvim_exec(
	[[
augroup dap-go
  autocmd!
  autocmd FileType go nmap <silent> <leader>dt <cmd>lua require("dap-go").debug_test()<CR>
augroup END
]],
	false
)

local dap = require("dap")
table.insert(dap.configurations.go, {
	type = "go",
	request = "launch",
	name = "launch main package",
	program = ".",
})
