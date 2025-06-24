return { 
	{ "ntk148v/habamax.nvim", dependencies={ "rktjmp/lush.nvim" } },
    "folke/which-key.nvim",
	"Pocco81/auto-save.nvim",
	{
		"nat-418/boole.nvim",
		opts = {
			mappings = {
				increment = "<C-a>",
				decrement = "<C-x>",
			},
			additions = {
				{ "[ ]", "[X]" },
			},
		},
	},
    	{
    		"cbochs/grapple.nvim",
    		dependencies = {
        		{ "nvim-tree/nvim-web-devicons", lazy = true }
    		},
		opts = {
			scope = "git",
		},
		event = { "BufReadPost", "BufNewFile", },
		cmd = "Grapple",
		keys = {
			{ "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
			{ "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
			{ "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
			{ "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
		},
	},
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
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			sync_root_with_cwd = true,
			respect_buf_cwd = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
		},
		keys = {
			{ "<leader>op", "<cmd>NvimTreeToggle<cr>", desc = "Toggle Tree" },
			{ "<leader>of", "<cmd>NvimTreeFocus<cr>", desc = "Focus Tree" },
		},
	},
	"tamago324/lir.nvim",
	"lewis6991/gitsigns.nvim",
	-- "ahmedkhalf/project.nvim",
	-- {
	--    		'nvim-lualine/lualine.nvim',
	--    		dependencies = { 'nvim-tree/nvim-web-devicons' }
	-- },
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
        "zadirion/Unreal.nvim",
        dependencies = { "tpope/vim-dispatch" }
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
    }
}
