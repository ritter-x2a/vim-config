""==============================================================================
"         FILE:  init.vim
"  DESCRIPTION:  my personal configuration file for nvim
"       AUTHOR:  Fabian Ritter
"      CREATED:  05.05.2016
"==============================================================================
"
let g:python_host_prog = '/bin/python'
let g:python3_host_prog = '/bin/python3'
"
"==============================================================================
" Plugins {{{
"==============================================================================
"
let g:python_host_prog='/usr/bin/python2'
"
call plug#begin('~/.config/nvim/plugged')

" optical
Plug 'https://github.com/jonathanfilip/vim-lucius.git'
Plug 'https://github.com/vim-scripts/AfterColors.vim.git'
Plug 'https://github.com/Yggdroot/indentLine.git'

" file interaction
Plug 'https://github.com/ctrlpvim/ctrlp.vim.git'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'https://github.com/airblade/vim-gitgutter.git'

" editing features
Plug 'https://github.com/Raimondi/delimitMate.git'
" Plug 'https://github.com/sjl/gundo.vim.git'
Plug 'https://github.com/tomtom/tcomment_vim.git'
Plug 'https://github.com/terryma/vim-multiple-cursors.git'
Plug 'https://github.com/SirVer/ultisnips.git'
Plug 'https://github.com/honza/vim-snippets.git'
" Plug 'https://github.com/bfredl/nvim-miniyank.git', has('nvim') ? {} : { 'on': [] }
Plug 'https://github.com/eugen0329/vim-esearch.git'
Plug 'https://github.com/easymotion/vim-easymotion.git'

" autocompletions
Plug 'zxqfl/tabnine-vim', $SLIMVIM ? {'on': []} : {}
" Plug 'https://github.com/ajh17/VimCompletesMe.git', $SLIMVIM ? {} : {'on': []}

" Plug 'https://github.com/ajh17/VimCompletesMe.git'

Plug 'https://github.com/rhysd/vim-grammarous.git'

" required libs
Plug 'https://github.com/tomtom/tlib_vim.git'
Plug 'https://github.com/vim-scripts/L9.git'
Plug 'https://github.com/xolox/vim-misc.git'

" special file types
Plug 'https://github.com/xolox/vim-notes.git'
Plug 'https://github.com/scrooloose/syntastic.git', { 'on': 'SyntasticToggleMode' }
Plug 'https://github.com/derekwyatt/vim-fswitch', { 'for': ['c', 'cpp'] }
Plug 'https://github.com/LaTeX-Box-Team/LaTeX-Box.git', { 'for': 'tex' }
Plug 'https://github.com/vim-scripts/taglist.vim.git', { 'for': ['c', 'cpp'] }
" Plug 'https://github.com/Valloric/YouCompleteMe.git', { 'for' : ['cpp', 'rust']}
Plug 'https://github.com/derekwyatt/vim-scala', { 'for' : 'scala'}
Plug 'https://github.com/JuliaEditorSupport/julia-vim', { 'for' : 'julia'}

" my plugins
Plug '~/.config/nvim/my_plugins/hexmode'
Plug '~/.config/nvim/my_plugins/vsearch'

Plug 'https://github.com/equalsraf/neovim-gui-shim.git'

call plug#end()
" }}}
"==============================================================================
"
"==============================================================================
" general settings {{{
"==============================================================================
"
filetype  plugin on
filetype  indent on
syntax    on
syntax sync minlines=150 maxlines=300

let g:tex_flavor = 'latex'
let g:tex_conceal = ''

let mapleader = "\<space>"
let maplocalleader = "+"

" settings
set autoindent                  " copy indent from current line
set autoread                    " read open files again when changed outside
set backspace=indent,eol,start  " backspacing over everything in insert mode
set browsedir=current           " which directory to use for the file browser
set complete+=k                 " scan files given with the 'dictionary' option
set completeopt=menu,menuone    " do not show preview window
set confirm                     " ask instead of failing for commands like :q
set colorcolumn=81,121          " color guides at popular widths
set cpoptions=aAceInB           " Switch to new file at write
                                " keep inserted indent for autoindent
                                " use numbercolumn for wrapped lines
