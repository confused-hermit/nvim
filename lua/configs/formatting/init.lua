require("formatter").setup({
	filetype = {
		python = {
			-- Configuration for psf/black
			function()
				return {
					exe = "black", -- this should be available on your $PATH
					args = { "-" },
					stdin = true,
				}
			end,
		},
		lua = {
			function()
				return {
					exe = "stylua",
					args = {
						--          "--config-path "
						--              .. os.getenv("XDG_CONFIG_HOME")
						--              .. "/stylua/stylua.toml",
						"-",
					},
					stdin = true,
				}
			end,
		},
		rust = {
			-- Rustfmt
			function()
				return {
					exe = "rustfmt",
					args = { "--emit=stdout" },
					stdin = true,
				}
			end,
		},
		sh = {
			-- Shell Script Formatter
			function()
				return {
					exe = "shfmt",
					args = { "-i", 2 },
					stdin = true,
				}
			end,
		},
		tex = {
			-- Shell Script Formatter
			function()
				return {
					exe = "latexindent",
					args = { "-g /dev/null" },
					stdin = true,
				}
			end,
		},

		go = {
			-- Shell Script Formatter
			function()
				return {
					exe = "goimports",
					-- args = { "-w" },
					stdin = true,
				}
			end,
		},
	},
})
vim.cmd("autocmd BufWritePost * FormatWrite")
