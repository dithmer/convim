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
	use({ "wbthomason/packer.nvim" })

	use({ "dracula/vim", as = "dracula" })
	use({ "ellisonleao/gruvbox.nvim" })
	use({ "folke/tokyonight.nvim" })

	use({ "nathom/filetype.nvim" })
	use({ "aserowy/tmux.nvim" })
	use({ "ja-ford/delaytrain.nvim" })
	use({ "akinsho/toggleterm.nvim" })

	use({ "lukas-reineke/indent-blankline.nvim" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "windwp/nvim-autopairs" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "winston0410/commented.nvim" })

	use({ "lambdalisue/suda.vim" })

	use({ "ThePrimeagen/harpoon" })

	use({ "nvim-treesitter/nvim-treesitter" })
	use({ "nvim-treesitter/nvim-treesitter-context" })

	use({ "phaazon/hop.nvim", branch = "v2" })
	use({ "mfussenegger/nvim-treehopper", requires = { "nvim-treesitter/nvim-treesitter", "phaazon/hop.nvim" } })

	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui", requires = { "mfussenegger/nvim-dap" } })
	use({ "leoluz/nvim-dap-go", requires = { "mfussenegger/nvim-dap" } })

	use({ "onsails/lspkind.nvim" })
	-- use({ "github/copilot.vim" })
	use({ "folke/neodev.nvim" })
	use({ "zbirenbaum/copilot.lua" })
	use({ "neovim/nvim-lspconfig" })
	use({ "jose-elias-alvarez/null-ls.nvim" })

	use({ "L3MON4D3/LuaSnip" })
	use({ "saadparwaiz1/cmp_luasnip" })
	use({ "honza/vim-snippets" })

	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/nvim-cmp" })

	use({ "kyazdani42/nvim-web-devicons" })
	use({ "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } })

	use({ "hoob3rt/lualine.nvim", requires = { "kyazdani42/nvim-web-devicons", opt = true } })

	use({ "nvim-lua/plenary.nvim" })
	use({ "nvim-telescope/telescope.nvim", tag = "0.1.0" })
	use({ "nvim-telescope/telescope-symbols.nvim" })

	if packer_bootstrap then
		require("packer").sync()
	end
end)
