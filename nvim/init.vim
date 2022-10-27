" __________ PLUGINS __________

call plug#begin('~/.vim/plugged')

" builtin language server
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'
Plug 'lervag/vimtex'

" version control
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" nice colorscheme
Plug 'ellisonleao/gruvbox.nvim'
Plug 'EdenEast/nightfox.nvim'

" utilities
Plug 'preservim/nerdcommenter'
Plug 'szw/vim-maximizer'
Plug 'mbbill/undotree'
Plug 'hoob3rt/lualine.nvim'

" NeoVim Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" NeoVim telescope
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
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" trim white space on save
"augroup TrimSpaceOnSave
    "autocmd!
    "autocmd BufWritePre * :call TrimWhiteSpace()
"augroup END

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif

" set .iit files to have iitran filetype
autocmd BufNewFile,BufRead *.iit set filetype=iitran

lua << EOF
vim.filetype.add({
    extension = {
        iit="iitran"
    }
})
EOF
