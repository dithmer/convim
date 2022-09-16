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
local noremap = {noremap = true}
local silent_noremap = {noremap = true, silent = true}

-- open command_center on F1
vim.api.nvim_set_keymap("n", "<c-P>", ":Telescope command_center<CR>", silent_noremap)

-- command_center keymaps
command_center.add({
  {
    desc = "Git add current file",
    cmd = "<CMD>Git add %<CR>",
    keys = {},
  }
})
