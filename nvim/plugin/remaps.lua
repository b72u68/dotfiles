-- [[__________ KEY MAPPINGS __________]]

local opts = {noremap = false, silent = true, expr = false}

-- Map <leader> key to <space>
vim.g.mapleader = " "

-- Turn off search highlight
vim.keymap.set("n", "<leader>nl", vim.cmd.nohl, opts)

-- Split pane navigation
vim.keymap.set("n", "<leader>h", [[<C-w>h]], opts)
vim.keymap.set("n", "<leader>j", [[<C-w>j]], opts)
vim.keymap.set("n", "<leader>k", [[<C-w>k]], opts)
vim.keymap.set("n", "<leader>l", [[<C-w>l]], opts)

-- Quit
vim.keymap.set("n", "<leader>q", [[<Cmd>q!<CR>]], opts)

-- Wipeout buffer
vim.keymap.set("n", "<leader>bd", [[<Cmd>bd!<CR>]], opts)

-- Save
vim.keymap.set("n", "<leader>w", [[<Cmd>w!<CR>]], opts)

-- netrw
vim.keymap.set("n", "<C-n>", [[:Vex <bar> :vertical resize 30<CR>]], opts)
vim.keymap.set("n", "<leader>=", [[<Cmd>vertical resize +5<CR>]], opts)
vim.keymap.set("n", "<leader>-", [[<Cmd>vertical resize -5<CR>]], opts)

-- Terminal
vim.keymap.set("n", "<leader>tu", [[:rightb vsplit <bar> :terminal<CR>]], opts)
vim.keymap.set("n", "<leader>th", [[:bel split <bar> :resize 10 <bar> :terminal<CR>]], opts)

-- Focus on current pane
vim.keymap.set("n", "<leader>m", [[<Cmd>MaximizerToggle!<CR>]], opts)

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeShow, opts)

-- Move cursor in matching parentheses
vim.keymap.set("i", [[""]], [[""<esc>i]], opts)
vim.keymap.set("i", "''", [[''<esc>i]], opts)
vim.keymap.set("i", "()", [[()<esc>i]], opts)
vim.keymap.set("i", "[]", "[]<esc>i", opts)
vim.keymap.set("i", "{}", [[{}<esc>i]], opts)
vim.keymap.set("i", "<>", [[<><esc>i]], opts)
vim.keymap.set("i", "$$", [[$$<esc>i]], opts)
vim.keymap.set("i", "``", [[``<esc>i]], opts)

-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.G, opts)

-- Gitgutter
vim.keymap.set("n", "(", vim.cmd.GitGutterNextHunk, opts)
vim.keymap.set("n", ")", vim.cmd.GitGutterPrevHunk, opts)

-- Webviewer
vim.keymap.set("n", "<leader>pv", [[<Cmd>CocCommand markdown-preview-enhanced.openPreview<CR>]], opts)

-- NERDCommenter
vim.keymap.set("x", "<leader>cs", [[<Plug>NERDCommenterSexy]], opts)
vim.keymap.set("n", "<leader>cs", [[<Plug>NERDCommenterSexy]], opts)
vim.keymap.set("x", "<leader>cu", [[<Plug>NERDCommenterUncomment]], opts)
vim.keymap.set("n", "<leader>cu", [[<Plug>NERDCommenterUncomment]], opts)
vim.keymap.set("x", "<leader>co", [[<Plug>NERDCommenterToggle]], opts)
vim.keymap.set("n", "<leader>co", [[<Plug>NERDCommenterToggle]], opts)
vim.keymap.set("x", "<leader>cc", [[<Plug>NERDCommenterComment]], opts)
vim.keymap.set("n", "<leader>cc", [[<Plug>NERDCommenterComment]], opts)
vim.keymap.set("x", "<leader>cn", [[<Plug>NERDCommenterNested]], opts)
vim.keymap.set("n", "<leader>cn", [[<Plug>NERDCommenterNested]], opts)

-- vim-chtsh
vim.keymap.set("n", "<leader>ch", vim.cmd.CheatSheet, opts)
