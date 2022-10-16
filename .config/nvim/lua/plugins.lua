local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
        vim.cmd([[packadd packer.nvim]])
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
    use("wbthomason/packer.nvim")

    use("nathom/filetype.nvim")
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("indent_blankline").setup({
                show_current_context = true,
                show_current_context_start = true,
            })
        end,
    })

    -- suda
    use({
        "lambdalisue/suda.vim",
        config = function()
            vim.g.suda_smart_edit = 1
        end,
    })

    use({
        "ThePrimeagen/harpoon",
        config = function()
            require("harpoon").setup()
        end,
    })

    use({
        "aserowy/tmux.nvim",
        config = function()
            require("tmux").setup()
        end,
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("nvim-treesitter.configs").setup({
                auto_install = true,
                highlight = {
                    enable = true,
                },
            })
        end,
    })
    use({ "nvim-treesitter/nvim-treesitter-context" })

    use("mfussenegger/nvim-dap")
    use({
        "rcarriga/nvim-dap-ui",
        requires = { "mfussenegger/nvim-dap" },
        config = function()
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
        end,
    })
    use({
        "leoluz/nvim-dap-go",
        config = function()
            require("dap-go").setup({})
        end,
        requires = { "mfussenegger/nvim-dap" },
    })

    use({
        "folke/neodev.nvim",
    })
    use("neovim/nvim-lspconfig")
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
            require("null-ls").setup({
                sources = {
                    require("null-ls").builtins.formatting.prettier,
                    require("null-ls").builtins.formatting.gofmt.with {
                        arguments = { "-s" },
                    },
                    require("null-ls").builtins.formatting.stylua,
                    require("null-ls").builtins.diagnostics.shellcheck,
                    require("null-ls").builtins.formatting.shfmt,
                },
            })
        end,
    })

    use("github/copilot.vim")

    use({
        "L3MON4D3/LuaSnip",
        config = function()
            require("luasnip.loaders.from_snipmate").lazy_load()
        end,
    })
    use("saadparwaiz1/cmp_luasnip")
    use("honza/vim-snippets")

    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use({
        "hrsh7th/nvim-cmp",
        config = function()
            local cmp = require("cmp")

            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                window = {},
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                }),
                sources = cmp.config.sources({
                    { name = "copilot" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })

            cmp.setup.filetype("gitcommit", {
                sources = cmp.config.sources({
                    { name = "cmp_git" },
                }, {
                    { name = "buffer" },
                }),
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = "buffer" },
                },
            })

            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = "path" },
                }, {
                    { name = "cmdline" },
                }),
            })
        end,
    })

    use({
        "phaazon/hop.nvim",
        branch = "v2",
        config = function()
            require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
        end,
    })

    use("kyazdani42/nvim-web-devicons")
    use({
        "kyazdani42/nvim-tree.lua",
        config = function()
            require("nvim-tree").setup({})
        end,
    })

    use({ "dracula/vim", as = "dracula" })
    use({ "ellisonleao/gruvbox.nvim" })

    -- install lualine
    -- use 'vim-airline/vim-airline'
    use({
        "hoob3rt/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
        config = function()
            require("lualine").setup({})
        end,
    })

    use("nvim-lua/plenary.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.0",
        config = function()
            require("telescope").setup({})
        end,
    })
    use({
        "folke/todo-comments.nvim",
        config = function()
            require("todo-comments").setup({})
        end,
    })
    use({
        "winston0410/commented.nvim",
        config = function()
            require("commented").setup({
                set_keybindings = false,
            })
        end,
    })

    use({
        "Pocco81/true-zen.nvim",
        config = function()
            require("true-zen").setup({})
        end,
    })

    use("tpope/vim-fugitive")

    --use({
    --    "folke/noice.nvim",
    --    event = "VimEnter",
    --    config = function()
    --        require("noice").setup()
    --    end,
    --    requires = {
    --        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    --        "MunifTanjim/nui.nvim",
    --        "rcarriga/nvim-notify",
    --    }
    --})

    --  use {
    --  "folke/which-key.nvim",
    --  config = function()
    --  require("which-key").setup {
    --  -- your configuration comes here
    --  -- or leave it empty to use the default settings
    --  -- refer to the configuration section below
    --  }
    --  end
    --  }

    if packer_bootstrap then
        require("packer").sync()
    end
end)
