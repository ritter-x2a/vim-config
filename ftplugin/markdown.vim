
function! DisplayMD()
    let tmp = tempname().".html"
    execute "!markdown % > ".tmp
    execute "!chromium --app ".tmp
endfunction

nnoremap <buffer> <Leader>m :call DisplayMD()<CR>
