-- Globals
vim.g.mapleader = " "
vim.g.maplocalleader = "//"

vim.opt.number = true
vim.opt.relativenumber = true
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = ""

vim.opt.breakindent = true
vim.opt.undofile = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.inccommand = "split"

vim.opt.mouse = "a"
vim.opt.showmode = false
vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.scrolloff = 10

-- EOF
vim.opt.endofline = true
vim.opt.endoffile = true
vim.opt.fixendofline = true

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Copilot Keymaps
vim.keymap.set("n", "<leader>C", "<cmd>Copilot<CR>", { desc = "Open [C]opilot" })
vim.keymap.set("i", "<C-f>", 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })
vim.keymap.set("i", "<A-f>", "<Plug>(copilot-accept-line)") -- Accept line
vim.keymap.set("i", "<A-w>", "<Plug>(copilot-accept-word)") -- Accept word
vim.g.copilot_no_tab_map = true

vim.cmd("au BufNewFile,BufRead Jenkinsfile,*.pipeline setf groovy")

-- [[ Intends ]]
-- vim.cmd("set tabstop=4 shiftwidth=4 expandtab")
-- vim.cmd("set ts=4 sw=4 sts=4 et")
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- YAML
-- vim.cmd("autocmd FileType yaml setlocal tabstop=2 shiftwidth=2 expandtab")

-- [[ Basic Autocommands ]]
--  See :help lua-guide-autocommands

vim.api.nvim_set_keymap('i', '<C-H>', '<C-W>', { noremap = true })
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim.cmd('colorscheme catppuccin-latte')

-- require("luasnip.loaders.from_lua").load({paths = "./snippets"})
-- require("luasnip.loaders.from_lua").load({paths = "./snippets"})
