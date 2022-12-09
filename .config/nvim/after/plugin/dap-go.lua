local dapgo = require("dap-go")
dapgo.setup({})

local dap = require("dap")
table.insert(dap.configurations.go, {
	type = "go",
	request = "launch",
	name = "launch main package",
	program = ".",
})
