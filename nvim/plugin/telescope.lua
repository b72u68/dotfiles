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

vim.api.nvim_set_keymap("n", "<leader>pf", [[<Cmd>Telescope find_files<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>pg", [[<Cmd>Telescope git_files<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>pr", [[<Cmd>Telescope live_grep<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>ps", [[<Cmd>Telescope grep_string<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>pb", [[<Cmd>Telescope buffers<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>ph", [[<Cmd>Telescope help_tags<CR>]], {noremap = true, silent = true, expr = false})
