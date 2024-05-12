local telescope = require('telescope')
local builtin = require('telescope.builtin')
local previewers = require('telescope.previewers')
local sorters = require('telescope.sorters')

local opts = {noremap = true, silent = true, expr = false}

telescope.load_extension('fzy_native')

telescope.setup {
    defaults = {
        file_sorter = sorters.get_fzy_sorter,
        selection_caret = ' > ',
        prompt_prefix = ' > ',
        file_previewer   = previewers.vim_buffer_cat.new,
        grep_previewer   = previewers.vim_buffer_vimgrep.new,
        qflist_previewer = previewers.vim_buffer_qflist.new,
        layout_strategy = "flex",
        layout_config = {
            horizontal = {
                preview_width = 0.5,
            },
            vertical = {
                preview_height = 0.3,
            }
        }
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

vim.keymap.set("n", "<leader>pf", builtin.find_files, opts)
vim.keymap.set("n", "<leader>pg", builtin.git_files, opts)
vim.keymap.set("n", "<leader>pr", builtin.live_grep, opts)
vim.keymap.set("n", "<leader>ps", builtin.grep_string, opts)
vim.keymap.set("n", "<leader>pb", builtin.buffers, opts)
vim.keymap.set("n", "<leader>ph", builtin.help_tags, opts)
