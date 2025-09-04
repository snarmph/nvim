return { 
    -- themes
	{ "ntk148v/habamax.nvim", dependencies={ "rktjmp/lush.nvim" } },
    { "catppuccin/nvim", name = "catppuccin", },
    -- end themes
    "folke/which-key.nvim",
	"Pocco81/auto-save.nvim",
	"neovim/nvim-lspconfig",
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
	},
	{ 
		"mason-org/mason.nvim", 
		opts={
			
    			ui = {
        			icons = {
            				package_installed = "✓",
            				package_pending = "➜",
            				package_uninstalled = "✗"
        			}
    			}
		}
	},
	"RRethy/vim-illuminate",
	"stevearc/conform.nvim",
	"norcalli/nvim-colorizer.lua",
    { 
        "gelguy/wilder.nvim", 
        opts = function() 
            local wilder = require("wilder")
            wilder.set_option("renderer", wilder.popupmenu_renderer({
                pumblend = 20,
            }))
            return { 
                modes = { ':', '/', '?' } 
            }
        end
    },
    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("themery").setup({
                themes = vim.fn.getcompletion("", "color"),
                livePreview = true,
            })
        end
    },  
    { "junegunn/vim-easy-align" },
}
