" __________ BASICS SETTINGS __________

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

set rtp^="/home/edo/.opam/default/share/ocp-indent/vim"
