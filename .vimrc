" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Show the first match for the search pattern while you're still typing it
set incsearch

" delete spaces 2 at a time in insert mode.
set softtabstop=2

" show existing tab with 2 spaces width
set tabstop=2

" indent in normal mode inserts 2 spaces
set shiftwidth=2

" use spaces, not tabs for indentation :'-(
set expandtab

" display line numbers
set number

" display relative line numbers
set relativenumber

" turn on syntax highlighting
syntax on

" open new split panes to the right and bottom
set splitbelow
set splitright

" Maintain undo history between sessions (file closed, opened again)
set undofile

" Create these folders if they don't exist, otherwise vim won't use them. And
" don't complain if they already exist.
silent !mkdir ~/.vim/undodir ~/.vim/backupdir ~/.vim/directory > /dev/null 2>&1

" Save undo history in this specific folder so as not to pollute
set undodir=~/.vim/undodir

" Set directories for backup and .swp files so vim doesn't pollute project scope
set backupdir=~/.vim/backupdir
set directory=~/.vim/directory

" ---------------------- CUSTOM KEYBINDING --------------------------

" set Leader key to spacebar
let mapleader = "\<Space>"

" double slash to search for visually selected text
vnoremap // y/<C-R>" <CR>

" leader + esc to clear search highlighting
nnoremap <Leader><Esc> :noh<CR>
" -------------------------- PLUGINS  -------------------------------

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround' " allow vim-y grammar for surroundings such as quotes, brackets
Plug 'scwood/vim-hybrid' " colorscheme
Plug 'scrooloose/syntastic' " linting
Plug 'tpope/vim-repeat' " make plugin actions repeatable with the dot key
Plug 'heavenshell/vim-jsdoc' " jsdoc generator
call plug#end()

" Settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint'] " Use eslint for javascript

" Try to recognize filetype, turn on specific plugins and indentation 
filetype plugin indent on

" Syntastic plugin (
" ------------------------ COLOR SCHEME ---------------------------
colorscheme hybrid
set background=dark
