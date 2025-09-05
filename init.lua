require("config.lazy")

vim.opt.number = true
vim.opt.wrap   = false

vim.api.nvim_create_autocmd(
	{ "InsertEnter", "FocusLost", "BufLeave" },
    { 
        callback = function()
            vim.opt.relativenumber = false
        end, 
    }
)

vim.api.nvim_create_autocmd(
	{ "InsertLeave", "FocusGained", "BufEnter" },
	{ 
        callback = function()
            vim.opt.relativenumber = true 
        end, 
    }
)

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.pumheight = 10
vim.opt.pumwidth = 80
vim.opt.cursorline = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.o.updatetime = 100

vim.keymap.set("n", "<Esc><Esc>", ":noh<CR>", { silent = true })
vim.keymap.set("v", "ga", ":EasyAlign<CR>")

-- COLORSCHEME
-- vim.cmd.colorscheme "habamax.nvim"
-- vim.cmd.colorscheme "catppuccin-mocha"
vim.cmd.colorscheme "kanagawa-wave"
vim.cmd.colorscheme "molokai"
-- vim.g.molokai_original = 1


-- TELESCOPE 
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep,  { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers,    { desc = "Telescope buffers" })
vim.api.nvim_set_hl(0, "TelescopeSelection",          { bg = "#2a2a2a", fg ="#ffffff" } )

vim.opt.termguicolors = true

-- LSP config
require("lspconfig").clangd.setup({
	cmd = { "clangd", "--background-index", "--compile-commands-dir=.", "--header-insertion=never" },
	root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git"),
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

vim.lsp.enable('gopls')

vim.diagnostic.config({
	virtual_text = false,
	float = {
		border = "rounded",
		focusable = false,
		source = "always",
		scope = "line",
	},
})

vim.api.nvim_create_autocmd("CursorHold", {
  callback = function()
    vim.diagnostic.open_float(nil, {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = "rounded",
      source = "always",
      scope = "line",
    })
  end,
})

vim.keymap.set("n", "<leader>ca", function() 
    vim.lsp.buf.code_action()
end, { desc = "Lsp code action" })

function open_remote(url)
    local ext = "." .. vim.fn.fnamemodify(url, ":e")
    local fname = vim.fn.tempname() .. ext;
    local cmd = string.format("curl -s -o \"%s\" \"%s\"", fname, url)
    vim.fn.system(cmd)
    vim.cmd("Oil " .. fname)
end

-- OPEN REMOTE FILE
vim.api.nvim_create_user_command(
    "Ropen",
    function (opts) open_remote(opts.args) end,
    { nargs = 1, desc = "Open remote URL" }
)

