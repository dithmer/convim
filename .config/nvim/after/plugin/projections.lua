local ok, projections = pcall(require, "projections")
if not ok then
	return
end

projections.setup({
	workspaces = {
		"~/dev",
		"~/work",
		{ "~/.config", {} },
	},
	patterns = {
		".git",
	},
})

local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.load_extension("projections")

local ok, Workspace = pcall(require, "projections.workspace")
if not ok then
	return
end
vim.api.nvim_create_user_command("AddWorkspace", function()
	Workspace.add(vim.loop.cwd())
end, {})

-- Autostore session on DirChange and VimExit
local Session = require("projections.session")
vim.api.nvim_create_autocmd({ "DirChangedPre", "VimLeavePre" }, {
	callback = function()
		Session.store(vim.loop.cwd())
	end,
})

-- Switch to project if vim was started in a project dir
local switcher = require("projections.switcher")
vim.api.nvim_create_autocmd({ "VimEnter" }, {
	callback = function()
		if vim.fn.argc() == 0 then
			switcher.switch(vim.loop.cwd())
		end
	end,
})
