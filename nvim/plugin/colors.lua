-- [[__________ COLORS __________]]

-- set syntax coloring theme to default
vim.cmd([[syntax enable]])

if vim.fn.has("termguicolors") then
    vim.opt.termguicolors = true
end

if vim.fn.exists("+termguicolors") then
    vim['&t_8f'] = [[\<Esc>[38;2;%lu;%lu;%lum]]
    vim['&t_8b'] = [[\<Esc>[48;2;%lu;%lu;%lum]]
end

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = true,
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})

vim.opt.background = "dark"
vim.cmd("colorscheme gruvbox")

vim.cmd("highlight LineNr guifg=#5eacd3")
vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
vim.cmd("highlight netrwDir guifg=#5eacd3")
vim.cmd("highlight qfFileName guifg=#aed75f")
