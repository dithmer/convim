require("dapui").setup({
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
	},
	controls = {
		enabled = false,
	},
})
