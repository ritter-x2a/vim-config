
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

inoremap <buffer> <C-Space>  

highlight NonBreakingSpace ctermbg=red guibg=red
match NonBreakingSpace / / " (CTRL+V x a 0)

inoremap <silent> <buffer> \ ptxtag

inoremap <silent> <buffer> \| ptxtagml

" inoremap <silent> <buffer> \ \<C-R>=UltiSnips#Anon("<\${1}>\${2}</\${1/([\\w:._-]+).*/\$1/}>", "\\")<cr>
"
" inoremap <silent> <buffer> \| \|<C-R>=UltiSnips#Anon("<\${1}>\n	\${2}\n</\${1/([\\w:._-]+).*/\$1/}>", "\|")<cr>


inoremap <silent> <buffer> <C-T> ptxterm
inoremap <silent> <buffer> <C-C> ptxcode
inoremap <silent> <buffer> <C-X> ptxmath
inoremap <silent> <buffer> <C-A> ptxaside
inoremap <silent> <buffer> <C-R> ptxxref
inoremap <silent> <buffer> <C-P> ptxpara

" inoremap <silent> <buffer> <C-T> <C-T><C-R>=UltiSnips#Anon("<term>\${1}</term><idx>\$1</idx>", "<C-T>")<cr>
" inoremap <silent> <buffer> <C-C> <C-C><C-R>=UltiSnips#Anon("<c>\${1}</c>", "<C-C>")<cr>
" inoremap <silent> <buffer> <C-V> <C-V><C-R>=UltiSnips#Anon("<m>\${1}</m>", "<C-V>")<cr>
" inoremap <silent> <buffer> <C-A> <C-A><C-R>=UltiSnips#Anon("<aside>\n	<p>\n		\${1}\n	</p>\n</aside>", "<C-A>")<cr>

" inoremap <silent> <buffer> <C-R> <C-R><C-R>=UltiSnips#Anon("<xref ref=\"${1}\"/>", "<C-R>")<cr>

