nnoremap <buffer> <localleader>o :execute "!opt -O3 ".expand('%:p')." \| llvm-dis"<CR>

function! LlvmDot()
    let s:fun_name=["test"]
    %substitute/@\(\w*\)(\zs/\=map(s:fun_name, 'submatch(1)')[1:]
    execute "cd ".expand('%:p:h')
    silent write !opt -dot-cfg > /dev/null
    silent execute "!dot -Tpdf ".expand('%:p:h')."/cfg.".s:fun_name[0].".dot"." \| GDK_SCALE=1 zathura --fork - 2>/dev/null"
    redraw!
endfunction

nnoremap <buffer> <silent> <localleader>g :call LlvmDot()<CR>
