command! -nargs=1 MdnDoc call s:MdnDoc(<f-args>)

function! s:MdnDoc(term)
:   vnew
:   echom "r! mdn-cli a:term"
:   echom a:term
:   r! mdn-cli a:term
:   set syntax=javascript
:   norm gg
endfunction

