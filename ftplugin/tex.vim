" tex specific settings.

" setlocal conceallevel=0
" setlocal textwidth=80

setlocal shiftwidth=2
setlocal tabstop=2
setlocal softtabstop=2

function! HiWord()
    let l:word = expand('<cword>')
    let @/='\<'.l:word.'\>'
endfunction

" inoremap <buffer> <silent> <space> <C-o>:call HiWord()<CR><C-o>:set hls<CR><space>

function! HiTodos()
    let b:my_tex_refactors = matchadd("IncSearch","\\\\begin{refactor}\\_.\\{-}\\\\end{refactor}",15)
    let b:my_tex_todos = matchadd("ErrorMsg","\\\\todo{\\_.\\{-}}",20)
    let b:my_tex_cn = matchadd("StatusLine","\\\\cn",25)
endfunction

function! UnHiTodos()
    call matchdelete(b:my_tex_refactors)
    call matchdelete(b:my_tex_todos)
    call matchdelete(b:my_tex_cn)
endfunction

" call HiTodos()

let g:LatexBox_viewer = 'GDK_SCALE=1 zathura -x "gvim --servername '.v:servername.' --remote +\%{line} \%{input}"'

function! Synctex()
        " remove 'silent' for debugging
        if exists("g:syncpdf")
            execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
        else
            execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . substitute(bufname("%"),"tex$","pdf", "")
        endif
endfunction

map <buffer> <LocalLeader>s :call Synctex()<cr>

inoremap <buffer> <M-g>a \alpha
inoremap <buffer> <M-g>b \beta
inoremap <buffer> <M-g>g \gamma
inoremap <buffer> <M-g>d \delta
inoremap <buffer> <M-g>e \epsilon
inoremap <buffer> <M-g>ve \varepsilon
inoremap <buffer> <M-g>z \zeta
inoremap <buffer> <M-g>et \eta
inoremap <buffer> <M-g>th \theta
inoremap <buffer> <M-g>vt \vartheta
inoremap <buffer> <M-g>i \iota
inoremap <buffer> <M-g>k \kappa
inoremap <buffer> <M-g>l \lambda
inoremap <buffer> <M-g>m \mu
inoremap <buffer> <M-g>n \nu
inoremap <buffer> <M-g>x \xi
inoremap <buffer> <M-g>om \omicron
inoremap <buffer> <M-g>p \pi
inoremap <buffer> <M-g>vp \varpi
inoremap <buffer> <M-g>r \rho
inoremap <buffer> <M-g>vr \varrho
inoremap <buffer> <M-g>s \sigma
inoremap <buffer> <M-g>vs \varsigma
inoremap <buffer> <M-g>t \tau
inoremap <buffer> <M-g>u \upsilon
inoremap <buffer> <M-g>f \phi
inoremap <buffer> <M-g>vf \varphi
inoremap <buffer> <M-g>c \chi
inoremap <buffer> <M-g>ps \psi
inoremap <buffer> <M-g>o \omega

inoremap <buffer> <M-g>A \Alpha
inoremap <buffer> <M-g>B \Beta
inoremap <buffer> <M-g>G \Gamma
inoremap <buffer> <M-g>D \Delta
inoremap <buffer> <M-g>E \Epsilon
inoremap <buffer> <M-g>Z \Zeta
inoremap <buffer> <M-g>Et \Eta
inoremap <buffer> <M-g>Th \Theta
inoremap <buffer> <M-g>i \iota
inoremap <buffer> <M-g>K \Kappa
inoremap <buffer> <M-g>L \Lambda
inoremap <buffer> <M-g>M \Mu
inoremap <buffer> <M-g>N \Nu
inoremap <buffer> <M-g>X \Xi
inoremap <buffer> <M-g>Om \Omicron
inoremap <buffer> <M-g>P \Pi
inoremap <buffer> <M-g>R \Rho
inoremap <buffer> <M-g>S \Sigma
inoremap <buffer> <M-g>T \Tau
inoremap <buffer> <M-g>U \Upsilon
inoremap <buffer> <M-g>F \Phi
inoremap <buffer> <M-g>C \Chi
inoremap <buffer> <M-g>Ps \Psi
inoremap <buffer> <M-g>O \Omega

inoremap <buffer> << \leftarrow
inoremap <buffer> >> \rightarrow
inoremap <buffer> <<< \Leftarrow
inoremap <buffer> >>> \Rightarrow
inoremap <buffer> <> \leftrightarrow
inoremap <buffer> <<>> \Leftrightarrow


inoremap <buffer> ... \dots


" LaTeXBox
nmap <buffer> <S-F5> <Plug>LatexToggleStarEnv
nmap <buffer> <S-F6> <Plug>LatexChangeEnv

imap <buffer> [[     \begin{
imap <buffer> ]]     <Plug>LatexCloseCurEnv
vmap <buffer> \ <Plug>LatexWrapSelection
vmap <buffer> <C-F7>   <Plug>LatexWrapSelection
vmap <buffer> <S-F7> <Plug>LatexEnvWrapSelection

function! MyOwnTexFolds(ln)
  if match(a:ln, '\\begin{') >= 0
    return 'a1'
  elseif match(a:ln, '\\end{') >= 0
    return 's1'
  else
    return '='
  endif
endfunction

setlocal foldexpr=MyOwnTexFolds(v:lnum)

setlocal foldmethod=expr