set directory=~/.vimswp         " set directory for swap files
set display=lastline
set encoding=utf8               " default encoding
set expandtab                   " use spaces instead of tabs
set hidden                      " avoid confirm dialog for fuf
" set highlight+=@:Special        " highlight color of line wrap symbol
set history=50                  " keep 50 lines of command line history
set hlsearch                    " highlight the last used search pattern
set ignorecase
set incsearch                   " do incremental searching
set nojoinspaces                " no join double spaces after .?!
set laststatus=2                " always show status line
" set lazyredraw
set listchars=tab:┣━,trail:•    " strings to use in 'list' mode
set list                        " show tabs and trailing spaces
set mouse=a                     " enable the use of the mouse
set nolinebreak                 " wrap at specified characters
set number                      " show line numbers
" set popt=left:8pc,right:3pc     " print options
set ruler                       " show the cursor position all the time
set scrolloff=4                 " always keep 7 lines above and below cursor
set sidescroll=1                " horizontal scrolldistance
set sidescrolloff=15            " always keep 15 colums left and right cursor
set shiftwidth=4                " number of spaces to use for a step of indent
set showbreak=\ ↪\              " line wrap symbol
set noshowcmd
set noshowmode                  " do not show mode when changed
set smartcase                   " smart case sensitivity for searches
set smartindent                 " smart autoindenting when starting a new line
set softtabstop=4               " number of spaces that a <Tab> counts for
set synmaxcol=250               " limit syntax highlighting
set tabstop=4                   " number of spaces that a <Tab> counts for
set undofile
set undodir=~/.vimundo
set wildignore=*.bak,*.o,*.e,*~ " wildmenu: ignore these extensions
set wildmenu                    " command-line completion in an enhanced mode
set wildignorecase              " case insensitive

set linebreak
set breakindent

" nvim
set clipboard+=unnamedplus

set background=dark
colorscheme lucius
" let g:lucius_no_term_bg=1
LuciusDark

" }}}
"==============================================================================
"
"==============================================================================
" Status Line {{{
"==============================================================================
"
let g:statusline_sep_left='╲'
let g:statusline_sep_right='╱'
"
function! StatuslineMode()
    let l:mode = mode()
    if l:mode ==# "n"
        let l:modestr="N "
    elseif l:mode ==# "i"
        let l:modestr="I "
    elseif l:mode ==# "v"
        let l:modestr="V "
    elseif l:mode ==# "V"
        let l:modestr="VL"
    elseif l:mode ==# ""
        let l:modestr="VB"
    elseif l:mode ==# "R"
        let l:modestr="R "
    elseif l:mode ==# "s"
        let l:modestr="S "
    elseif l:mode ==# "S"
        let l:modestr="SL"
    elseif l:mode ==# ""
        let l:modestr="SB"
    elseif l:mode ==# "Rv"
        let l:modestr="VR"
    elseif l:mode ==# "no"
        let l:modestr="NO"
    elseif l:mode ==# "t"
        let l:modestr="T "
    else
        let l:modestr=l:mode
    endif
    let b:statusline_mode = "   ".l:modestr." "
    return b:statusline_mode
endfunction

function! StatuslineFileName()
    let b:statusline_filename = ""
    if len(expand('%')) > 0
        if &ft ==# "help"
            let b:statusline_filename = "help: ".expand('%:t:r')
        else
            let b:statusline_filename = expand('%')
        endif
    endif
    return b:statusline_filename
endfunction

function! StatuslineAttributes()
    let b:statusline_attributes = ""
    if &ft ==# "help"
        return ""
    endif
    if &modifiable && &modified
        let b:statusline_attributes .= "mod"
    elseif !&modifiable
        let b:statusline_attributes .= "umod"
    endif
    if &readonly
        if len(b:statusline_attributes) > 0
            let b:statusline_attributes .= ","
        endif
        let b:statusline_attributes .= "read"
    endif
    return b:statusline_attributes
endfunction

