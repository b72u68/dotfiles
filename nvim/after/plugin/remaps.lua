-- [[__________ KEY MAPPINGS __________]]

local opts = { noremap = false, silent = true, expr = false }

-- Map <leader> key to <space>
vim.g.mapleader = " "

-- Turn off search highlight
vim.keymap.set("n", "<leader>nl", vim.cmd.nohl, opts)

-- Split pane navigation
vim.keymap.set("n", "<leader>h", "<C-w>h", opts)
vim.keymap.set("n", "<leader>j", "<C-w>j", opts)
vim.keymap.set("n", "<leader>k", "<C-w>k", opts)
vim.keymap.set("n", "<leader>l", "<C-w>l", opts)

-- Quit
vim.keymap.set("n", "<leader>q", vim.cmd.x, opts)

-- Save
vim.keymap.set("n", "<leader>w", vim.cmd.w, opts)

-- Terminal
vim.keymap.set("n", "<leader>tu", "<Cmd>rightb vsplit <bar> terminal<CR>", opts)
vim.keymap.set("n", "<leader>th", "<Cmd>bel split <bar> resize 10 <bar> terminal<CR>", opts)

-- Move cursor in matching parentheses
vim.keymap.set("i", '""', '""<esc>i', opts)
vim.keymap.set("i", "''", "''<esc>i", opts)
vim.keymap.set("i", "()", "()<esc>i", opts)
vim.keymap.set("i", "[]", "[]<esc>i", opts)
vim.keymap.set("i", "{}", "{}<esc>i", opts)
vim.keymap.set("i", "<>", "<><esc>i", opts)
vim.keymap.set("i", "$$", "$$<esc>i", opts)
vim.keymap.set("i", "``", "``<esc>i", opts)
