vnoremap // y/<C-R>"<CR>

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

"indent sutff
filetype plugin indent on

" show existing tab with 2 spaces width
set tabstop=2

" when indenting with '>', use 2 spaces width
set shiftwidth=2

" use tabs not spaces for indenting
set noexpandtab

" display line numbers
set number

"turn on syntax highlighting
syntax on

"pick a color scheme
colorscheme desert

" ---------------------- CUSTOM KEYBINDING --------------------------
"
" ctrl+J to split a line
:nnoremap <NL> i<CR><ESC>

" ZA to exit if no unsaved changes.
:map ZA :q<CR>

