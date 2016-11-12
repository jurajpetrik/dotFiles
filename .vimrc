" -------------------------  PLUGINS  -------------------------------
call plug#begin('~/.vim/plugged')
Plug 'jurajpetrik/vim-surround' " allow vim-y grammar for surroundings such as quotes, brackets
Plug 'tpope/vim-repeat' " make plugin actions repeatable with the dot key
Plug 'tpope/vim-commentary' " add motion for commenting
Plug 'craigemery/vim-autotag' " generate ctags on file save
Plug 'ctrlpvim/ctrlp.vim' "fuzzy finder
Plug 'christoomey/vim-tmux-navigator' " vim + tmux = <3

Plug 'Shougo/doplete.nvim', { 'do': ':UpdateRemotePlugins' } " completion

" JS plugins
Plug 'heavenshell/vim-jsdoc' , { 'for': ['javascript', 'javascript.jsx']} " jsdoc generator
Plug 'pangloss/vim-javascript', { 'for': ['javascript', 'javascript.jsx']} " better js syntax highlighting

Plug 'sheerun/vim-json' " JSON syntax
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern',  'for': ['javascript', 'javascript.jsx'] }
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
Plug 'neomake/neomake', { 'on': ['Neomake'] } " linter
Plug 'milkypostman/vim-togglelist' "Function to toggle location/quickfix list
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree'
call plug#end()

source ~/.vim/custom/folds.vim
source ~/.vim/custom/deoplete-settings.vim
source ~/.vim/custom/neomake-settings.vim
source ~/.vim/custom/mdn-docs.vim

" close vim if last open window is NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" let test#strategy = "basic" " run tests in neovim :terminal buffer
" let test#javascript#runner = 'mocha'
" let test#javascript#mocha#executable = 'NODE_ENV=localTest mocha --recursive test/bootstrap.test.js'

" Enable jsdoc syntax highlighting, courtesy of pangloss/vim-javascript plugin
let g:javascript_plugin_jsdoc = 1

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

"make ctrlP ignore gitfiles
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

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

" ---------------------- MAPPINGS --------------------------

" set Leader key to spacebar
let mapleader = " "

" When jump to next match also center screen
nnoremap n nzz
nnoremap N Nzz
vnoremap n nzz
vnoremap N Nzz

" and when jumping to a tag
nnoremap <c-]> <c-]>zz
vnoremap <c-]> <c-]>zz

" Same when moving up and down
nnoremap <C-u> <C-u>zz
nnoremap <C-d> <C-d>zz
nnoremap <C-f> <C-f>zz
nnoremap <C-b> <C-b>zz
vnoremap <C-u> <C-u>zz
vnoremap <C-d> <C-d>zz
vnoremap <C-f> <C-f>zz
vnoremap <C-b> <C-b>zz

" And when cycling through movement history
nnoremap <C-o> <C-o>zz
vnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-o>zz
vnoremap <C-i> <C-o>zz

" and get rid of fucking useless 'hold space to move cursor left'
nnoremap <Space> <nop>
vnoremap <Space> <nop>

nnoremap <CR> <nop>
vnoremap <CR> <nop>

nnoremap <c-t> :TagbarToggle<CR>
nnoremap <C-n> :NERDTreeToggle<CR>

" Leader+enter 'full-screen' current split
nnoremap <silent> <Leader><CR> <c-w>T

" indent after pasting! TODO: fix for pasting less than full line
nnoremap p p=`]
nnoremap P P=`]

command! EditTmux e ~/.tmux.conf
command! EditZsh e ~/.zshrc
command! EditVim e ~/.config/nvim/init.vim
command! EditGitConfig e ~/.gitconfig
command! EditGitIgnore e ~/.gitignore

command! JsonFormat %!python -m json.tool

" delete from cursor position to end of line
inoremap <C-d> <Esc>lDa

nnoremap gs :Gstatus<CR>

