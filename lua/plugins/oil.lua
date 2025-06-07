return {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        float = {
            max_width = 80,
            max_height = 20,
            border = "rounded",
        },
        preview_win = {
            update_on_cursor_moved = true,
            preview_method = "fast_scratch",
        },
    },
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    keys = {
        { "<leader>do", "<cmd>Oil --float<CR>", desc = "Open floating Oil" },
    },
}

