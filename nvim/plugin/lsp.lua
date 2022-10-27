vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
        end,
    },
    mapping = {
        ['<Tab>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert })
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'vsnip' },
    }, {
        { name = 'buffer' },
    })
})

local function config(_config)
    return vim.tbl_deep_extend("force", {
        capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
    }, _config or {})
end

require'lspconfig'.pyright.setup(config())
require'lspconfig'.tsserver.setup(config())
require'lspconfig'.texlab.setup(config())
require'lspconfig'.ocamllsp.setup(config())

vim.g.compe = {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
}

vim.g.compe.source = {
    path = true,
    buffer = true,
    calc = true,
    nvim_lsp = true,
    nvim_lua = true,
    vsnip = true
}

vim.api.nvim_set_keymap("n", "<leader>gd", [[<Cmd>lua vim.lsp.buf.definition()<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>rn", [[<Cmd>lua vim.lsp.buf.rename()<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>K", [[<Cmd>lua vim.lsp.buf.hover()<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>ds", [[<Cmd>lua vim.diagnostic.open_float()<CR>]], {noremap = true, silent = true, expr = false})
