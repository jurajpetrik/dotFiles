" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Show the first match for the search pattern while you're still typing it
set incsearch

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" use spaces, not tabs for indentation :'-(
set expandtab

" display line numbers
set number

" display relative line numbers
set relativenumber

"turn on syntax highlighting
syntax on

"double slash to search for visually selected text
vnoremap // y/<C-R>"<CR>

"open new split panes to the right and bottom
set splitbelow
set splitright

"Maintain undo history between sessions (file closed, opened again)
set undofile

"Save undo history in this specific folder so as not to pollute
set undodir=~/.vim/undodir
" ---------------------- CUSTOM KEYBINDING --------------------------
"
" ctrl+J to split a line
:nnoremap <NL> i<CR><ESC>

" ZA to exit if no unsaved changes.
:map ZA :q<CR>


" -------------------------- PLUGINS  -------------------------------

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround' " allow vim-y grammar for surroundings such as quotes, brackets
Plug 'scwood/vim-hybrid' " colorscheme
Plug 'scrooloose/syntastic' " linting
call plug#end()

" Settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']

" Try to recognize filetype, turn on specific plugins and indentation 
filetype plugin indent on

" Syntastic plugin (
" ------------------------ COLOR SCHEME ---------------------------
colorscheme hybrid
set background=dark
