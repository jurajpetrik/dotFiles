" -------------------------- PLUGINS  -------------------------------
call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-surround' " allow vim-y grammar for surroundings such as quotes, brackets
Plug 'scrooloose/syntastic' " linting
Plug 'tpope/vim-repeat' " make plugin actions repeatable with the dot key
Plug 'tpope/vim-commentary' " add motion for commenting
Plug 'craigemery/vim-autotag' " generate ctags on file save
Plug 'ctrlpvim/ctrlp.vim' "fuzzy finder
Plug 'tpope/vim-sensible' "a sensible sets of vim defaults (almost) everyone can agree on
Plug 'christoomey/vim-tmux-navigator' " vim + tmux = <3

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion
Plug 'ervandew/supertab'

" JS plugins
Plug 'heavenshell/vim-jsdoc' , { 'for': ['javascript', 'javascript.jsx']} " jsdoc generator
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx']} " better js syntax highlighting

Plug 'sheerun/vim-json' " JSON syntax
Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'tpope/vim-fugitive' " git wrapper
Plug 'craigemery/vim-autotag'
Plug 'scwood/vim-hybrid' " colorscheme
Plug 'morhetz/gruvbox' " colorscheme
" airline plugins
Plug 'vim-airline/vim-airline' " status bar
Plug 'vim-airline/vim-airline-themes' 
Plug 'edkolev/tmuxline.vim' " configure tmux status bar to be like vim airline. Is this magic?
" /airline plugins

Plug 'lilydjwg/colorizer' " color html color codes
" Plug 'janko-m/vim-test' " test suite runner
call plug#end()

source ~/.vim/custom/folds.vim

" let test#strategy = "basic" " run tests in neovim :terminal buffer
" let test#javascript#runner = 'mocha'
" let test#javascript#mocha#executable = 'NODE_ENV=localTest mocha --recursive test/bootstrap.test.js'

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'y'    : '#S'}


let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'jellybeans'

"tmux + vim seamless navigation with Alt+<hjkl>
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <A-j> :TmuxNavigateDown<cr>
nnoremap <silent> <A-k> :TmuxNavigateUp<cr>
nnoremap <silent> <A-l> :TmuxNavigateRight<cr>
nnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>
vnoremap <silent> <A-h> :TmuxNavigateLeft<cr>
vnoremap <silent> <A-j> :TmuxNavigateDown<cr>
vnoremap <silent> <A-k> :TmuxNavigateUp<cr>
vnoremap <silent> <A-l> :TmuxNavigateRight<cr>
vnoremap <silent> <A-\> :TmuxNavigatePrevious<cr>

" DEOPLETE
let g:deoplete#enable_at_startup = 1
" Path completion from buffer directory not pwd
let g:deoplete#file#enable_buffer_path = 1
let g:deoplete#omni#functions = {}
let g:deoplete#omni#functions.javascript = [
      \ 'tern#Complete',
      \ 'jspc#omni'
 \]

" automatically close preview window of deoplete once chose sth
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" /DEOPLETE

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
let g:syntastic_loc_list_height = 5
let g:syntastic_javascript_checkers = ['eslint'] " Use eslint for javascript

" Settings for Syntastic
let g:airline_powerline_fonts = 1
set noshowmode
" -------------------------- PLUGINS  -------------------------------
set termguicolors

" color scheme 
colorscheme gruvbox
set background=dark

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
" set Leader key to spacebar
let mapleader = "\<Space>"

" Leader+enter 'full-screen' current split
" TODO: when hit again, go back to original layout
nnoremap <silent> <Leader><CR> :only<CR>
" backtick is taken by tmux
nnoremap '' ``

" indent after pasting!
nnoremap p p=`]
nnoremap P P=`]

command! EditTmux e ~/.tmux.conf
command! EditZsh e ~/.zshrc
command! EditVim e ~/.config/nvim/init.vim
command! EditGitConfig e ~/.gitconfig
command! EditGitIgnore e ~/.gitignore

" delete from cursor position to end of line
inoremap <C-d> <Esc>lDa

nnoremap gs :Gstatus<CR>

nnoremap K a<CR><Esc>
nnoremap <silent> <Leader>t :vsplit<CR>:terminal<CR>

:tnoremap <Esc> <C-\><C-n>
:tnoremap <A-h> <C-\><C-n><C-w>h
:tnoremap <A-j> <C-\><C-n><C-w>j
:tnoremap <A-k> <C-\><C-n><C-w>k
:tnoremap <A-l> <C-\><C-n><C-w>l

nnoremap <A-H> <C-W>H
nnoremap <A-J> <C-W>J
nnoremap <A-K> <C-W>K
nnoremap <A-L> <C-W>L

" edit this file in a split
nnoremap <Leader>er <Esc>:vsplit $MYVIMRC<CR>
" source vimrc
nnoremap <Leader>r :source $MYVIMRC<CR> :echo "Sourced config file"<CR>

"move line up
" nnoremap - ddkP==
"move line down
nnoremap _ ddp==

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
nnoremap <Leader>o o<Esc>k

" Ctrl + O insert new line above, stay in normal mode
nnoremap <Leader>O O<Esc>j

" ctrl-s to write file
nnoremap <C-s> :w<CR>

" Leader + Escape, clear search highlighting
nnoremap <silent> <Leader><Esc> :noh<CR>
vnoremap <silent> <Leader><Esc> :noh<CR>

" Leader + v, open vertical split
nnoremap <Leader>v :vnew<CR>
nnoremap <Leader>. :vnew<CR>

" Leader + b, open horizontal split
nnoremap <Leader>b :new<CR>
nnoremap <Leader>, :vnew<CR>
" commented cause fucks up: cd src/..
" ca src source $MYVIMRC

" go to previous, next location bindings. (useful for syntastic plugin, jump
" to the next/prev error)
nnoremap <Leader>n :lnext<CR>
nnoremap <Leader>N :lprev<CR>

" last open buffer
nnoremap <Leader>l :b#<CR>

inoremap (  ()<Left>
inoremap {  {}<Left>
inoremap "  ""<Left>
inoremap '  ''<Left>
inoremap [  []<Left>

" in insert mode, write moduleName ,then Ctrl + e(xpand) 
" =>  const moduleName = require('moduleName');
inoremap <c-e> <Esc>0"sywiconst <Esc>A = require("<Esc>"spa");<Esc>0we

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

" AUTOCMDs 

"Remember last cursor position between file closes
augroup cursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
augroup END

fun! TrimWhitespace()
  " Don't strip files where trailing whitespace is significant. For now just
  " markdown
  if &ft =~ 'markdown'
    return
  endif
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

" trim trailing whitespace on filesave
augroup trimWhitespace
  autocmd!
  autocmd BufWritePre * :call TrimWhitespace()
augroup END
