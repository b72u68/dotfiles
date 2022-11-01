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

-- Old settings for gruvbox
--[[
   [vim.opt.background = "dark"
   [vim.g.gruvbox_italic = 1
   [vim.g.gruvbox_sign_column = "NONE"
   [vim.g.gruvbox_italicize_comments = 1
   [vim.g.gruvbox_italicize_strings = 1
   [vim.g.gruvbox_invert_selection = 0
   [vim.cmd.colorscheme("gruvbox")
   [
   ]]

require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = false, bold = true },
    functions = { bold = true },
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "transparent", -- style for floating windows
  },
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(highlights, colors)
      highlights.Normal = {
          bg = "NONE",
          ctermbg = "NONE",
      }

      highlights.LineNr = {
          fg = "#5eacd3",
          bg = "NONE",
          ctermbg = "NONE",
      }
  end
})

vim.opt.background = "dark"
vim.cmd.colorscheme("tokyonight")

--[[
   [vim.cmd.highlight("LineNr guifg=#5eacd3 guibg=NONE ctermbg=NONE")
   [vim.cmd.highlight("Normal guibg=NONE ctermbg=NONE")
   [vim.cmd.highlight("netrwDir guifg=#5eacd3")
   [vim.cmd.highlight("qfFileName guifg=#aed75f")
   ]]
