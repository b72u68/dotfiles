" [[__________ PLUGINS __________]]


" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Load in plugins
call plug#begin('~/.vim/plugged')

" Language server
Plug 'williamboman/mason.nvim', { 'do': ':MasonUpdate' }
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'VonHeikemen/lsp-zero.nvim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'lervag/vimtex'

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Make NeoVim pretty
Plug 'ellisonleao/gruvbox.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Utilities
Plug 'preservim/nerdcommenter'
Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'hoob3rt/lualine.nvim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()

" highlight yank
augroup LuaHighlight
  autocmd!
  autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

" trim white space
fun! TrimWhiteSpace()
    " Don't strip traling spaces in sml or haskell files
    if &ft =~ 'sml\|haskell'
        return
    endif
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" trim white space on save
augroup TrimSpaceOnSave
    autocmd!
    autocmd BufWritePre * :call TrimWhiteSpace()
augroup END

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" Set up ocamlformat for neovim
set rtp^="/home/edo/.opam/default/share/ocp-indent/vim"

