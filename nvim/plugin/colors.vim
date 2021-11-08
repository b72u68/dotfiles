" __________ COLORS __________

" set syntax coloring theme to default
syntax on

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
