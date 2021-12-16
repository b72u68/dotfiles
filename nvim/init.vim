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
Plug 'b72u68/vim-chtsh'

" NeoVim Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" NeoVim telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

call plug#end()


" __________ KEY MAPPINGS __________

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
let g:netrw_altv=1
let g:netrw_browse_split=4
let g:netrw_banner=0
let g:netrw_winsize=30
let g:netrw_localrmdir='rm -r'
let g:netrw_list_hide='__pycache__,\.swp,*\.swp,.DS_Store'
nnoremap <C-n> :Vex<bar> :vertical resize 30<CR>
nnoremap <leader>= :vertical resize +5<CR>
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
imap `` ``<esc>i

" cheat sheet
nnoremap <leader>ch :CheatSheet<CR>


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

let g:opamshare = substitute(system('opam var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"

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
lua require'nvim-treesitter.configs'.setup{highlight={ enable=true }, incremental_selection={ enable=true }, textobjects={ enable=true }}

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

" WSL yank support
let s:clip = '/mnt/c/Windows/System32/clip.exe'  " change this path according to your mount point
if executable(s:clip)
    augroup WSLYank
        autocmd!
        autocmd TextYankPost * if v:event.operator ==# 'y' | call system(s:clip, @0) | endif
    augroup END
endif


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
