local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use({
        "aserowy/tmux.nvim",
        config = function() require("tmux").setup() end
    })

    use 'nvim-treesitter/nvim-treesitter'

    use 'neovim/nvim-lspconfig'

    use 'github/copilot.vim'

    -- I prefer copilot.vim right now over nvim-cmp
    --[[ use {
        "zbirenbaum/copilot.lua",
        event = { "VimEnter" },
        config = function()
            vim.defer_fn(function()
                require("copilot").setup {
                }
            end, 100)
        end,
    }

    use {
        "zbirenbaum/copilot-cmp",
        after = { "copilot.lua", "nvim-cmp" },
        config = function()
            require("copilot_cmp").setup {
                method = "getCompletionsCycling",
                force_autofmt = false,
                clear_after_cursor = true,
                formatters = {
                    label = require("copilot_cmp.format").format_label_text,
                    insert_text = require("copilot_cmp.format").format_insert_text,
                    preview = require("copilot_cmp.format").deindent,
                },
            }
        end
    }]] --

    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'
    use 'honza/vim-snippets'

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'


    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'

    use { 'dracula/vim', as = 'dracula' }
    use 'vim-airline/vim-airline'

    use 'nvim-lua/plenary.nvim'
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.0' }
    use 'folke/todo-comments.nvim'
    use 'Pocco81/true-zen.nvim'
    use 'FeiyouG/command_center.nvim'

    use 'tpope/vim-fugitive'

    use({
        "folke/noice.nvim",
        event = "VimEnter",
        config = function()
            require("noice").setup()
        end,
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        }
    })

    use {
        "folke/which-key.nvim",
        config = function()
            require("which-key").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