function! StatuslineSpellInfo()
    let b:statusline_spell_info = ""
    if &spell == 0
        return ""
    endif
    return "spl: ".&spelllang." "
endfunction

function! StatuslineFileInfo()
    let b:statusline_fileinfo = ''
    if &ft ==# "help"
        return ""
    endif
    " only display fileformat if it differs from the default
    if len(&fileformat) > 0 && !(&fileformat ==# (split(&fileformats,','))[0])
        let b:statusline_fileinfo .= g:statusline_sep_right." ".&fileformat." "
    endif
    " only display fileencoding if it differs from the internal representation
    if len(&fileencoding) && !(&fileencoding ==# &encoding) > 0
        let b:statusline_fileinfo .= g:statusline_sep_right." ".&fileencoding." "
    endif
    if len(&filetype) > 0
        let b:statusline_fileinfo .= g:statusline_sep_right." ".&filetype." "
    endif
    return b:statusline_fileinfo
endfunction

function! ConditionalSep(fn, left)
    let l:str = a:fn()
    if len(l:str) > 0
        if a:left
            return "  ".g:statusline_sep_left." "
        else
            return " ".g:statusline_sep_right." "
        endif
    endif
    return ""
endfunction

highlight User1 term=reverse cterm=reverse gui=reverse guifg=#657b83 guibg=#bc120f
highlight User2 term=reverse cterm=bold,reverse gui=bold,reverse guifg=#657b83 guibg=#004b92
highlight User3 term=reverse cterm=reverse gui=reverse guifg=#657b83 guibg=#6c6c6c

" statusline
set statusline=%2*%{StatuslineMode()}%*
set statusline+=%{g:statusline_sep_left}\ "
set statusline+=%3*%{FugitiveStatusline()}%*
set statusline+=%{ConditionalSep(function('FugitiveStatusline'),1)}
set statusline+=%<
set statusline+=%{StatuslineFileName()}"
set statusline+=%{ConditionalSep(function('StatuslineFileName'),1)}
set statusline+=%1*
set statusline+=%{StatuslineAttributes()}
set statusline+=%w
set statusline+=%*
set statusline+=%{ConditionalSep(function('StatuslineAttributes'),1)}
set statusline+=%=
set statusline+=%{ConditionalSep(function('StatuslineSpellInfo'),0)}
set statusline+=%{StatuslineSpellInfo()}
set statusline+=%{StatuslineFileInfo()}
set statusline+=%{g:statusline_sep_right}
set statusline+=\ %3.l:%2v\ "
set statusline+=%{g:statusline_sep_right}
set statusline+=\ %3p%%\ "

" }}}
"==============================================================================
"
"==============================================================================
" autocommands {{{
"==============================================================================
if has("autocmd")
    augroup last_cursorposition
        " When editing a file, always jump to the last known cursor position.
        " Not when the position is invalid or when inside an event handler.
        " (happens when dropping a file on gvim).
        autocmd!
        autocmd BufReadPost *
                    \ if line("'\"") > 0 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif
    augroup END

    augroup filetype_gitcommit
        autocmd!
        autocmd FileType gitcommit setlocal spell spelllang=en_us
        autocmd FileType gitcommit setlocal nolist
        autocmd BufReadPost *COMMIT_EDITMSG exe "normal! gg"
    augroup END
endif " has("autocmd")
" }}}
"==============================================================================
"
"==============================================================================
"  terminal settings (nvim specific) {{{
"==============================================================================
if has('nvim')

highlight TermCursor ctermfg=red guifg=red

" Terminal settings
tnoremap <ESC><ESC> <C-\><C-n>

tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l

nnoremap <silent><Leader>i :call SmartSplit()<CR>:terminal<CR>

augroup nvim_terminal
    autocmd BufEnter * if &buftype == 'terminal' | :startinsert | endif
    autocmd TermOpen * setlocal statusline=%2*%{StatuslineMode()}%*%{g:statusline_sep_left}\ %{b:term_title}
augroup END

endif
"
"
" }}}
"==============================================================================
"
"==============================================================================
"  custom key mappings {{{
"==============================================================================
"
"------------------------------------------------------------------------------
"  general interaction mappings {{{
"------------------------------------------------------------------------------
"
" imap jk <Esc>
" imap kj <Esc>
"
noremap <ScrollWheelUp> 3<C-Y>
noremap <ScrollWheelDown> 3<C-E>
"
command! W write
"
"    new tab
nnoremap <silent><leader>k :tabe<CR>
"
"   save document
nnoremap <silent><leader>w :write<CR>
"
"   close
nnoremap <silent><leader>q :quit<CR>
"
"    , - normal mode: toggle fold
nnoremap , za
"
"    j k - visual/normal mode: move in wrapped lines correctly
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
"
"
"   H and L : move to start/end of line
nnoremap H _
nnoremap L $
"
"    Arrow Keys : scroll
nnoremap <UP> <C-y>
nnoremap <DOWN> <C-e>
nnoremap <LEFT> <C-u>
nnoremap <RIGHT> <C-d>
"
"   Smooth scrolling
function! SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=3
        sleep 15m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

" nnoremap <silent> <S-J> :call SmoothScroll(0)<CR>M
" nnoremap <silent> <S-K> :call SmoothScroll(1)<CR>M
nnoremap <silent> <A-j> :call SmoothScroll(0)<CR>M
nnoremap <silent> <A-k> :call SmoothScroll(1)<CR>M

nnoremap <S-J> <Esc>
nnoremap <S-K> <Esc>

nnoremap <leader><S-J> J
"
"    A-hjkl - normal mode: Move to other window.
nnoremap <A-h> <C-w>h
nnoremap <A-n> <C-w>j
nnoremap <A-u> <C-w>k
nnoremap <A-l> <C-w>l

"
"    C-arrows - normal mode: resize windows
nnoremap <silent> <C-left> <c-w><
nnoremap <silent> <C-down> <c-w>+
nnoremap <silent> <C-up> <c-w>-
nnoremap <silent> <C-right> <c-w>>
nnoremap <C-s> <C-i>
nnoremap <C-d> <C-o>
"
"    normal mode: next/prev tab
nnoremap <S-tab> :tabp<CR>
nnoremap <tab> :tabn<CR>

"    F2   -  highlight instances of the word currently under the cursor
nnoremap <silent> <F2> :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
"
"   Leader-n : disable search highlighting, hide loclist and quickfixlist
nnoremap <silent><leader>n :noh<CR>:cclose<CR>:lclose<CR>
"
"   Make Y consistent
nnoremap Y y$
"   Search
nnoremap - /
nnoremap _ ?

vnoremap - /
vnoremap _ ?

"
"    Leader-p,c,d - normal mode: paste,copy,cut from/to clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+yy
vnoremap <leader>y "+y
vnoremap <leader>d "+x


" noone needs the default ; meaning
nnoremap ; :

"   A-r - normal mode: redo
nnoremap <A-r> <C-r>
"
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
"  editing-key mappings {{{
"------------------------------------------------------------------------------
"
"    Allow multiple shifts
vnoremap < <gv
vnoremap > >gv
"
"   Leader-s - normal/visual mode: substitute
nnoremap <leader>s /<CR>:%s///g<left><left>
vnoremap <leader>s :s///g<left><left>
"
"   Leader-r reformat
nnoremap <leader>r gwgw
nnoremap <leader>R gqip

nnoremap <leader>u `]gU`[


"
" eliminate german layout
map Ö [
map! Ö [
omap Ö i[

map ö {
map! ö {
omap ö i{

map Ä ]
map! Ä ]
omap Ä a]

map ä }
map! ä }
omap ä a}

map ü \
map! ü \
omap ü \

map Ü ~
map! Ü ~
omap Ü ~

" map <Leader>ö <C-]>
" map <Leader>ä <C-t>
"
" inoremap <M-a> ä
" inoremap <M-A> Ä
" inoremap <M-o> ö
" inoremap <M-O> Ö
" inoremap <M-u> ü
" inoremap <M-U> Ü
"
" trailing spaces
function! ShowSpaces(...)
    let @/='\v(\s+$)|( +\ze\t)'
    let oldhlsearch=&hlsearch
    if !a:0
        let &hlsearch=!&hlsearch
    else
        let &hlsearch=a:1
    end
    return oldhlsearch
endfunction

function! TrimSpaces() range
    let oldhlsearch=ShowSpaces(1)
    execute a:firstline.",".a:lastline."substitute ///gec"
    let &hlsearch=oldhlsearch
endfunction

command! -bar -nargs=? ShowSpaces call ShowSpaces(<args>)
command! -bar -nargs=0 -range=% TrimSpaces <line1>,<line2>call TrimSpaces()
"
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" fancy mappings {{{
"------------------------------------------------------------------------------
"
"    w!! - command: sudo-write buffer
cmap w!! w !sudo tee % >/dev/null
"
function! GrepR(use_i)
    if getcwd() == expand('~')
        let choice =
            \confirm("Do you really want to grep -R in the home directory?",
            \ "&yes\n&no\n&cd to file path first", 2)
        if choice == 2
            return
        elseif choice == 3
            silent execute "cd ".expand('%:p:h')
            echom "cd'ed to '".expand('%:p:h')."'."
        endif
    endif
    call inputsave()
    let searchee = input("grep for: ")
    call inputrestore()
    if searchee == ""
        return
    endif
    if a:use_i == 0
        silent execute "grep! -R ".shellescape(searchee)." ."
    else
        silent execute "grep! -Ri ".shellescape(searchee)." ."
    endif
    copen
endfunction
"
"    <leader>g - normal mode: GrepRi
nnoremap <leader>g :call GrepR(1)<CR>
"
"    <leader>G - normal mode: GrepR
nnoremap <leader>G :call GrepR(0)<CR>
"
"
function! SmartSplit(...)
    let l:width=winwidth(0)
    if (l:width <= 120)
        if &buftype == 'terminal'
            let l:splitcmd = 'rightbelow new'
        else
            let l:splitcmd = 'rightbelow split'
        endif
    else
        if &buftype == 'terminal'
            let l:splitcmd = 'rightbelow vnew'
        else
            let l:splitcmd = 'rightbelow vsplit'
        endif
    endif
    if a:0
        execute l:splitcmd." ".a:1
    else
        execute l:splitcmd
    endif
endfunction
"
nnoremap <silent><leader>j :call SmartSplit()<CR>
"
"
"    Leader-op - normal mode: open previous buffer in vsplit
nnoremap <silent><leader>o :call SmartSplit(bufname("#"))<CR>
"
" [LEADER-V]  <leader>v   - display help for <leader>v mappings
nnoremap <silent> <leader>v :execute "!grep '\\[LEADER-V\\]' $MYVIMRC"<CR>
"
" [LEADER-V]  <leader>ve  - open vimrc in new tab
nnoremap <silent> <leader>ve  :tabnew $MYVIMRC<CR>
"
" [LEADER-V]  <leader>vr  - source vimrc
nnoremap <silent> <leader>vr  :source $MYVIMRC<CR>
"
" [LEADER-V]  <leader>vse - enable spell check english
nnoremap <silent> <leader>vse :setlocal spell spelllang=en_us<CR>
"
" [LEADER-V]  <leader>vsd - enable spell check german
nnoremap <silent> <leader>vsd :setlocal spell spelllang=de_20<CR>
"
" [LEADER-V]  <leader>vsn - disable spell check
nnoremap <silent> <leader>vsn :setlocal nospell<CR>
"
" [LEADER-V]  <leader>vf  - set foldmethod marker
nnoremap <silent> <leader>vf  :setlocal foldmethod=marker<CR>
"
" [LEADER-V]  <leader>vfo - insert opening foldmarkers
nnoremap <silent> <leader>vfo :call append(line(".")-1, get(split(&foldmarker, ","), 0))<CR>
"
" [LEADER-V]  <leader>vfc - append closing foldmarkers
nnoremap <silent> <leader>vfc :call append(line("."), get(split(&foldmarker, ","), 1))<CR>
"
"    A-a - Visual increment
vnoremap <A-a> :s/\%V[-+]\?\d\+/\=(submatch(0)+1)/g<CR>:set nohlsearch<CR>gv
"
"    A-x - Visual decrement
vnoremap <A-x> :s/\%V[-+]\?\d\+/\=(submatch(0)-1)/g<CR>:set nohlsearch<CR>gv

" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" autocomplete parenthesis, brackets and braces {{{
"------------------------------------------------------------------------------
" open function body automatically
inoremap {<CR> {<CR>}<esc>O
inoremap {{ {<CR>}<esc>O
inoremap {ö {<CR>}<esc>O
"}}}
"------------------------------------------------------------------------------
" }}}
"==============================================================================
"
"==============================================================================
" plugin configuration {{{
"==============================================================================
"
"------------------------------------------------------------------------------
" CtrlP {{{
"------------------------------------------------------------------------------
if executable('ag')
    " Use Ag over Grep
    set grepprg=ag\ --nogroup\ --nocolor

    " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

function! SmartCtrlP()
    if getcwd() ==# expand('~')
        CtrlPMRUFiles
    else
        CtrlPMixed
    endif
endfunction

nnoremap <silent><leader>d :call SmartCtrlP()<CR>

let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:30'
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_open_multiple_files = 'r'
let g:ctrlp_arg_map = 1
" let g:ctrlp_map = '<leader>f'
" let g:ctrlp_cmd = 'CtrlPMixed'
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" Gundo {{{
"------------------------------------------------------------------------------
" nnoremap <A-u> :GundoToggle<CR>
" let g:gundo_close_on_revert = 1
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" indentLine {{{
"------------------------------------------------------------------------------
" Vim
let g:indentLine_color_term = 238

"GVim
let g:indentLine_color_gui = '#556B73'

" none X terminal
let g:indentLine_color_tty_light = 7 " (default: 4)
let g:indentLine_color_dark = 1 " (default: 2)

let g:indentLine_char = '¦'
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" TComment {{{
"------------------------------------------------------------------------------
nmap <C-c> <Plug>TComment_<C-_><C-_>
nmap <leader>c <Plug>TComment_<C-_><C-_>
vmap <C-c> <Plug>TComment_<C-_><C-_>
vmap <leader>c <Plug>TComment_<C-_><C-_>
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" taglist {{{
"------------------------------------------------------------------------------
let Tlist_Use_Right_Window = 1      " place taglist on the right
let Tlist_Show_One_File = 1         " only show the current file
" let Tlist_Display_Prototype = 1   " show complete function prototypes
let Tlist_Display_Tag_Scope = 0     " do not display the scopes
" let Tlist_Compact_Format = 1
let tlist_tex_settings   = 'latex;s:sections;g:graphics;l:labels'
let tlist_make_settings  = 'make;m:makros;t:targets'
"
"    F4   -  toggle taglist
noremap   <silent> <F4>        :TlistToggle<CR>
inoremap  <silent> <F4>   <Esc>:TlistToggle<CR>
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" gitgutter {{{
"------------------------------------------------------------------------------
highlight link GitGutterAdd DiffAdd
highlight link GitGutterChange DiffChange
highlight link GitGutterDelete DiffDelete
highlight link GitGutterChangeDelete DiffChange

let g:gitgutter_map_keys = 0
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" Syntastic {{{
"------------------------------------------------------------------------------
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs = 0
let g:syntastic_enable_balloons = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1

" disable C and C++ checkers (as YCM has more features)
let g:syntastic_c_checkers = []
let g:syntastic_cc_checkers = []
let g:syntastic_cpp_checkers = []

"
"    F5   -  toggle Syntastic mode
noremap   <silent> <F5>        :SyntasticToggleMode<CR>
inoremap  <silent> <F5>   <Esc>:SyntasticToggleMode<CR>
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" LaTeXBox {{{
"------------------------------------------------------------------------------
" Note mappings in latex.vim
let g:LatexBox_latexmk_async = 0 "1
let g:LatexBox_latexmk_preview_continuously = 1
let g:LatexBox_quickfix = 4
let g:LatexBox_custom_indent = 0
let g:LatexBox_latexmk_options = "-synctex=1"
let g:LatexBox_viewer = 'GDK_SCALE=1 zathura -x "nvim --servername '.v:servername.' --remote +\%{line} \%{input}"'
" let g:LatexBox_Folding = 1

" let g:LatexBox_open_pats  = []
" let g:LatexBox_close_pats = []
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" Multiple Cursors {{{
"------------------------------------------------------------------------------
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_quit_key            = '<Esc>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'

let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_normal_maps={'d':1, 'c':1}
nnoremap <leader>mc :MultipleCursorsFind "
vnoremap <leader>mc :MultipleCursorsFind "
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" UltiSnips {{{
"------------------------------------------------------------------------------
" let g:UltiSnipsExpandTrigger="^"
" let g:UltiSnipsListSnippets="<c-^>"
" let g:UltiSnipsJumpForwardTrigger="^"
" let g:UltiSnipsJumpBackwardTrigger="<s-^>"
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" Notes {{{
"------------------------------------------------------------------------------

let g:notes_directories = ['~/Dropbox/notes']
let g:notes_suffix = '.txt'

" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" Mini Yank {{{
"------------------------------------------------------------------------------
"
" if has('nvim')
"   map p <Plug>(miniyank-autoput)
"   map P <Plug>(miniyank-autoPut)
"
"   map <leader>u <Plug>(miniyank-cycle)
" endif
"
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" YouCompleteMe {{{
"------------------------------------------------------------------------------
let g:ycm_always_populate_location_list = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_key_list_select_completion =  ['<Down>', '<CR>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_global_ycm_extra_conf = '~/.vim/makefiles/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['~/Repos/*','~/.vim/makefiles/.ycm_extra_conf.py']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_goto_buffer_command = 'horizontal-split'

" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" ESearch {{{
"------------------------------------------------------------------------------
let g:esearch = {
  \ 'adapter':    'ag',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 1000,
  \ 'prefill':        ['hlsearch', 'current', 'cword', 'last'],
  \}

" Start esearch prompt autofilled with one of g:esearch.use initial patterns
" call esearch#map('<leader>f', 'esearch')
" Start esearch autofilled with a word under the cursor
" call esearch#map('<leader>r', 'esearch-word-under-cursor')

nmap <leader>f <plug>(esearch)
" map  <leader>r <plug>(operator-esearch-prefill)
" map  <leader>f <plug>(operator-esearch-prefill)
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" EasyMotion {{{
"------------------------------------------------------------------------------
let g:EasyMotion_keys='qwertzuiopyxcvbnma;sldkghfj'
let g:EasyMotion_do_mapping=0

map + <Plug>(easymotion-prefix)
nmap <leader><leader> <Plug>(easymotion-bd-w)
" nmap <leader><leader> <Plug>(easymotion-jumptoanywhere)

" nmap <A-j> <Plug>(easymotion-j)
" nmap <A-k> <Plug>(easymotion-k)
" nmap <A-h> <Plug>(easymotion-linebackward)
" nmap <A-l> <Plug>(easymotion-lineforward)

omap ; <Plug>(easymotion-lineanywhere)
" omap ; <Plug>(easymotion-jumptoanywhere)
" }}}
"------------------------------------------------------------------------------
"
"------------------------------------------------------------------------------
" Grammarous {{{
"------------------------------------------------------------------------------
let g:grammarous#use_vim_spelllang=1
let g:grammarous#show_first_error=1
let g:grammarous#use_location_list=1
" }}}
"------------------------------------------------------------------------------
"
" }}}
"==============================================================================
"

highlight NonBreakingSpace ctermbg=red guibg=red
match NonBreakingSpace / / " (CTRL+V x a 0)

if ! empty(glob("$PROJECT_ROOT/.vimrc"))
    let project_vimrc = glob("$PROJECT_ROOT/.vimrc", 0, 1)[0]
    " echo "Sourcing " . project_vimrc . "..."
    exec "source " . project_vimrc
endif

" vim:set foldmethod=marker:
