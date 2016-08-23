" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" toggle invisible characters
set list

" set terminal title to the name of the file
set title

" use system clipboard by default
set clipboard=unnamedplus,unnamed

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" don't redraw when executing macros
set nolazyredraw 

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

" make Y yank to the end of line, consistent with C,D (change, delete)
nnoremap Y y$

" Ctrl + o insert new line below, stay in normal mode
nmap <Leader>o o<Esc>

" Ctrl + O insert new line above, stay in normal mode
nmap <Leader>O O<Esc>


" go to previous, next location bindings. (useful for syntastic plugin, jump
" to the next/prev error)
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>N :lprev<CR>

" Ctrl+p to search for files
map <C-p> [unite]p

" -------------------------- PLUGINS  -------------------------------

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround' " allow vim-y grammar for surroundings such as quotes, brackets
Plug 'scwood/vim-hybrid' " colorscheme
Plug 'scrooloose/syntastic' " linting
Plug 'tpope/vim-repeat' " make plugin actions repeatable with the dot key
Plug 'tpope/vim-commentary' " add motion for commenting
Plug 'heavenshell/vim-jsdoc' " jsdoc generator
Plug 'pangloss/vim-javascript', { 'for': 'javasript' } " better js syntax highlighting
Plug 'vim-airline/vim-airline' " status bar
Plug 'craigemery/vim-autotag' " generate ctags on file save

Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'Shougo/unite.vim'
Plug 'rstacruz/vim-fastunite'

Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite-outline'
Plug 'tsukkee/unite-tag'
Plug 'tpope/vim-sensible'
call plug#end()

" Settings for Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_javascript_checkers = ['eslint'] " Use eslint for javascript
" Settings for Syntastic

" Settings for airline
if !exists('g:airlinesymbols')
  let g:airlinesymbols = {}
endif
let g:airlineleftsep = '»'
let g:airlineleftsep = '?'
let g:airlinerightsep = '«'
let g:airlinerightsep = '?'
let g:airlinesymbols.linenr = '?'
let g:airlinesymbols.linenr = '?'
let g:airlinesymbols.linenr = '¶'
let g:airlinesymbols.branch = '? '
let g:airlinesymbols.paste = '?'
let g:airlinesymbols.paste = 'Þ'
let g:airlinesymbols.paste = '?'
let g:airlinesymbols.whitespace = '?'

" Settings for airline

" -------------------------- PLUGINS  -------------------------------


" ------------------------ COLOR SCHEME ---------------------------
colorscheme hybrid
set background=dark
" ------------------------ COLOR SCHEME ---------------------------

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif
