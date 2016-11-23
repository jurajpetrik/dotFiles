" DEOPLETE
let g:deoplete#enable_at_startup = 1
" Path completion from buffer directory not pwd
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" do not disable automatic completion
let g:deoplete#disable_auto_complete = 0

" max how many suggestions to show
let g:deoplete#max_list = 25

" automatically close preview window of deoplete once chose sth
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

set completeopt=longest,menuone,preview
let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']

" two lines below are only necessary if you're running tern_for_vim
" let g:tern#command = ['tern']
" let g:tern#arguments = ['--persistent']

" use <tab> to bring up autocompletion

let g:UltiSnipsExpandTrigger="<C-j>"

" Tab in insert mode acts like regular tab, unless pop up menu is visible,
" then it goes to next item in popup menu
" Shift-Tab in insert mode brings up popup menu if not visible, if visible it
" goes to previous item in popup menu

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<C-n>"

" close the preview window when you're not using it
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" /DEOPLETE
