command! -nargs=1 MdnDoc call s:MdnDoc(<f-args>)

function! s:MdnDoc(term)
   call OpenSmartSplit()
   setlocal bt=nowrite
   nnoremap <silent> <buffer> q :q!<cr>
   execute 'r! mdn-cli ' . a:term
   setlocal syntax=javascript
   norm gg
endfunction
