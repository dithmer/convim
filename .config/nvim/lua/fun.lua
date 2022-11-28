M = {}

function M.TempKeymap(f, t)
	-- ask for keymap mode via select
	local mode = ""
	vim.ui.select({ "n", "i", "v" }, {
		prompt = "Select mode:",
	}, function(choice)
		mode = choice
	end)

	-- ask for keys via input
	local keys = ""
	vim.ui.input({
		prompt = "Enter keys:",
	}, function(choice)
		keys = choice
	end)

	-- ask for command via input
	local command = ""
	vim.ui.input({
		prompt = "Enter command:",
	}, function(choice)
		command = choice
	end)

	-- set keymap
	vim.keymap.set(mode, keys, command, { noremap = true })
end

-- create user command for TempKeymap
vim.cmd([[command! -nargs=0 TempKeymap lua require("fun").TempKeymap()]])

return M
