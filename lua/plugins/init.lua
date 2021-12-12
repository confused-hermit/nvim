local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone' , '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd[[packadd packer.nvim]]

return require('packer').startup(function(use)
   use ({'wbthomason/packer.nvim'})
   use ({'rose-pine/neovim', as = 'rose-pine' , config = "vim.cmd('colorscheme rose-pine')"})
   use ({'nvim-treesitter/nvim-treesitter', run = ":TSUpdate", config = "require('configs.treesitter-config')"})
   use ({'windwp/nvim-ts-autotag'})
   use ({'p00f/nvim-ts-rainbow'})
   use ({'windwp/nvim-autopairs', config = "require('configs.autopairs-config')"})
   use ({'folke/which-key.nvim', config = "require('configs.whichkey-config')"})
   use ({'nvim-telescope/telescope.nvim', requires = {{'nvim-lua/plenary.nvim'}}, config= "require('configs.telescope-config')"} )
   use ({'hoob3rt/lualine.nvim', requires = {{'kyazdani42/nvim-web-devicons', opt =true}}, config = "require('configs.lualine-config')" })
   use ({'akinsho/bufferline.nvim', requires = {{'kyazdani42/nvim-web-devicons'}}, config = "require('configs.bufferline-config')"})
   use ({'kyazdani42/nvim-tree.lua', requires = {{'kyazdani42/nvim-web-devicons'}}, config = "require('configs.nvimtree-config')"})
    if packer_bootstrap then
        require('packer').sync()
    end
end)
