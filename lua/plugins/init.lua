local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use({ "wbthomason/packer.nvim" })
	--	use({ "rose-pine/neovim", as = "rose-pine", config = "vim.cmd('colorscheme rose-pine')" })
	use({ "rose-pine/neovim", as = "rose-pine" })
	use({ "RRethy/nvim-base16" })
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = "require('configs.treesitter-config')" })
	use({ "windwp/nvim-ts-autotag" })
	use({ "p00f/nvim-ts-rainbow" })
	use({ "windwp/nvim-autopairs", config = "require('configs.autopairs-config')" })
	use({ "folke/which-key.nvim", config = "require('configs.whichkey-config')" })
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = "require('configs.telescope-config')",
	})
	use({
		"AckslD/nvim-neoclip.lua",
		requires = { "tami5/sqlite.lua", module = "sqlite" },
		config = "require('configs.neoclip')",
	})
	use({
		"hoob3rt/lualine.nvim",
		requires = { { "kyazdani42/nvim-web-devicons", opt = true } },
		config = "require('configs.lualine-config')",
	})
	use({
		"akinsho/bufferline.nvim",
		requires = { { "kyazdani42/nvim-web-devicons" } },
		config = "require('configs.bufferline-config')",
	})
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { { "kyazdani42/nvim-web-devicons" } },
		config = "require('configs.nvimtree-config')",
	})
	use({ "neovim/nvim-lspconfig", config = "require('configs.lsp')" })
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			{ "kdheepak/cmp-latex-symbols" },
		},
		sources = {
			{ name = "latex_symbols" },
		},
	})
	use({ "hrsh7th/cmp-nvim-lsp" })
	use({ "hrsh7th/cmp-vsnip" })
	use({ "hrsh7th/vim-vsnip" })
	use({ "hrsh7th/cmp-path" })
	use({ "hrsh7th/cmp-cmdline" })
	use({ "hrsh7th/cmp-buffer" })
	use({ "onsails/lspkind-nvim" })
	use({ "mhartington/formatter.nvim", config = "require('configs.formatting')" })
	use({ "goolord/alpha-nvim", config = "require('configs.alpha')" })
	use({ "ahmedkhalf/project.nvim", config = "require('configs.project-config')" })
	use({ "lewis6991/impatient.nvim", config = "require('configs.impatient-config')" })
	use({ "akinsho/toggleterm.nvim", config = "require('configs.toggleterm-config')" })
	use({ "lervag/vimtex" })
	use({ "ellisonleao/glow.nvim" })
	use({ "norcalli/nvim-colorizer.lua", config = "require('colorizer').setup()" })
	use({ "lewis6991/gitsigns.nvim", config = "require('gitsigns').setup()" })
	use({ "lukas-reineke/indent-blankline.nvim", config = "require('configs.blankline-config')" })
	use({ "terrortylor/nvim-comment", config = "require('configs.comment-config')" })
	use({
		"blackCauldron7/surround.nvim",
		config = function()
			require("surround").setup({ mappings_style = "surround" })
		end,
	})
	use({ "kyazdani42/nvim-web-devicons" })
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	if packer_bootstrap then
		require("packer").sync()
	end
end)
