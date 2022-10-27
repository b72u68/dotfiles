-- [[__________ KEY MAPPINGS __________]]

-- Map <leader> key to <space>
vim.g.mapleader = " "

-- Turn off search highlight
vim.api.nvim_set_keymap("n", "<leader>nl", [[<Cmd>nohl<CR>]], {noremap = false, silent = true, expr = false})

-- Split pane navigation
vim.api.nvim_set_keymap("n", "<leader>h", [[<C-w>h]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>j", [[<C-w>j]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>k", [[<C-w>k]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>l", [[<C-w>l]], {noremap = false, silent = true, expr = false})

-- Quit
vim.api.nvim_set_keymap("n", "<leader>q", [[<Cmd>q<CR>]], {noremap = false, silent = true, expr = false})

-- Save
vim.api.nvim_set_keymap("n", "<leader>w", [[<Cmd>w!<CR>]], {noremap = false, silent = true, expr = false})

-- netrw
vim.api.nvim_set_keymap("n", "<C-n>", [[:Vex <bar> :vertical resize 30<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>=", [[<Cmd>vertical resize +5<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>-", [[<Cmd>vertical resize -5<CR>]], {noremap = true, silent = true, expr = false})

-- Terminal
vim.api.nvim_set_keymap("n", "<leader>tu", [[:rightb vsplit <bar> :terminal<CR>]], {noremap = true, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>th", [[:bel split <bar> :resize 10 <bar> :terminal<CR>]], {noremap = true, silent = true, expr = false})

-- Focus on current pane
vim.api.nvim_set_keymap("n", "<leader>m", [[<Cmd>MaximizerToggle!<CR>]], {noremap = true, silent = true, expr = false})

-- Undotree
vim.api.nvim_set_keymap("n", "<leader>u", [[<Cmd>UndotreeShow<CR>]], {noremap = true, silent = true, expr = false})

-- Force reload lsp
vim.api.nvim_set_keymap("n", "<leader>rl", [[:lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR> <bar> :edit<CR>]], {noremap = true, silent = true, expr = false})

-- Move cursor in matching parentheses
vim.api.nvim_set_keymap("i", [[""]], [[""<esc>i]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("i", "''", [[''<esc>i]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("i", "()", [[()<esc>i]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("i", "[]", "[]<esc>i", {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("i", "{}", [[{}<esc>i]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("i", "<>", [[<><esc>i]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("i", "$$", [[$$<esc>i]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("i", "``", [[``<esc>i]], {noremap = false, silent = true, expr = false})

-- Fugitive
vim.api.nvim_set_keymap("n", "<leader>gs", [[<Cmd>G<CR>]], {noremap = false, silent = true, expr = false})

-- Gitgutter
vim.api.nvim_set_keymap("n", "(", [[<Cmd>GitGutterNextHunk<CR>]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("n", ")", [[<Cmd>GitGutterPrevHunk<CR>]], {noremap = false, silent = true, expr = false})

-- Webviewer
vim.api.nvim_set_keymap("n", "<leader>pv", [[<Cmd>CocCommand markdown-preview-enhanced.openPreview<CR>]], {noremap = false, silent = true, expr = false})

-- NERDCommenter
vim.api.nvim_set_keymap("x", "<leader>cs", [[<Cmd>call nerdcommenter#Comment("x", "Sexy")<CR>]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>cs", [[<Cmd>call nerdcommenter#Comment("n", "Sexy")<CR>]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("x", "<leader>cu", [[<Cmd>call nerdcommenter#Comment("x", "UnComment")<CR>]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>cu", [[<Cmd>call nerdcommenter#Comment("n", "UnComment")<CR>]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("x", "<leader>co", [[<Cmd>call nerdcommenter#Comment("x", "Toggle")<CR>]], {noremap = false, silent = true, expr = false})
vim.api.nvim_set_keymap("n", "<leader>co", [[<Cmd>call nerdcommenter#Comment("n", "Toggle")<CR>]], {noremap = false, silent = true, expr = false})
