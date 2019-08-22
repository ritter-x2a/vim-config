" cpp specific settings.

nnoremap <buffer> <Leader>e :FSHere<CR>
nnoremap <buffer> <localleader>t :YcmCompleter GetType<CR>
nnoremap <buffer> <localleader>p :YcmCompleter GetParent<CR>
nnoremap <buffer> <localleader>d :YcmCompleter GoToDeclaration<CR>
nnoremap <buffer> <localleader>g :YcmCompleter GoTo<CR>

inoremap <buffer> .. ->

" Fold helper for C an C++ {{{
"
" Rather than using foldmethod=syntax, folds are created manually according to
" certian rules.
" Created by Tomasz Dudziak

python <<endpython
def create_c_folds():
    import vim
    vim.command('set foldmethod=manual')
    vim.command('normal zE') # eliminate all folds
    win = vim.current.window

    show_next = True
    to_show = []
    for (i, line) in enumerate(vim.current.buffer):
        if line.strip() == '{':
            pos = (i+1, line.find('{')+1)
            win.cursor = pos
            vim.command('normal zf%zo')
            if show_next:
                to_show.append(pos)

        if 'namespace' in line or 'class' in line or 'struct' in line:
            show_next = True
        else:
            show_next = False

    # fold everything
    vim.command('normal zM')

    # unfold folds in `to_show'
    for pos in to_show:
        win.cursor = pos
        vim.command('normal zo')

    # go to the first line
    # TODO: attempt to restore previous position and scroll state
    vim.command('normal gg')
endpython

python create_c_folds()

" }}}

python <<endpython
def toggle_c_ptr():
    import vim
    (_, i) = vim.current.window.cursor
    line = vim.current.line

    try:
        for (a,b) in [(i,i+2), (i-1,i+1)]:
            if line[a:b] == '->':
                vim.current.line = line[:a] + '.' + line[b:]
    except IndexError:
        pass

    try:
        if line[i] == '.':
            vim.current.line = line[:i] + '->' + line[i+1:]
    except IndexError:
        pass
endpython

nnoremap <buffer> <silent> <localleader>z :python create_c_folds()<Cr>
noremap <buffer> <silent> <localleader><localleader> :python toggle_c_ptr()<Cr>

