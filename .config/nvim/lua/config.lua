-- setup nvim-tree
require("nvim-tree").setup()

-- setup telescope
require("telescope").setup()

-- setup true-zen
require("true-zen").setup()

-- setup toto-comments
require("todo-comments").setup()

-- setup command_center
require("telescope").load_extension("command_center")

local command_center = require("command_center")
local noremap = { noremap = true }
local silent_noremap = { noremap = true, silent = true }

-- open command_center on F1
vim.api.nvim_set_keymap("n", "<c-P>", ":Telescope command_center<CR>", silent_noremap)

-- command_center keymaps
command_center.add({
	{
		desc = "Git add current file",
		cmd = "<CMD>Git add %<CR>",
		keys = {},
	},
	{
		desc = "Git commit",
		cmd = "<CMD>Git commit<CR>",
		keys = {},
	},
	{
		desc = "Git push",
		cmd = "<CMD>Git push<CR>",
		keys = {},
	},
	{
		desc = "npm run dev",
		cmd = "<CMD>NpmRun dev<CR>",
		keys = {},
	},
	{
		desc = "source current file",
		cmd = "<CMD>source %<CR>",
		keys = {},
	},
})

-- run command in background
local Job = require("plenary.job")

-- run npm run dev with plenary job
local function NpmRunAsync(cmd)
	local job = Job:new({
		command = "npm",
		args = { "run", cmd },
	})
	job:start()
end

return {
	NpmRunAsync = NpmRunAsync,
}
