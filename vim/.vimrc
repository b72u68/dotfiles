" __________ PLUGINS __________

call plug#begin('~/.vim/plugged')                   

" code completion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" plugins for programming 
Plug 'plasticboy/vim-markdown'
Plug 'lervag/vimtex'
Plug 'dense-analysis/ale'
Plug 'vim-python/python-syntax'

" version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" directory tree for vim
Plug 'preservim/nerdtree'

" fuzzy files finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" nice colorscheme
Plug 'gruvbox-community/gruvbox'

" vim status line
Plug 'itchyny/lightline.vim'

" utilities
Plug 'rking/ag.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround' 
Plug 'preservim/nerdcommenter'

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

" toggle spell check using <leader>c ('c' for check)
map <leader>cw :setlocal spell! spelllang=en_us<CR>

" short key for exiting
map <leader>q :q<CR>

" short key for saving file
map <leader>w :w<CR>


" __________ BASIC SETTINGS __________

syntax on   		    	" set syntax coloring theme to default

" set color scheme 
if (has("termguicolors"))
    set termguicolors
endif

colorscheme gruvbox
set background=dark

hi Normal guibg=NONE ctermbg=NONE


" Spaces and Tabs

set autoindent				" set auto indent
set smartindent		 	   	" set smart indent
set tabstop=4				" set number of spaces per TAB
set softtabstop=4			" set number of spaces per TAB while editing
set shiftwidth=4			" set space width for auto indent
set expandtab				" set TABs to spaces (TAB is four spaces)
set backspace=indent,eol,start		" allow backspacing over everything in insert mode
set nojoinspaces            " suppress inserting two spaces between sentences


" UI Configurations 

set nocompatible
set history=9000

set encoding=utf-8

set colorcolumn=80          " enable color column

set number			    	" set line numbers
set rnu                     " relative number of line
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE

filetype indent on			" set filetype specific indent

set wildmenu				" visual autocomplete for command menu
set wildmode=longest:full,full

set lazyredraw				" redraw screen when needed 

set showmatch				" highlight matching [({})]

set cursorline

set visualbell				" flash screen when error 
set mouse=a			    	" enable mouse for all mode

" split panes open bottom and right
set splitbelow splitright

set guicursor=


" Searching

set incsearch				" set incremental search (search as characters are entered)
set hlsearch				" highlight matches

set ignorecase				" insensitive case searching
set smartcase				" insensitive case searching


" __________ FILES/PLUGINS CONFIG __________

set noswapfile

" vim open .tex file as LaTeX file instead of plaintex file
let g:tex_flavor = 'latex'

" setting for python 
let g:pymode_python = 'python3'
let g:python_highlight_all = 1
let g:python_highlight_indent_errors = 0
let g:python_highlight_space_errors = 0

" setting for coc
set hidden
set nobackup
set nowritebackup
set updatetime=100
set shortmess+=c

" displaying documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

" use TAB for autocompletion
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<Tab>" :
    \ coc#refresh()

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
     
" GoTo code navigation.
nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gy <Plug>(coc-type-definition)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> <leader>gr <Plug>(coc-references)
nnoremap <leader>cr :CocRestart

" symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" setting for NERDTree
map <C-n> :NERDTreeToggle<CR>
map <C-f> :NERDTreeFind<CR>

let NERDTreeShowHidden=1
let NERDTreeIgnore=['__pycache__', '\.swp', '*\.swp']

" auto refresh NERDTree after creating new files
function! NERDTreeRefresh()
    if &filetype == 'nerdtree'
        silent exe substitute(mapcheck("R"), '<CR>', '', '')
    endif
endfunction

autocmd BufEnter * call NERDTreeRefresh()

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
nnoremap <C-p> :Files<CR>

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
 
"let g:gitgutter_realtime=1
let g:gitgutter_enabled=1
let g:gitgutter_map_keys=0


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


" __________ VIM CHEATSHEET  __________

" To SPLIT (netrw)
" Sex       - split horizontal file explorer
" Sex!      - split vertical file explorer
" Vex       - split vertical file explorer
" Ctrl-ww   - switch windows

" To MOVEMENT
" gg        - go to top of page
" G         - go to bottom of page
" w         - go to beginning of next word
" b         - go to beginning of previous word
" 42gg      - go to line 42
" 0         - go to beginning of line
" $         - go to end of line
" }         - go to next paragraph
" {         - go to previous paragraph
" g;        - go to previous edit (and up edit branch)

" To SEARCH
" /{string} - search for string
" *         - search for current string
" n         - go to next instance
" N         - go to previous instance

" To COPY
" y         - copy current line
" y$        - copy to end of current line
" yiw       - copy current word
" d{motion} - cut
" p         - paste after cursor
" P         - paste before cursor
" Vp        - paste yanked line
" yap       - copy current paragraph

" To DELETE
" x         - delete current character
" dw        - delete current word
" dd        - delete current line
" 5dd       - delete five lines
" d$        - delete until end of line
" d0        - delete until beginning of line
" dap       - delete current paragraph
" dG        - delete to end of file

" To REPLACE
" r         - replace character under cursor
" R         - enter Replace mode
" ciw       - delete current word and go into insert mode 

" For KEY MAPPING
" <BS>           Backspace
" <Tab>          Tab
" <CR>           Enter
" <Enter>        Enter
" <Return>       Enter
" <Esc>          Escape
" <Space>        Space
" <Up>           Up arrow
" <Down>         Down arrow
" <Left>         Left arrow
" <Right>        Right arrow
" <F1> - <F12>   Function keys 1 to 12
" #1, #2..#9,#0  Function keys F1 to F9, F10
" <Insert>       Insert
" <Del>          Delete
" <Home>         Home
" <End>          End
" <PageUp>       Page-Up
" <PageDown>     Page-Down
" <bar>          the '|' character, which otherwise needs to be escaped '\|'
