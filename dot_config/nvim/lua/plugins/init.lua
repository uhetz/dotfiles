return {
    'Makaze/AnsiEsc',
    'nvim-tree/nvim-web-devicons',
    -- {
    --     'projekt0n/github-nvim-theme',
    --     lazy = false,    -- make sure we load this during startup if it is your main colorscheme
    --     priority = 1000, -- make sure to load this before all the other start plugins
    --     config = function()
    --         require('github-theme').setup({
    --             -- ...
    --         })
    --
    --         vim.cmd('colorscheme github_dark')
    --     end,
    -- },

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<F5>', vim.cmd.UndotreeToggle)
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            vim.keymap.set('n', '<leader>gs', vim.cmd.Git)
        end,
    },

    { -- Adds git related signs to the gutter, as well as utilities for managing changes
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
    },

    {                       -- Useful plugin to show you pending keybinds.
        "folke/which-key.nvim",
        event = "VeryLazy", -- Sets the loading event to 'VeryLazy'
        config = function() -- This is the function that runs, AFTER loading
            require("which-key").setup()
        end,
    },

    { "numToStr/Comment.nvim", opts = {} }, -- "gc" to comment visual regions/lines
    "tpope/vim-sleuth",                     -- Detect tabstop and shiftwidth automatically
}
