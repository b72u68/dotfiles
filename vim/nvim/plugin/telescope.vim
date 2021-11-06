lua << EOF
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        selection_caret = ' > ',
        prompt_prefix = ' > ',
        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        layout_strategy = "flex"
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
EOF

nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <leader>pg <cmd>Telescope git_files<cr>
nnoremap <leader>pr <cmd>Telescope live_grep<cr>
nnoremap <leader>ps <cmd>Telescope grep_string<cr>
nnoremap <leader>pb <cmd>Telescope buffers<cr>
nnoremap <leader>ph <cmd>Telescope help_tags<cr>
