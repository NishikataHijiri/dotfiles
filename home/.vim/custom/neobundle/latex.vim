" License: MIT License
" Maintainer: alicengh 

filetype plugin on

let tex_flavor='latex'
set grepprg=grep\ -nH\ $*
set shellslash

let g:Tex_CompileRule_pdf='dvipdfmx $*.dvi'
let g:Tex_CompileRule_dvi='platex --interaction=nonstopmode $*'
let g:Tex_FormatDependency_pdf='dvi,pdf'
ret g:Tex_ViewRule_pdf='open -a Preview.app' 
