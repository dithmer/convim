local M = {}

P = function(v)
	print(vim.inspect(v))
	return v
end

if pcall(require, "plenary") then
	RELOAD = require("plenary.reload").reload_module

	R = function(name)
		RELOAD(name)
		return require(name)
	end
end

-- https://ustrajunior.com/posts/reloading-neovim-config-with-telescope/
local function get_module_name(s)
	local module_name

	module_name = s:gsub("%.lua", "")
	module_name = module_name:gsub("%/", ".")
	module_name = module_name:gsub("%.init", "")

	return module_name
end

local config_path = vim.fn.stdpath("config") .. "/lua"

function M.module_telescope()
	local prompt_title = "~ neovim modules ~"

	-- sets the path to the lua folder

	local opts = {
		prompt_title = prompt_title,
		cwd = config_path,

		attach_mappings = function(_, map)
			map("i", "<c-r>", function(_)
				local entry = require("telescope.actions.state").get_selected_entry()
				local name = get_module_name(entry.value)

				R(name)
				P(name .. " RELOADED!!!")
			end)

			return true
		end,
	}

	-- call the builtin method to list files
	require("telescope.builtin").find_files(opts)
end

function M.current_file()
	-- remove config path prefix form current file
	local current_file = get_module_name(vim.fn.expand("%:p"):gsub(config_path .. "/", ""))

	R(current_file)
	P(current_file .. " RELOADED!!!")
end

return M
