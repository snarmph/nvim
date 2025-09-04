return { 
	"akinsho/toggleterm.nvim",
	version = "*",
	opts = {
		direction = "float",
		open_mapping = [[<c-\>]],
		float_opts = {
			border = "curved",
			width = 80,
			height = 20,
		},
        hide_numbers = true,
	},
	config = true,
}
