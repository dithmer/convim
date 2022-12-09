local dapgo = require("dap-go")
dapgo.setup({})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.go" },
	callback = function()
		vim.keymap.set("n", "<leader>dt", function()
			if not dapgo.debug_test() then
				dapgo.debug_last_test()
			end
		end, { silent = true })
	end,
})

local dap = require("dap")
table.insert(dap.configurations.go, {
	type = "go",
	request = "launch",
	name = "launch main package",
	program = ".",
})
