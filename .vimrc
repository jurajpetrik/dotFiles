source ~/.vim/custom/folds.vim
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
Plug 'ctrlpvim/ctrlp.vim' "fuzzy finder
Plug 'tpope/vim-sensible' "a sensible sets of vim defaults (almost) everyone can agree on
Plug 'christoomey/vim-tmux-navigator' " vim + tmux = <3
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'tpope/vim-fugitive' " git wrapper
Plug 'craigemery/vim-autotag'
call plug#end()

"tmux + vim seamless navigation with Alt+<hjkl>
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>

" use deoplete
let g:deoplete#enable_at_startup = 1
" automatically close preview window of deoplete once chose sth
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

"make ctrlP ignore gitfiles
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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
let g:airline_powerline_fonts = 1
set noshowmode
" -------------------------- PLUGINS  -------------------------------

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" toggle invisible characters
set list

" set terminal title to the name of the file
set title

" use system clipboard by default
set clipboard^=unnamedplus,unnamed

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

" open new split panes to the right and top
set nosplitbelow
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
"move line up
nnoremap - ddkP==
"move line down
nnoremap _ ddp==

" set Leader key to spacebar
let mapleader = "\<Space>"

" get rid of that pesky typo
nnoremap q: :q

nnoremap ; :
vnoremap ; :

nnoremap : ;
vnoremap : ;

" double slash to search for visually selected text
vnoremap // y/<C-R>" <CR>

" make Y yank to the end of line, consistent with C,D (change, delete)
nnoremap Y y$
" make V and vv work analagous to C,cc ; D, dd;
nnoremap V v$
nnoremap vv V

" Ctrl + o insert new line below, stay in normal mode
nnoremap <Leader>o o<Esc>

" Ctrl + O insert new line above, stay in normal mode
nnoremap <Leader>O O<Esc>

" ctrl-s to write file
nnoremap S :w<CR>

" Leader + Escape, clear search highlighting
nnoremap <silent> <Leader><Esc> :noh<CR>

" Leader + v, open vertical split
nnoremap <Leader>v :vnew<CR>
" Leader + s, open horizontal split
nnoremap <Leader>b :new<CR>

"Leader + r, source vimrc
nnoremap <Leader>r :source $MYVIMRC<CR> :echo "Sourced config file"<CR>
ca src source $MYVIMRC

" go to previous, next location bindings. (useful for syntastic plugin, jump
" to the next/prev error)
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>N :lprev<CR>

" last open buffer
nnoremap <Leader>l :b#<CR>

inoremap (  ()<Esc>hli
inoremap {  {<CR><CR>}<Esc>ki

" choose buffer
nnoremap gb :CtrlPBuffer<CR>
nnoremap gf :CtrlP<CR>
nnoremap gr :CtrlPMRU<CR>
nnoremap gt :CtrlPTag<CR>

" last open buffer
nnoremap gl :b#<CR>

nnoremap <c-p> :CtrlPMixed<CR>

" s to surround
nnoremap s <Plug>Ysurround

" ------------------------ COLOR SCHEME ---------------------------
colorscheme hybrid
set background=dark
" ------------------------ COLOR SCHEME ---------------------------

"Remember last cursor position between file closes
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
