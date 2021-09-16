" __________ PLUGINS __________
call plug#begin('~/.vim/plugged')

" autocompletion and lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" programming language highlighting
Plug 'ap/vim-css-color'

" version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" nice colorscheme
Plug 'gruvbox-community/gruvbox'

" utilities
Plug 'preservim/nerdcommenter'
Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'b72u68/vim-chtsh'

" NeoVim Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" NeoVim telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()


" __________ KEY MAPPING __________

" map <leader> key to <space> key
let mapleader=" "

" turn off highlighting after searching
map <leader>nl :nohl<CR>

" Split panes navigation
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

" short key for exiting
map <leader>q :q!<CR>

" short key for saving file
map <leader>w :w<CR>

" for directory tree
let g:netrw_browse_split=4
let g:netrw_banner=0
let g:netrw_winsize=30
let g:netrw_localrmdir='rm -r'
let g:netrw_list_hide='__pycache__,\.swp,*\.swp,.DS_Store'
nnoremap <C-n> :vsplit <bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>

" short key to open terminal
nnoremap <leader>tu :botright vsplit <bar> :terminal<CR>
nnoremap <leader>th :split <bar> :resize 10 <bar> :terminal<CR>

" focus on pane
nnoremap <leader>m :MaximizerToggle!<CR>

" call undotree
nnoremap <leader>u :UndotreeShow<CR>

" force reload lsp
nnoremap <leader>rl :lua vim.lsp.stop_client(vim.lsp.get_active_clients())<CR> <bar> :edit<CR>

" move the cursor in to the parentheses
imap "" ""<esc>i
imap '' ''<esc>i
imap () ()<esc>i
imap [] []<esc>i
imap {} {}<esc>i
imap <> <><esc>i
imap $$ $$<esc>i

" Copy to clipboard
vnoremap  <leader>y  "+y
nnoremap  <leader>Y  "+yg_
nnoremap  <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P


" __________ BASIC SETTINGS __________

syntax on                   " set syntax coloring theme to default

" ColorScheme
if (has("termguicolors"))
    set termguicolors
endif

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:gruvbox_contrast_dark='medium'
let g:gruvbox_invert_selection=0

colorscheme gruvbox
set background=dark

hi LineNr guifg=#5eacd3
hi Normal guibg=NONE ctermbg=NONE
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f
"hi StatusLine guibg=#0B0C12 guifg=white gui=bold
"hi ColorColumn guibg=#0B0C12

" Copy paste from clipboard
set clipboard=unnamedplus

" Spaces and Tabs
set autoindent				" set auto indent
set smartindent		 	   	" set smart indent
set tabstop=4				" set number of spaces per TAB
set softtabstop=4			" set number of spaces per TAB while editing
set shiftwidth=4			" set space width for auto indent
set expandtab				" set TABs to spaces (TAB is four spaces)
set backspace=indent,eol,start		" allow backspacing over everything in insert mode

" UI Configurations
set nocompatible
set history=9000
set encoding=utf-8
set colorcolumn=80          " enable color column
set number			    	" set line numbers
set rnu
filetype indent on			" set filetype specific indent
set wildmenu				" visual autocomplete for command menu
set wildmode=longest:full,full
set lazyredraw				" redraw screen when needed
set showmatch				" highlight matching [({})]
set visualbell				" flash screen when error
set splitbelow
set nowrap
set mouse=a

" Searching
set incsearch				" set incremental search (search as characters are entered)
set hlsearch				" highlight matches
set ignorecase				" insensitive case searching
set smartcase				" insensitive case searching

" File writing and update
set completeopt=menuone,noinsert,noselect
set noswapfile
set hidden
set nobackup
set nowritebackup
set updatetime=50
set shortmess+=c
set undodir=~/.vim/undodir
set undofile

" __________ FILES/PLUGINS CONFIG __________

" vim open .tex file as LaTeX file instead of plaintex file
let g:tex_flavor = 'latex'

" setting for python
set pyxversion=3
let g:python3_host_prog = '/usr/bin/python3'
let g:pymode_python = 'python3'
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" setting for nvim-lspconfig and completion-nvim
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_on_delete = 1
let g:completion_sorting = "length"
let g:completion_matching_ignore_case = 1
let g:completion_enable_auto_paren = 1

lua require'lspconfig'.pylsp.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }

lua << EOF
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = false,
        virtual_text = true,
        signs = true,
        update_in_insert = true,
    }
)
EOF

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>K :lua vim.lsp.buf.hover()<CR>

" setting for vim-gitgutter
highlight GitGutterAdd guifg=#009900 ctermfg=Green
highlight GitGutterChange guifg=#bbbb00 ctermfg=Yellow
highlight GitGutterDelete guifg=#ff2222 ctermfg=Red
highlight GitGutterChangeDelete guifg=#ff2222 ctermfg=Red

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'

nmap ) <Plug>(GitGutterNextHunk)
nmap ( <Plug>(GitGutterPrevHunk)

let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0

" setting for fugitive
nmap <leader>gs :G<CR>

" setting for searching ag.vim
if executable('rg')
    let g:rg_derive_root='true'
endif

"set treesitter syntax highlighting
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" setting for telescope
lua << EOF
require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        selection_caret = ' > ',
        prompt_prefix = ' > ',
        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
        layout_strategy = "flex"
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        }
    }
}

require('telescope').load_extension('fzy_native')
EOF

nnoremap <leader>pf <cmd>Telescope find_files<cr>
nnoremap <leader>pg <cmd>Telescope git_files<cr>
nnoremap <leader>pr <cmd>Telescope live_grep<cr>
nnoremap <leader>ps <cmd>Telescope grep_string<cr>
nnoremap <leader>pb <cmd>Telescope buffers<cr>
nnoremap <leader>ph <cmd>Telescope help_tags<cr>

" lualine.nvim setup
lua << EOF
require('lualine').setup{
    options = {
        icons_enabled = true,
        section_separators = '',
        component_separators = '|'
    }
}
EOF

" highlight yank
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" trim white space
fun! TrimWhiteSpace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" trim white space on save
augroup TrimSpaceOnSave
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END


" __________ CUSTOM THINGS TO REMIND ME HOW TO DO VIM THE RIGHT WAY __________

" Try to prevent bad habits like using the arrow keys for movement.

" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>

" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>
