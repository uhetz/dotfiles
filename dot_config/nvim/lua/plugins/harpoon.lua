return {
	"theprimeagen/harpoon",
	config = function()
		local mark = require("harpoon.mark")
		-- vim.keymap.set("n", "<C-h>", function() ui.nav_file(1) end)
		local ui = require("harpoon.ui")

		vim.keymap.set("n", "<leader>a", mark.add_file)
		vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

		vim.keymap.set("n", "<leader>n", function() ui.nav_file(1) end)
		vim.keymap.set("n", "<leader>m", function() ui.nav_file(2) end)
		vim.keymap.set("n", "<leader>,", function() ui.nav_file(3) end)
		vim.keymap.set("n", "<leader>.", function() ui.nav_file(4) end)

	end
}
