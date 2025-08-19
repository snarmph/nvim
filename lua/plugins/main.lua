return { 
    -- themes
	{ "ntk148v/habamax.nvim", dependencies={ "rktjmp/lush.nvim" } },
    "rebelot/kanagawa.nvim",
    { "catppuccin/nvim", name = "catppuccin" },
    -- end themes
    "folke/which-key.nvim",
	"Pocco81/auto-save.nvim",
	{
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
	},
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
	-- "tamago324/lir.nvim",
	-- "lewis6991/gitsigns.nvim",
	"mfussenegger/nvim-dap",
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
        "jake-stewart/multicursor.nvim",
        branch = "1.0",
        config = function()
            local mc = require("multicursor-nvim")
            mc.setup()

            local set = vim.keymap.set

            -- Add or skip cursor above/below the main cursor.
            set({"n", "x"}, "<c-k>", function() mc.lineAddCursor(-1) end)
            set({"n", "x"}, "<c-j>", function() mc.lineAddCursor(1) end)
            set({"n", "x"}, "<leader>k", function() mc.lineSkipCursor(-1) end)
            set({"n", "x"}, "<leader>j", function() mc.lineSkipCursor(1) end)

            -- Add or skip adding a new cursor by matching word/selection
            set({"n", "x"}, "<leader>n", function() mc.matchAddCursor(1) end)
            set({"n", "x"}, "<leader>s", function() mc.matchSkipCursor(1) end)
            set({"n", "x"}, "<leader>N", function() mc.matchAddCursor(-1) end)
            set({"n", "x"}, "<leader>S", function() mc.matchSkipCursor(-1) end)

            -- Add and remove cursors with control + left click.
            set("n", "<c-leftmouse>", mc.handleMouse)
            set("n", "<c-leftdrag>", mc.handleMouseDrag)
            set("n", "<c-leftrelease>", mc.handleMouseRelease)

            -- Disable and enable cursors.
            set({"n", "x"}, "<c-q>", mc.toggleCursor)

            -- Mappings defined in a keymap layer only apply when there are
            -- multiple cursors. This lets you have overlapping mappings.
            mc.addKeymapLayer(function(layerSet)

                -- Select a different cursor as the main one.
                layerSet({"n", "x"}, "<left>", mc.prevCursor)
                layerSet({"n", "x"}, "<right>", mc.nextCursor)

                -- Delete the main cursor.
                layerSet({"n", "x"}, "<leader>x", mc.deleteCursor)

                -- Enable and clear cursors using escape.
                layerSet("n", "<esc>", function()
                    if not mc.cursorsEnabled() then
                        mc.enableCursors()
                    else
                        mc.clearCursors()
                    end
                end)
            end)

            -- Customize how cursors look.
            local hl = vim.api.nvim_set_hl
            hl(0, "MultiCursorCursor", { reverse = true })
            hl(0, "MultiCursorVisual", { link = "Visual" })
            hl(0, "MultiCursorSign", { link = "SignColumn"})
            hl(0, "MultiCursorMatchPreview", { link = "Search" })
            hl(0, "MultiCursorDisabledCursor", { reverse = true })
            hl(0, "MultiCursorDisabledVisual", { link = "Visual" })
            hl(0, "MultiCursorDisabledSign", { link = "SignColumn"})
        end
    },
}
