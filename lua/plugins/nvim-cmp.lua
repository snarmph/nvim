-- local cmp = require("cmp")
-- local lspkind = require("lspkind")

return {
    "hrsh7th/nvim-cmp",
    version = false, -- last release is way too old
    event = "InsertEnter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "onsails/lspkind.nvim",
    },
    opts = function()
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()
        local auto_select = true
        return {
            auto_brackets = {},
            completion = {
                completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
            },
            preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.none,
            mapping = cmp.mapping.preset.insert({
                ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                ["<C-CR>"] = function(fallback)
                    cmp.abort()
                    fallback()
                end,
                ["<tab>"] = function(fallback)
                    local luasnip = require("luasnip")
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    else
                        fallback()
                    end
                end,
            }),
            sources = cmp.config.sources(
                {
                    { name = "lazydev" },
                    { name = "nvim_lsp" },
                    { name = "path" },
                },
                {
                    { name = "buffer" },
                    { name = "cmdline" },
                }
            ),
            sorting = defaults.sorting,
        }
    end
    -- opts = {
    --     completion = {
    --         winhighlight = "Normal:Pmenu,FloatBordeer:Pmenu,Search:None",
    --         col_offset = -3,
    --         side_padding = 0,
    --         completeopt = "menu,menuone,noinsert,noselect",
    --     },
    --     formatting = {
    --         fields = { "kind", "abbr", "menu" },
    --         format = function(entry, vim_item)
    --             local lspkind = require("lspkind")
    --             local kind = lspkind.cmp_format({
    --                 mode = "symbol_text",
    --                 max_width = 50,
    --             })(entry, vim_item)
    --             local strings = vim.split(kind.kind, "%s", { trimempty = true })
    --             kind.kind = " " .. (strings[1] or "") .. " "
    --             kind.menu = "    (" .. (strings[2] or "") .. ")"
    --
    --             return vim_item
    --             -- return kind
    --         end
    --     },
    -- },
}
      
  -- opts = function()
  --   vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  --   local cmp = require("cmp")
  --   local defaults = require("cmp.config.default")()
  --   local auto_select = true
  --   return {
  --     auto_brackets = {}, -- configure any filetype to auto add brackets
  --     completion = {
  --       completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
  --       max_height = 10,
  --       max_width = 80,
  --     },
  --     preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
  --     mapping = cmp.mapping.preset.insert({
  --       ["<C-b>"] = cmp.mapping.scroll_docs(-4),
  --       ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --       ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  --       ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  --       ["<C-Space>"] = cmp.mapping.complete(),
  --       ["<CR>"] = cmp.mapping.confirm({ select = auto_select }),
  --       ["<C-y>"] = cmp.mapping.confirm({ select = true }),
  --       ["<S-CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  --       ["<C-CR>"] = function(fallback)
  --         cmp.abort()
  --         fallback()
  --       end,
  --       ["<tab>"] = function(fallback)
  --         local luasnip = require("luasnip")
  --         if cmp.visible() then
  --           cmp.select_next_item()
  --         elseif luasnip.expand_or_jumpable() then
  --           luasnip.expand_or_jump()
  --         else
  --           fallback()
  --         end
  --       end,
  --     }),
  --     sources = cmp.config.sources({
  --       { name = "lazydev" },
  --       { name = "nvim_lsp", },
  --       { name = "path" },
  --     }, {
  --       { name = "buffer" },
  --     }),
  --     sorting = defaults.sorting,
  --     formatting = {
  --           format = function(entry, vim_item) 
  --               local label = vim_item.abbr
  --               local truncated_label = vim.fn.strcharpart(label, 0, 20)
  --               if truncated_label ~= label then
  --                   vim_item.abbr = truncated_label .. "..."
  --               elseif string.len(label) < 20 then
  --                   local padding = string.rep(" ", 20 - string.len(label))
  --                   vim_item.abbr = label .. padding
  --               end
  --               return vim_item
  --           end,
  --     }
  --   }
  -- end,
  -- main = "lazyvim.util.cmp",
-- }				
