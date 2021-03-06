-- Setup lspconfig.
local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig.configs").ls_emmet = {
	default_config = {
		cmd = { "ls_emmet", "--stdio" },
		filetypes = { "html", "css", "scss", "jsx", "javascriptreact", "js" }, -- Add the languages you use, see language support
		root_dir = function(_)
			return vim.loop.cwd()
		end,
		settings = {},
	},
}

local system_name
if vim.fn.has("mac") == 1 then
	system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
	system_name = "Linux"
elseif vim.fn.has("win32") == 1 then
	system_name = "Windows"
else
	print("Unsupported system for sumneko")
end

local USER = vim.fn.expand("$USER")
local sumneko_root_path = "/home/" .. USER .. "/.config/nvim/ls/lua-language-server"
local sumneko_binary = "/home/"
	.. USER
	.. "/.config/nvim/ls/lua-language-server/bin/"
	.. system_name
	.. "/lua-language-server"
-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
--local sumneko_root_path = '.config/something/ls/lua-language-server'
--local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local langservers = {
	"html",
	"cssls",
	"ls_emmet",
	"tsserver",
	"pyright",
	"sumneko_lua",
	"rust_analyzer",
	"gopls",
	"texlab",
}

for _, server in ipairs(langservers) do
	if server == "sumneko_lua" then
		require("lspconfig")[server].setup({
			cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
			settings = {
				Lua = {
					runtime = {
						-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
						version = "LuaJIT",
						-- Setup your lua path
						path = runtime_path,
					},
					diagnostics = {
						-- Get the language server to recognize the `vim` global
						globals = { "vim" },
					},
					workspace = {
						-- Make the server aware of Neovim runtime files
						library = vim.api.nvim_get_runtime_file("", true),
						checkThirdParty = false,
						preloadFileSize = 5000,
					},
					-- Do not send telemetry data containing a randomized but unique identifier
					telemetry = { enable = false },
				},
			},
			handlers = {
				["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					-- Disable virtual_text
					virtual_text = false,
				}),
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "single",
				}),
			},
		})
	else
		require("lspconfig")[server].setup({
			capabilities = capabilities,
			handlers = {
				["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
					-- Disable virtual_text
					virtual_text = false,
				}),
				["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					border = "single",
				}),
			},
		})
	end
end
