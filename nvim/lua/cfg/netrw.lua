vim.g.netrw_altv = "&spr"
vim.g.netrw_alto = "&sb"
vim.g.netrw_preview = 1
vim.g.netrw_browse_split = 4
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 50
vim.g.netrw_localrmdir = "rm -rf"
vim.g.netrw_liststyle = 0
vim.g.netrw_list_hide = [[__pycache__,\.swp,*\.swp,.DS_Store]]

local opts = { noremap = false, silent = true, expr = false }
vim.keymap.set("n", "<C-n>", "<Cmd>Vex <bar> vertical resize 30<CR>", opts)
vim.keymap.set("n", "<leader>=", "<Cmd>vertical resize +5<CR>", opts)
vim.keymap.set("n", "<leader>-", "<Cmd>vertical resize -5<CR>", opts)
