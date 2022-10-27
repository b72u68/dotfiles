-- [[__________ FILES/PLUGINS CONFIG __________]]

-- Open .tex file as LaTeX instead of Plaintex
vim.g.tex_flavor = "latex"

-- Settings for Python
vim.opt.pyxversion = 3
vim.g.python3_host_prog = "/usr/bin/python3"
vim.g.pymode_python = "python3"
vim.g.python_highlight_all = 1
vim.g.python_highlight_indent_errors = 0
vim.g.python_highlight_space_errors = 0

-- Settings for vim-gitgutter
vim.g.gitgutter_sign_added = "+"
vim.g.gitgutter_sign_modified = "~"
vim.g.gitgutter_sign_removed = "-"
vim.g.gitgutter_enabled = 1
vim.g.gitgutter_map_keys = 0

-- Settings for searching ag.vim
if vim.fn.executable("rg") then
    vim.g.rg_derive_root = true
end
