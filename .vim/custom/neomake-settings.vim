let g:neomake_javascript_enabled_makers = ['eslint']

autocmd BufEnter,InsertChange,TextChanged * Neomake

" open/close location list (populated with linter errors)
nnoremap <script> <silent> <c-l> :call ToggleLocationList()<CR>
nnoremap <script> <silent> <c-q> :call ToggleQuickfixList()<CR>

" go to current error/warning
nnoremap <Leader>l :lfirst<CR>

" nex  erro /warning
nnoremap [l :lnext<CR>

" previous error/warning
nnoremap ]l :lprev<CR>



" let g:neomake_eslint_maker = {
" \ 'cwd': ':pwd/app',
" \ }
