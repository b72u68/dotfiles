" __________ PLUGINS __________

call plug#begin('~/.vim/plugged')

" autocompletion and lsp
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" programming language highlighting
Plug 'lervag/vimtex'
Plug 'ap/vim-css-color'

" version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" fuzzy files finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" nice colorscheme
Plug 'gruvbox-community/gruvbox'

" vim status line
Plug 'itchyny/lightline.vim'

" utilities
Plug 'rking/ag.vim'
Plug 'preservim/nerdcommenter'
Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'

" NeoVim Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" NeoVim telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

call plug#end()


" __________ KEY MAPPING __________

" Map <leader> key to <space> key
let mapleader=" "

" turn off highlighting after searching
map <leader>nl :nohl<CR>

" Split panes navigation
map <leader>h <C-w>h
map <leader>j <C-w>j
map <leader>k <C-w>k
map <leader>l <C-w>l

" short key for exiting
map <leader>q :qa!<CR>

" short key for saving file
map <leader>w :w<CR>

" for directory tree
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize=30
let g:netrw_localrmdir='rm -r'
let g:netrw_liststyle=3
let g:netrw_list_hide='__pycache__,\.swp,*\.swp,.DS_Store'
nnoremap <C-n> :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>
nnoremap <leader>rp :resize 100<CR>

" short key to open terminal
nnoremap <leader>tu :botright vsplit<bar> :terminal<CR>
nnoremap <leader>th :split<bar> :resize 10<bar> :terminal<CR>

" focus on pane
nnoremap <leader>m :MaximizerToggle!<CR>

" call undotree
nnoremap <leader>u :UndotreeShow<CR>


" __________ BASIC SETTINGS __________

syntax on                   " set syntax coloring theme to default

" ColorScheme
if (has("termguicolors"))
    set termguicolors
endif

let g:gruvbox_contrast_dark='hard'
let g:gruvbox_invert_selection='0'

if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

colorscheme gruvbox
set background=dark

hi LineNr guifg=#5eacd3 
hi Normal guibg=NONE ctermbg=NONE
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f

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
set rnu                     " relative number of line
filetype indent on			" set filetype specific indent
set wildmenu				" visual autocomplete for command menu
set wildmode=longest:full,full
set lazyredraw				" redraw screen when needed
set showmatch				" highlight matching [({})]
set visualbell				" flash screen when error
set mouse=a			    	" enable mouse for all mode
set cmdheight=2
set splitbelow

" Searching
set incsearch				" set incremental search (search as characters are entered)
set hlsearch				" highlight matches
set ignorecase				" insensitive case searching
set smartcase				" insensitive case searching

" File writing and update
set hidden
set nobackup
set nowritebackup
set updatetime=50
set shortmess+=c
set undodir=~/.vim/undodir
set undofile


" __________ FILES/PLUGINS CONFIG __________

set noswapfile

" vim open .tex file as LaTeX file instead of plaintex file
let g:tex_flavor = 'latex'

" setting for python
let g:pymode_python = 'python3'
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" setting for nvim-lspconfig and completion-nvim

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

let g:completion_matching_strategy_list=['exact', 'substring', 'fuzzy']
lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.clangd.setup{ on_attach=require'completion'.on_attach }
lua require'lspconfig'.pyls.setup{ on_attach=require'completion'.on_attach }

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_enable_underline = 0
let g:diagnostic_auto_popup_while_jump = 1

nnoremap <leader>gd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>gn :lua vim.lsp.buf.rename()<CR>

" setting for lightline
let g:lightline={
    \ 'colorscheme' : 'gruvbox',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component': {
    \ 'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
    \ },
    \ }

" setting for fzf
nnoremap <leader>pf :Files<CR>
let g:fzf_layout = { "window": { "width": 0.8, "height": 0.8 } }
let $FZF_DEFAULT_OPTS="--reverse"
unlet g:fzf_colors

" setting for NERDCommenter
nmap <leader>cs <plug>NERDCommenterToggle
nmap <leader>cu <plug>NERDCommenterUncomment

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

" setting for searching (ag.vim and CocSearch)
if executable('rg')
    let g:rg_derive_root='true'
endif

"set treesitter syntax highlighting
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

" setting for telescope
lua require('telescope').setup({defaults = {file_sorter = require('telescope.sorters').get_fzy_sorter}})
nnoremap <leader>pf :lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>pg :lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>pb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>ph :lua require('telescope.builtin').help_tags()<cr>
nnoremap <C-p> :GFiles<CR>


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
