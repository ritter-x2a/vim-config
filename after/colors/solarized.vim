
highlight! MyStatusLine term=reverse cterm=bold,reverse gui=reverse guifg=#657b83 guibg=NONE
highlight! MyStatusLineNC term=reverse cterm=reverse gui=reverse guifg=#556b73 guibg=NONE
highlight! MyColorColumn term=reverse cterm=reverse gui=reverse guifg=#455b63 guibg=NONE
highlight! MySpecialKey guibg=NONE guifg=#dc322f ctermbg=NONE ctermfg=11

highlight! link StatusLine MyStatusLine     " active statusline
highlight! link TabLine MyStatusLine        " active tabline
highlight! link StatusLineNC MyStatusLineNC " inactive statusline
highlight! link ColorColumn MyColorColumn   " colorcolumn
highlight! link SignColumn Background       " sign coloumn
highlight! link SpecialKey MySpecialKey     " listchars, etc.

highlight! User1 term=reverse cterm=reverse gui=reverse guifg=#657b83 guibg=#bc120f
highlight! User2 term=reverse cterm=bold,reverse gui=bold,reverse guifg=#657b83 guibg=#004b92
