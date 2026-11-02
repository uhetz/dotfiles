return
{
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "tadmccorkle/markdown.nvim" },
		build = ":TSUpdate",
		config = function()
			-- [[ Configure Treesitter ]] See `:help nvim-treesitter`
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"lua",
					"markdown",
					"markdown_inline",
					"python",
					"ron",
					"rust",
					"vim",
					"vimdoc"
				},
				sync_install = false,
				auto_install = true,

				markdown = {
					enable = true
				},
				-- Autoinstall languages that are not installed
				highlight = { enable = true },
				indent = { enable = false },
			})

			-- There are additional nvim-treesitter modules that you can use to interact
			-- with nvim-treesitter. You should go explore a few and see what interests you:
			--
			--    - Incremental selection: Included, see :help nvim-treesitter-incremental-selection-mod
			--    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
			--    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
		end,
	},
	{ "nvim-treesitter/playground" }
}
