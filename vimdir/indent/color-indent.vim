" Maintainer: Nishikata Hijiri
" Last Modified: 2015-02-24T15:22:45
"
let g:indent_guides_auto_colors=0

autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd   ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=233

let g:indent_guides_guide_size=1
let g:indent_start_level=2
let g:indent_guides_enable_on_vim_startup=1
