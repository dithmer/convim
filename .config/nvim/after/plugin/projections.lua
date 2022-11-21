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

--  local ok, Session = pcall(require, "projections.session")
--  if not ok then
	--  return
--  end

--  vim.api.nvim_create_autocmd({ "DirChangedPre", "VimLeavePre" }, {
	--  callback = function()
		--  Session.store(vim.loop.cwd())
	--  end,
--  })

--  vim.api.nvim_create_autocmd({ "VimEnter" }, {
	--  callback = function()
		--  if vim.fn.argc() ~= 0 then
			--  return
		--  end
		--  local session_info = Session.info(vim.loop.cwd())
		--  if session_info == nil then
			--  Session.restore_latest()
		--  else
			--  Session.restore(vim.loop.cwd())
		--  end
	--  end,
	--  desc = "Restore last session automatically",
--  })

local ok, Workspace = pcall(require, "projections.workspace")
if not ok then
	return
end
vim.api.nvim_create_user_command("AddWorkspace", function()
	Workspace.add(vim.loop.cwd())
end, {})
