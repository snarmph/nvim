return {
	'nvim-telescope/telescope.nvim', 
	version = false,
	dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        defaults = {
            path_display = { "smart" },
            -- layout_strategy = "cursor",
            -- layout_config = {
            --     width = 0.4,
            --     height = 0.4,
            --     preview_cutoff = 1,
            -- },
            -- previewer = false,
        },
        pickers = {
            buffers = {
                path_display = "short",
                sort_mru = true,
                ignore_current_buffer = true,
                previewer = false,
                layout_config = {
                    width = 80,
                    height = 10,
                    prompt_position = "top",
                },
                prompt_title = false,
                results_title = false,
                preview_title = false,
            },
        },
    },
}
