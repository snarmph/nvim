return {
   	"goolord/alpha-nvim",
    	-- dependencies = { 'echasnovski/mini.icons' },
    	dependencies = { 
		'nvim-tree/nvim-web-devicons',
		"nvim-lua/plenary.nvim",
	},
    	config = function()
		local theta = require("alpha.themes.theta")
		theta.config.layout[1].val = math.floor(vim.fn.winheight(0) * 0.2)
		theta.file_icons.provider = "devicons"
-- 		local dashboard = require("alpha.themes.dashboard")
-- 		dashboard.config.layout[1].val = math.floor(vim.fn.winheight(0) * 0.2)
-- 		dashboard.file_icons.provider = "devicons"
-- 		vim.print(dashboard.config)
      		require("alpha").setup(
			theta.config
			-- dashboard.config
 		)
	end,
}
	
