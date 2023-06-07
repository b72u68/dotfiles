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

vim.keymap.set("n", "<leader>pf", function() builtin.find_files() end, opts)
vim.keymap.set("n", "<leader>pg", function() builtin.git_files() end, opts)
vim.keymap.set("n", "<leader>pr", function() builtin.live_grep() end, opts)
vim.keymap.set("n", "<leader>ps", function() builtin.grep_string() end, opts)
vim.keymap.set("n", "<leader>pb", function() builtin.buffers() end, opts)
vim.keymap.set("n", "<leader>ph", function() builtin.help_tags() end, opts)
