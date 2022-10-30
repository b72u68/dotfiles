-- [[__________ COLORS __________]]

-- set syntax coloring theme to default
vim.cmd([[syntax enable]])

if vim.fn.has("termguicolors") then
    vim.opt.termguicolors = true
end

if vim.fn.exists("+termguicolors") then
    vim.g['&t_8f'] = [[\<Esc>[38;2;%lu;%lu;%lum]]
    vim.g['&t_8b'] = [[\<Esc>[48;2;%lu;%lu;%lum]]
end

vim.opt.background = "dark"
vim.g.gruvbox_italic = 1
vim.g.gruvbox_sign_column = "NONE"
vim.g.gruvbox_italicize_comments = 1
vim.g.gruvbox_italicize_strings = 1
vim.g.gruvbox_invert_selection = 0
vim.cmd.colorscheme("gruvbox")

vim.cmd.highlight("LineNr guifg=#5eacd3")
vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")
vim.cmd.highlight("netrwDir guifg=#5eacd3")
vim.cmd.highlight("qfFileName guifg=#aed75f")
