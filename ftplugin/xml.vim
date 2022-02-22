
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

inoremap <buffer> <C-Space>  

highlight NonBreakingSpace ctermbg=red guibg=red
match NonBreakingSpace / / " (CTRL+V x a 0)


" inoremap <silent> <buffer> \ \<C-R>=UltiSnips#Anon("<\${1:tag}>\${2}</\$1>", "\\")<cr>

inoremap <silent> <buffer> \ \<C-R>=UltiSnips#Anon("<\${1:tag}>\${2:\${VISUAL}}</\${1/([\\w:._-]+).*/\$1/}>", "\\")<cr>

inoremap <silent> <buffer> \| \|<C-R>=UltiSnips#Anon("<\${1:tag}>\n	\${2:\${VISUAL}}\n</\${1/([\\w:._-]+).*/\$1/}>", "\|")<cr>


