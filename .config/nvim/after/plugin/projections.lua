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
