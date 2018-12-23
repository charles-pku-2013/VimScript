function! NERDTreeOpenSplit()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        let l:fname = fnamemodify(n.path.str(), ':.')
        execute 'wincmd h'
        execute 'sp ' . l:fname
        execute 'NERDTreeClose'
    endif
endfunction

function! NERDTreeOpenVSplit()
    let n = g:NERDTreeFileNode.GetSelected()
    if n != {}
        let l:fname = fnamemodify(n.path.str(), ':.')
        execute 'wincmd h'
        execute 'botright vsp ' . l:fname
        execute 'NERDTreeClose'
    endif
endfunction

call NERDTreeAddKeyMap({
        \ 'key': '<C-v>',
        \ 'callback': 'NERDTreeOpenVSplit',
        \ 'quickhelpText': 'Open in vertical split' })

call NERDTreeAddKeyMap({
        \ 'key': '<C-s>',
        \ 'callback': 'NERDTreeOpenSplit',
        \ 'quickhelpText': 'Open in horizontal split' })
