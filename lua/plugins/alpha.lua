return {
    "goolord/alpha-nvim",
    dependencies = { 
        'nvim-tree/nvim-web-devicons',
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local theta = require("alpha.themes.theta")
        theta.config.layout[1].val = math.floor(vim.fn.winheight(0) * 0.2)
        theta.file_icons.provider = "devicons"
        theta.header.opts.hl = "CursorLineNr"
        require("alpha").setup(
            theta.config
        )
    end,
}
