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

-- ToggleTerm
map("n", "<leader>t", ":ToggleTerm  direction='float'<cr>", { noremap = true, silent = false })
map("n", "<c-t>", ":TermExec  direction='float' cmd='cd %:p:h'<cr>", { noremap = true, silent = false })

-- Telescope Search
map("n", "<C-f>", ":Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = false })
map("i", "<C-f>", "<ESC>:Telescope current_buffer_fuzzy_find<cr>", { noremap = true, silent = false })

-- map("n", "Y", "y$", { noremap = true, silent = false }) -- change Y to copy to end of line like D

-- insert mode
-- Move current line / block with Alt-j/k ala vscode.
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = false })
-- Move current line / block with Alt-j/k ala vscode.
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = false })

map("n", "<A-j>", ":m .+1<CR>", { noremap = true, silent = false })
-- Move current line / block with Alt-j/k ala vscode.
map("n", "<A-k>", ":m .-2<CR>", { noremap = true, silent = false })


-- comment 
map("v", "<leader>/" , ":CommentToggle<cr>", opts )
