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

require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
  transparent = true, -- Enable this to disable setting the background color
  terminal_colors = false, -- Configure the colors used when opening a `:terminal` in Neovim
  styles = {
    -- Style to be applied to different syntax groups
    -- Value is any valid attr-list value for `:help nvim_set_hl`
    comments = { italic = true },
    keywords = { italic = false, bold = true },
    functions = { bold = true },
    variables = {},
    -- Background styles. Can be "dark", "transparent" or "normal"
    sidebars = "dark", -- style for sidebars, see below
    floats = "dark", -- style for floating windows
  },
  dim_inactive = false, -- dims inactive windows
  lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
  sidebars = { "qf", "help", "terminal" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`

  --- You can override specific color groups to use other groups or a hex color
  --- function will be called with a ColorScheme table
  ---@param colors ColorScheme
  on_colors = function(colors) end,

  --- You can override specific highlights to use other groups or a hex color
  --- function will be called with a Highlights and ColorScheme table
  ---@param highlights Highlights
  ---@param colors ColorScheme
  on_highlights = function(hl, c)
      local prompt = "#2d3149"

      hl.Normal = {
          bg = "NONE",
          ctermbg = "NONE",
      }

      hl.LineNr = {
          fg = "#5eacd3",
          bg = "NONE",
          ctermbg = "NONE",
      }

      hl.TelescopeNormal = {
          bg = c.bg_dark,
          fg = c.fg_dark,
      }

      hl.TelescopeBorder = {
          bg = c.bg_dark,
          fg = c.bg_dark,
      }

      hl.TelescopePromptNormal = {
          bg = prompt,
      }

      hl.TelescopePromptBorder = {
          bg = prompt,
          fg = prompt,
      }

      hl.TelescopePromptTitle = {
          bg = prompt,
          fg = prompt,
      }

      hl.TelescopePreviewTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
      }

      hl.TelescopeResultsTitle = {
          bg = c.bg_dark,
          fg = c.bg_dark,
      }
  end,
})

require("gruvbox").setup({
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
      comments = true,
      strings = true
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = true,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {
      LineNr = { fg="#5eacd3", bg="NONE", ctermbg="NONE" },
      SignColumn = { bg="NONE", fg="NONE", ctermbg="NONE" },
      Normal = { bg="NONE", ctermbg="NONE" },
      netrwDir = { fg="#5eacd3" },
      qfFileName = { fg="#aed75f" }
  },
  dim_inactive = false,
  transparent_mode = false,
})

vim.opt.background = "dark"
vim.cmd.colorscheme("tokyonight")
