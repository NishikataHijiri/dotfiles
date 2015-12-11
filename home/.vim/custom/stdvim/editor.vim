" License: MIT 
" Maintainer: alice

""" Color setting """
syntax on
set t_Co=256
colorscheme pablo
 

""" Motion control """
set shiftround
set infercase
set hidden
set switchbuf=useopen
set virtualedit=block


""" Document support """
set wrap
set number
set title
set textwidth=0
set background=dark
set cursorline
hi clear CursorLine
hi CursorLineNr term=bold cterm=NONE ctermfg=120 ctermbg=NONE


""" Programming support """
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4

set ambiwidth=double
if has('path_extra')
    set tags& tags+=.tags,tags
endif


""" Searching control """
set incsearch
set hlsearch
nnoremap <ESC><ESC> :nohlsearch<CR>

set smartcase
set ignorecase
set wrapscan
set showmatch


""" Others """
set complete+=k
set display=lastline
set clipboard=unnamed,autoselect

set wildmenu
set wildmode=list:full
set wildignore=*.o,*.obj,*.pyc,*.so,*.dll

set noerrorbells
set visualbell t_vb=


""" Encoding customize """
set encoding=utf-8


""" Manage plural fils """
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]B :blast<CR>
nnoremap <silent> [B :bfirst<CR>

nnoremap <silent> mn :next<CR>
nnoremap <silent> mp :prev<CR>



""" Tab motion """
nnoremap <silent> te :tabedit<CR>
nnoremap <silent> tc :tabclose<CR>



""" Motion commands """
imap <C-a> <Esc>0i
imap <C-e> <Esc>$i<Right>
imap <C-v> <Esc>p
inoremap <silent> qq <ESC>



""" My vim faster editation cmd """
cmap w!! w !sudo tee > /dev/null %
nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR> :source $MYVIMRC<CR>
 
""" END: mapping.vim """
