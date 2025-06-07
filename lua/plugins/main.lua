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
		"m4xshen/hardtime.nvim",
		lazy = false,
		dependencies = { "MunifTanjim/nui.nvim" },
		opts = {
			disabled_keys = {
				["<Up>"] = false,
				["<Left>"] = false,
				["<Right>"] = false,
				["<Down>"] = false,
			},
		},
	},
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
}