nnoremap K i<CR><Up><Esc>$
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
nnoremap <silent> <Leader>er :call OpenSmartSplit($MYVIMRC)<cr>
" source vimrc
nnoremap <Leader>r :source $MYVIMRC<CR> :echom "Sourced config file"<CR>
nnoremap <c-r> :source $MYVIMRC<CR> :echom "Sourced config file"<CR>

"move line up
" nnoremap - ddkP==
"move line down
" nnoremap _ ddp==

" get rid of that pesky typo
" nnoremap q: <nop>

nnoremap , :
vnoremap , :

nnoremap : ,
vnoremap : ,

" same think for moving through change list: last edit location
nnoremap g: g,
vnoremap g: g,

" double slash to search for visually selected text
vnoremap // y/<C-R>" <CR>

" make Y yank to the end of line, consistent with C,D (change, delete)
nnoremap Y y$

" Ctrl + o insert new line below, stay in normal mode
nnoremap <Leader>o o<Esc>k

" Ctrl + O insert new line above, stay in normal mode
nnoremap <Leader>O O<Esc>j

" ctrl-s to write buffer
nnoremap <C-s> :w<CR>
" ctrl-c to close buffer
nnoremap <C-c> :q<CR>

" Leader + Escape, clear search highlighting
nnoremap <silent> <Leader><Esc> :noh<CR>
vnoremap <silent> <Leader><Esc> :noh<CR>
"
nnoremap <silent> <Leader>s :call OpenSmartSplit()<CR>
"
" " Leader + v, open vertical split
" " nnoremap <Leader>v :vnew<CR>
" " nnoremap <Leader>. :vnew<CR>
"
" " Leader + b, open horizontal split
" nnoremap <Leader>b :new<CR>
" nnoremap <Leader>, :vnew<CR>

" in insert mode, write moduleName ,then Ctrl + e(xpand)
" =>  const moduleName = require('moduleName');
inoremap <c-e> <Esc>0"sywiconst <Esc>A = require("<Esc>"spa");<Esc>0we

" choose buffer
nnoremap gb :CtrlPBuffer<CR>
nnoremap gf :CtrlP<CR>
nnoremap gr :CtrlPMRU<CR>
" nnoremap gt :CtrlPTag<CR>

" last open buffer
nnoremap gl :b#<CR>

nnoremap <c-p> :CtrlPMixed<CR>

" s to surround
nmap s  <Plug>Ysurround
nmap ss <Plug>Yssurround
nmap S  <Plug>YSurround
nmap SS <Plug>YSSurround

" ================ FUNCTIONs =======================
"
" returns the if active window's width is bigger than its height
function! IsActiveWindowLandscape()
  : let l:width = str2float(winwidth(0))
  : let l:height = str2float(winheight(0))
  : let l:ratio = l:width / l:height

  : if l:ratio > 2.3 " this threshold ratio was chosen by trying which dimensions I wanted to open vertical/horizontal split
  :   return 1
  : endif
endfunction

" open vertical/horizontal split depending on window dimensionions
" if passed file name then open that in the split, else empty split
function! OpenSmartSplit(...)
:  if IsActiveWindowLandscape()
:    if !a:0
:      vnew
:    else
:      execute 'vsplit ' . a:1
:    endif
:   else
:    if !a:0
:      new
:    else
:      execute 'split ' . a:1
:    endif
:  endif
endfunction

" ================ / FUNCTIONs =======================

" ================ AUTOCMDs =======================
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

augroup bracketsAutocompletetion
  autocmd!
  autocmd filetype javascript,vim inoremap ( ()<Left>
  autocmd filetype javascript,vim inoremap { {}<Left>
  autocmd filetype javascript inoremap " ""<Left>
  autocmd filetype javascript,vim inoremap ' ''<Left>
  autocmd filetype javascript,vim inoremap [ []<Left>

augroup END
" ============== /AUTOCMDs =============
