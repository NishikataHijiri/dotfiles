" Maintainer:  Nishikata Hijiri
" Last Modified: 2015-02-17T14:36:45

nnoremap <F5> :<C-u>tabedit $MYVIMRC<CR>
            \ :source $MYVIMRC<CR>

cmap w!! w !sudo tee > /dev/null %
nnoremap <expr> j "gj"
nnoremap <expr> k "gk"
vnoremap <expr> v "$h"
