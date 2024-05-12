-- [[__________ KEY MAPPINGS __________]]

local keymap_config = { noremap = false, silent = true, expr = false }

-- Map <leader> key to <space>
vim.g.mapleader = " "

-- Turn off search highlight
vim.api.nvim_set_keymap("n", "<leader>nl", [[<Cmd>nohl<CR>]], keymap_config)

-- Split pane navigation
vim.api.nvim_set_keymap("n", "<leader>h", [[<C-w>h]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>j", [[<C-w>j]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>k", [[<C-w>k]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>l", [[<C-w>l]], keymap_config)

-- Quit
vim.api.nvim_set_keymap("n", "<leader>q", [[:x<CR>]], keymap_config)

-- Save
vim.api.nvim_set_keymap("n", "<leader>w", [[:w!<CR>]], keymap_config)

-- netrw
vim.api.nvim_set_keymap("n", "<C-n>", [[:Vex <bar> :vertical resize 30<CR>]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>=", [[:vertical resize +5<CR>]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>-", [[:vertical resize -5<CR>]], keymap_config)

-- Terminal
vim.api.nvim_set_keymap("n", "<leader>tu", [[:rightb vsplit <bar> :terminal<CR>]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>th", [[:bel split <bar> :resize 10 <bar> :terminal<CR>]], keymap_config)

-- Focus on current pane
vim.api.nvim_set_keymap("n", "<leader>m", [[:MaximizerToggle!<CR>]], keymap_config)

-- Undotree
vim.api.nvim_set_keymap("n", "<leader>u", [[:UndotreeShow<CR>]], keymap_config)

-- Force reload lsp
vim.api.nvim_set_keymap("n", "<leader>rl", [[:lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR> <bar> :edit<CR>]],
    keymap_config)

-- Format
vim.api.nvim_set_keymap("n", "<leader>f", [[:lua vim.lsp.buf.format()<CR>]], keymap_config)

-- Move cursor in matching parentheses
vim.api.nvim_set_keymap("i", [[""]], [[""<esc>i]], keymap_config)
vim.api.nvim_set_keymap("i", "''", [[''<esc>i]], keymap_config)
vim.api.nvim_set_keymap("i", "()", [[()<esc>i]], keymap_config)
vim.api.nvim_set_keymap("i", "[]", "[]<esc>i", keymap_config)
vim.api.nvim_set_keymap("i", "{}", [[{}<esc>i]], keymap_config)
vim.api.nvim_set_keymap("i", "<>", [[<><esc>i]], keymap_config)
vim.api.nvim_set_keymap("i", "$$", [[$$<esc>i]], keymap_config)
vim.api.nvim_set_keymap("i", "``", [[``<esc>i]], keymap_config)

-- Fugitive
vim.api.nvim_set_keymap("n", "<leader>gs", [[:G<CR>]], keymap_config)

-- Gitgutter
vim.api.nvim_set_keymap("n", "(", [[:GitGutterNextHunk<CR>]], keymap_config)
vim.api.nvim_set_keymap("n", ")", [[:GitGutterPrevHunk<CR>]], keymap_config)

-- Webviewer
vim.api.nvim_set_keymap("n", "<leader>pv", [[:CocCommand markdown-preview-enhanced.openPreview<CR>]], keymap_config)

-- NERDCommenter
vim.api.nvim_set_keymap("x", "<leader>cs", [[<Plug>NERDCommenterSexy]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>cs", [[<Plug>NERDCommenterSexy]], keymap_config)
vim.api.nvim_set_keymap("x", "<leader>cu", [[<Plug>NERDCommenterUncomment]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>cu", [[<Plug>NERDCommenterUncomment]], keymap_config)
vim.api.nvim_set_keymap("x", "<leader>co", [[<Plug>NERDCommenterToggle]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>co", [[<Plug>NERDCommenterToggle]], keymap_config)
vim.api.nvim_set_keymap("x", "<leader>cc", [[<Plug>NERDCommenterComment]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>cc", [[<Plug>NERDCommenterComment]], keymap_config)
vim.api.nvim_set_keymap("x", "<leader>cn", [[<Plug>NERDCommenterNested]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>cn", [[<Plug>NERDCommenterNested]], keymap_config)

-- vim-chtsh
vim.api.nvim_set_keymap("n", "<leader>ch", [[:CheatSheet<CR>]], keymap_config)
vim.api.nvim_set_keymap("n", "<leader>cl", [[:CheatList<CR>]], keymap_config)
