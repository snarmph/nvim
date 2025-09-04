return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    branch = 'main',
    build = ':TSUpdate',
    opts = {
        ensure_installed = { "lua", "vim", "json" },
        highlight = { enable = true },
        indent = { enable = true },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
}
