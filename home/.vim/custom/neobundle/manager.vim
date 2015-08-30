" Maintainer: alicengh


" NOTE: Skip initialization for vim-tiny or vim-small
if 0 | endif

" NOTE: Neo-vim setting
if has('vim_starting')
  if &compatible
    " Be iMproved
    set nocompatible
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'Townk/vim-autoclose'

NeoBundle 'Shougo/neomru.vim', {
            \ 'depends' : 'Shougo/unite.vim'
            \ }

NeoBundle 'Shougo/vimproc', {
            \ 'build' : {
            \   'mac' : 'make -f make_mac.mak',
            \   'unix' : 'make -f make_unix.mak',
            \ }}

""" NeoCompletion """
if has('lua')
    NeoBundle 'Shougo/neco-syntax'
    NeoBundle 'Shougo/neoinclude.vim'
    NeoBundle 'Shougo/neosnippet-snippets'
   
    NeoBundleLazy 'Shougo/neocomplete.vim', {
                \ 'depends' : 'Shougo/vimproc',
                \ 'autoload' : { 'insert' : 1, }
                \ }

    NeoBundleLazy 'Shougo/neosnippet', {
                \ 'depends' : 'Shougo/neosnippet-snippets',
                \ 'autoload' : {
                \   'insert' : 1,
                \   'filetype' : 'snippet',
                \ }}
endif
""" END: NeoCompletion """ 

NeoBundleLazy 'Shougo/vimshell', {
            \ 'depends' : 'Shougo/vimproc',
            \ 'autoload' : {
            \   'commands' : [{ 'name' : 'VimShell', 
            \                   'complete' : 'customlist,vimshell#complete' },
            \                   'VimShellExecute', 'VimShellInteractive',
            \                   'VimShellTerminal', 'VimShellPop'],
            \ 'mappings' : ['<Plug>(vimshell_switch)']
            \ }}

NeoBundleLazy 'Shougo/vimfiler', {
            \ 'depends' : ['Shougo/unite.vim'],
            \ 'autoload' : {
            \   'commands' : [ "VimFilerTab", "VimFiler", 
            \                  "VimFilerExplorer", "VimFilerBufferDir" ],
            \   'mappings' : ['<Plug>(vimshell_switch)'],
            \   'explorer' : 1,
            \ }}

NeoBundleLazy 'tpope/vim-endwise', {
            \ 'autoload' : { 'insert' : 1, }
            \ }

call neobundle#end()

" Required:
filetype indent on
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""" END neobundle.vim """
