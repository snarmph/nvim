return {
    'stevearc/oil.nvim',
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
        delete_to_trash = true,
        watch_for_changes = true,
    },
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    lazy = false,
    keys = {
        { "<leader>do", "<cmd>Oil --float<CR>", desc = "Open floating Oil" },
    },
}

