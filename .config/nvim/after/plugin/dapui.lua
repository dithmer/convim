local dapui = require("dapui")
dapui.setup({
	layouts = {
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				{ id = "scopes", size = 0.25 },
				"breakpoints",
			},
			size = 0.33,
			position = "bottom",
		},
		{
			elements = {
				-- Elements can be strings or table with id and size keys.
				"watches",
			},
			size = 0.15,
			position = "right",
		},
	},
	controls = {
		enabled = false,
	},
})

local dap = require("dap")
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end
