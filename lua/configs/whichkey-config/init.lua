local wk = require("which-key")
local mappings = {
    ["/"] = {":CommentToggle<cr>", "Toggle Comment"},
	e = { ":NvimTreeToggle<cr>", "Open File Explorer" },
	E = { ":e ~/.config/nvim/init.lua<cr>", "Edit Config File" },
	f = {
		name = "Telescope",
		b = { ":Telescope file_browser<cr>", "file browser" },
		f = { ":Telescope find_files<cr>", "Telescope Find Files" },
		g = {
			name = "git",
			c = { ":Telescope git_commits<cr>", "git commits" },
			f = { ":Telescope git_files<cr>", "git files" },
			s = { ":Telescope git_status<cr>", "git status" },
		},
		h = { ":Telescope help_tags<cr>", "helptags" },
		k = { ":Telescope keymaps<cr>", "key maps" },
		l = {
			name = "lsp",
			d = { ":Telescope lsp_document_diagnostics<cr>", "Diagnostics" },
		},
		m = { ":Telescope neoclip<cr>", "neoclip" },
		n = { ":DashboardNewFile<cr>", "New file" },
		o = { ":Telescope oldfiles<cr>", "Recent Files" },
		r = { ":Telescope registers<cr>", "telescope registers" },
		s = {
			name = "search",
			s = { ":Telescope current_buffer_fuzzy_find<cr>", "Fuzzy find current buffer" },
			l = { ":Telescope live_grep<cr>", "Telescope Live Grep" },
		},
		t = { ":Telescope colorscheme<cr>", "colorscheme" },
	},
	q = { ":q<cr>", "Quit" },
	Q = { ":wq<cr>", " Save & Quit" },
	t = { ":ToggleTerm direction=float<cr>", "Toggle Term" },
	w = { ":w<cr>", "Save" },
	x = { ":bdelete<cr>", "Close current buffer" },
}
local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
