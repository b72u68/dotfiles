local lsp = require('lsp-zero').preset({})
local lspconfig = require('lspconfig')

lsp.on_attach(function(client, bufnr)
    local opts = { buffer=bufnr, remap=false }
    lsp.default_keymaps({
        buffer = bufnr,
        exclude = { '<F2>', '<F4>' },
    })
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
end)

lspconfig.ocamllsp.setup({})
lspconfig.pyright.setup({})
lspconfig.tsserver.setup({})

lsp.setup()
