local lsp = require('lsp-zero').preset({})
local cmp = require('cmp')

require("mason").setup()

lsp.ensure_installed({
    'pyright',
    'tsserver',
    'texlab',
    'lua_ls'
})

cmp.setup({
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<S-Tab>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<CR>'] = cmp.mapping.confirm()
    },
    sources = cmp.config.sources({
        { name = "path" },
        { name = "nvim_lsp" },
        { name = "buffer", keyword_length = 3 },
        { name = "luasnip", keyword_length = 2 },
        { name = "nvim_lua" },
    }),
    window = {
        documentation = cmp.config.window.bordered(),
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
        },
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer=bufnr, remap=false }
    vim.keymap.set("n", "<leader>gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "<leader>K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>ds", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end)

require('lspconfig').ocamllsp.setup({})
require('lspconfig').racket_langserver.setup({})

vim.diagnostic.config({
    underline = false,
    update_in_insert = true,
    severity_sort = true
})

lsp.setup()
