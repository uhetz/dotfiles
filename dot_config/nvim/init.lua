require("uhetz.vimopt")
require("uhetz.keymap")
require("config.lazy")

local lsp = require('lsp-zero')
local wk = require("which-key")

-- Function to find the git root directory
local function get_git_root()
	local handle = io.popen("git rev-parse --show-toplevel 2> /dev/null")
	local result = handle:read("*a")
	handle:close()

	-- Remove the trailing newline character
	return result:gsub("\n", "")
end

-- Function to get the project name from the git root directory
local function get_project_name()
	local git_root = get_git_root()
	if git_root == "" then
		return nil                         -- Not a git project
	end
	return vim.fn.fnamemodify(git_root, ":t") -- Get the last part of the path (the project folder name)
end

wk.add({
	{
		"<leader>?",
		desc = "Buffer local keymaps",
		function()
			wk.show({ global = true })
		end
	},
	{ "<leader>s",  desc = "[S]earch" },
	{ "<leader>sf", desc = "[S]earch [F]iles" },

	{ "<leader>c",  desc = "[C]ode" },
	{ "<leader>d",  desc = "[D]ocument" },
	{ "<leader>g",  desc = "[G]it" },
	{ "<leader>w",  desc = "[W]orkspace" },

	{ "<leader>a",  desc = "[A]dd to Harpoon" },
	{ "<leader>n",  desc = "Harpoon #1" },
	{ "<leader>m",  desc = "Harpoon #2" },
	{ "<leader>,",  desc = "Harpoon #3" },
	{ "<leader>.",  desc = "Harpoon #4" },

	{ "<leader>f",  desc = "[F]ile Explore" },

	{ "<leader>dh", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
})

lsp.preset("recommended")

lsp.on_attach(function(client, bufnr)
	lsp.default_keymaps({ buffer = bufnr })
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

local servers = {
	clangd = {
		root_dir = function(fname)
			return require("lspconfig.util").root_pattern(
				".clang-tidy"
			-- "Makefile",
			-- "configure.ac",
			-- "configure.in",
			-- "config.h.in",
			-- "meson.build",
			-- "meson_options.txt",
			-- "build.ninja"
			)(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
				fname
			) or require("lspconfig.util").find_git_ancestor(fname)
		end,
		capabilities = {
			offsetEncoding = { "utf-16" },
		},
		cmd = {
			"clangd",
			-- "--background-index",
			"--clang-tidy",
			"--log=verbose",
			"--header-insertion=iwyu",
			-- "--completion-style=detailed",
			-- "--function-arg-placeholders",
			-- "--fallback-style=llvm",
		},
	},
	rust_analyzer = {}
}

require('mason').setup({})

require('mason-lspconfig').setup({
	-- handlers = {
	-- 	function(server_name)
	-- 		require('lspconfig')[server_name].setup({})
	-- 	end,
	-- },
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			require("lspconfig")[server_name].setup({
				cmd = server.cmd,
				settings = server.settings,
				filetypes = server.filetypes,
				-- This handles overriding only values explicitly passed
				-- by the server configuration above. Useful when disabling
				-- certain features of an LSP (for example, turning off formatting for tsserver)
				capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {}),
			})
		end,
	},
})

lsp.set_preferences({
	sign_icons = {}
})

require('glow').setup({
	width = 150,
	width_ratio = 0.9
})
