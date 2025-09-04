return { 
        "rebelot/kanagawa.nvim",
        opts = {
            colors = {
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            overrides = function (colors)
                local theme = colors.theme
                return {
                    NormalFloat = { bg = "none" },
                    FloatBorder = { bg = "none" },
                    FloatTitle  = { bg = "none" },
                }
            end
        },
    }
