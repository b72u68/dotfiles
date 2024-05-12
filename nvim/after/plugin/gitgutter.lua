local opts = { noremap = false, silent = true, expr = false }
vim.keymap.set("n", "(", vim.cmd.GitGutterNextHunk, opts)
vim.keymap.set("n", ")", vim.cmd.GitGutterPrevHunk, opts)
