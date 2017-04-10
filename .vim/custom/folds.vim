" set foldmethod=syntax
" set foldlevelstart=1

" let javaScript_fold=1         " JavaScript

setlocal foldmethod=indent
setlocal foldignore=

" {} motion skips over closed folds
set foldopen-=block

nnoremap <silent> <leader>zj :call NextClosedFold('j')<cr>
nnoremap <silent> <leader>zk :call NextClosedFold('k')<cr>

function! NextClosedFold(dir)
    let cmd = 'norm!z' . a:dir
    let view = winsaveview()
    let [l0, l, open] = [0, view.lnum, 1]
    while l != l0 && open
        exe cmd
        let [l0, l] = [l, line('.')]
        let open = foldclosed(l) < 0
    endwhile
    if open
        call winrestview(view)
    endif
endfunction

" open folds when opening file
set foldlevel=99
