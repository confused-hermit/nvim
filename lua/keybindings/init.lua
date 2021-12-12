vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap

local opts = {noremap = true, silent = false}
local opts1 = {noremap = true, silent = true}
-- save file 
map("n", "<C-s>", ":w<cr>", opts)
map("i", "<C-s>", "<ESC>:w<cr>", opts)
-- moving between splits
map('n', '<C-h>', '<C-w>h', opts )
map('n', '<C-l>', '<C-w>l', opts)
map('n', '<C-j>', '<C-w>j', opts)
map('n', '<C-k>', '<C-w>k', opts)

-- map jk or kj to escape in insert mode
map('i', 'jk', '<ESC>', opts)
map('i', 'kj', '<ESC>', opts)

-- Make indentation better
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)

-- move between buffers
map('n', '<TAB>', ':bnext<cr>', opts1)
map('n', '<S-TAB>', ':bprevious<cr>', opts1)

-- lsp settings 
map("n", "gl", ":lua vim.diagnostic.open_float()<cr>", opts)
