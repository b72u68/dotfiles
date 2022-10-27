require'nvim-treesitter.configs'.setup({
    highlight={ enable=true },
    incremental_selection={ enable=true },
    textobjects={ enable=true }
})

local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.iitran = {
    install_info = {
        url = "github.com/b72u68/tree-sitter-iitran",
        files = { "src/parser.c" },
    },
    filetype = "iitran",
}
