-- [[__________ BASICS SETTINGS __________]]

-- Enable filetype plugin
vim.cmd("filetype plugin on")
vim.cmd("filetype indent on")

-- Copy paste from clipboard
vim.opt.clipboard:append("unnamedplus")

-- Spaces and Tabs
vim.opt.autoindent = true               -- set auto indent
vim.opt.smartindent = true              -- set smart indent
vim.opt.tabstop = 4                     -- set number of spaces per TAB
vim.opt.softtabstop = 4                 -- set number of spaces per TAB while editing
vim.opt.shiftwidth = 4                  -- set space width for auto indent
vim.opt.expandtab = true                -- set TABs to spaces (TAB is four spaces)
vim.opt.backspace = "indent,eol,start"  -- allow backspacing over everything in insert mode

-- UI Configurations
vim.opt.compatible = false
vim.opt.encoding = "utf-8"
vim.opt.colorcolumn = "80"              -- enable color column
vim.opt.number = true                   -- set line number
vim.opt.relativenumber = true           -- set relative line number
vim.opt.wildmenu = true                 -- visual autocomplete for command menu
vim.opt.wildmode = "longest:full,full"
vim.opt.lazyredraw = true               -- redraw screen when needed
vim.opt.showmatch = true                -- highlight matching [({})]
vim.opt.splitbelow = true
vim.opt.wrap = false
vim.opt.errorbells = false              -- turn off error bells
vim.opt.cursorline = true               -- turn on cursorline
vim.opt.mouse = "a"                     -- enable mouse

-- Searching
vim.opt.incsearch = true                -- set incremental search (search as characters are entered)
vim.opt.hlsearch = true                 -- hilight matches
vim.opt.ignorecase = true               -- insensitive case searching
vim.opt.smartcase = true                -- insensitive case searching

-- File writing and update
vim.opt.completeopt = "menuone,noinsert,noselect"
vim.opt.swapfile = false
vim.opt.hidden = true
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 50
vim.opt.shortmess:append("c")
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.rtp:append(os.getenv("HOME") .. "/.opam/default/share/ocp-indent/vim")
