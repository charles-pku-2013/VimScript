" 列出当前tab打开的buffer
" 注意是打开的，以split形式呈现的
" 不是由此tab打开过的buffer
function! ListTabBuffer()
    " get buf list of current tab
    let l:buflist = tabpagebuflist()
    for bufid in l:buflist
        let bufmsg = ""
        let bufmsg = bufmsg . bufid

        let l:bufname = bufname(bufid)
        if (strlen(l:bufname) <= 0)
            let l:bufname = "[No Name]"
        endif
        let bufmsg = bufmsg . "\t". l:bufname

        " let l:buftype = getbufvar(bufid, '&buftype')
        let l:buftype = getbufvar(bufid, '&filetype')
        let bufmsg = bufmsg . "\t". l:buftype

        if (bufloaded(bufid))
            let bufmsg = bufmsg . "\t". "loaded"
        else
            let bufmsg = bufmsg . "\t". "not loaded"
        endif

        " tagbar not listed
        if (buflisted(bufid))
            let bufmsg = bufmsg . "\t". "listed"
        else
            let bufmsg = bufmsg . "\t". "not listed"
        endif

        echo bufmsg
    endfor
endfunction

