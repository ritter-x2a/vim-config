
" highlight! MyStatusLine term=reverse cterm=bold,reverse gui=reverse guifg=#657b83 guibg=NONE
" highlight! MyStatusLineNC term=reverse cterm=reverse gui=reverse guifg=#556b73 guibg=NONE
" highlight! MyColorColumn term=reverse cterm=reverse gui=reverse guifg=#455b63 guibg=NONE
highlight! MySpecialKey guibg=NONE guifg=#dc322f ctermbg=NONE ctermfg=160

" highlight! link StatusLine MyStatusLine     " active statusline
" highlight! link TabLine MyStatusLine        " active tabline
" highlight! link StatusLineNC MyStatusLineNC " inactive statusline
" highlight! link ColorColumn MyColorColumn   " colorcolumn
" highlight! link SignColumn Background       " sign coloumn
highlight! link SpecialKey MySpecialKey     " listchars, etc.

if &background == "dark"
    highlight! User1 ctermbg=160 ctermfg=249 term=reverse cterm=reverse gui=reverse guibg=#d70000 guifg=#b2b2b2
    highlight! User2 ctermbg=27 ctermfg=249 term=reverse cterm=bold,reverse gui=bold,reverse guibg=#005fff guifg=#b5b5b5
    highlight! User3 ctermbg=242 ctermfg=249 term=bold,reverse cterm=bold,reverse gui=bold,reverse guibg=#6c6c6c guifg=#b5b5b5
else
    highlight! User1 ctermbg=160 ctermfg=244 term=reverse cterm=reverse gui=reverse guibg=#d70000 guifg=#b2b2b2
    highlight! User2 ctermbg=27 ctermfg=244 term=reverse cterm=bold,reverse gui=bold,reverse guibg=#005fff guifg=#b5b5b5
    highlight! User3 ctermbg=240 ctermfg=244 term=bold,reverse cterm=bold,reverse gui=bold,reverse guibg=#6c6c6c guifg=#b5b5b5
endif

highlight! DiffAdd cterm=reverse,bold ctermfg=238 ctermbg=76 gui=reverse,bold guifg=#444444 guibg=#5fd700
highlight! DiffChange cterm=reverse,bold ctermfg=238 ctermbg=142 gui=reverse,bold guifg=#444444 guibg=#afaf00
highlight! DiffDelete cterm=reverse,bold ctermfg=238 ctermbg=160 gui=reverse,bold guifg=#444444 guibg=#d70000
