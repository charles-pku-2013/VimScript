function! PrintArgs(...)
    let l:arglist = range(1, a:0)
    for argno in l:arglist
        let l:arg = get(a:, argno, 0)
        echom "Arg " . argno . ": " . l:arg
    endfor
endfunction

" call PrintArgs("abc", "def ghi")
" call PrintArgs(1, "def ghi")
command! -nargs=* PrintArgsF call PrintArgs(<f-args>)
command! -nargs=* PrintArgsQ call PrintArgs(<q-args>)
" PrintArgs a b c 必须是事先定义好的变量
command! -nargs=* PrintArgs call PrintArgs(<args>)

