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
	-- conf = {
	-- 	size = function(term)
	-- 		if term.direction == "horizontal" then
	-- 			return 15
	-- 		elseif term.direction == "vertical" then
	-- 			return vim.o.columns * 0.4
	-- 		else
	-- 			return 20
	-- 		end
	-- 	end,
	-- },
	-- keys = {
	-- 	{ "<C-t>", "<C-\\><C-n>:CFloatTerm<CR>", { desc = "Close Terminal" } },
	-- 	{ "<leader>t", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal" } },
	-- },
	config = true,
}
