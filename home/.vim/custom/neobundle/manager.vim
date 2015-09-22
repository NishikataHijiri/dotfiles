" Maintainer: alicengh
" Last Modified: 2015-08-31T20:44:24


" NOTE: Skip initialization for vim-tiny or vim-small
if 0 | endif

" NOTE: Neo-vim setting
let s:noplugin        = 0
let s:bundle_root     = expand('~/.vim/bundle')
let s:neobundle_root  = s:bundle_root . '/neobundle.vim'
 
if has('vim_starting')
    if &compatible
        " Be iMproved
        set nocompatible
    endif

    " Required:
    " set runtimepath+=~/.vim/bundle/neobundle.vim/
    execute "set runtimepath+=" . s:neobundle_root 
endif

" Required:
call neobundle#begin(s:bundle_root)

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'tyru/caw.vim.git'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'scrooloose/nerdtree'

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

" QuickRun plug-in
NeoBundleLazy "thinca/vim-quickrun", {
            \ "autoload": {
            \   "mappings": ['nxo', '<Plug>(quickrun)'],
            \}}


" web development env
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'autoload' : {
            \   'filetypes' : 
            \       ['html', 'html5', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee'],
            \   'commands' : ['<Plug>ZenCodingExpandNormal']
            \ }}

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'tyru/caw.vim.git'

NeoBundle "thinca/vim-template"

NeoBundleLazy "sjl/gundo.vim", {
            \ "autoload": {
            \   "commands": ['GundoToggle'],
            \}}

NeoBundleLazy "vim-scripts/TaskList.vim", {
            \ "autoload": {
            \   "mapoings": ['<Plug>TaskList'],
            \}}

NeoBundle 'marijnh/tern_for_vim', {
    \ 'build': {
    \   'others': 'npm install'
    \}}

" Ruby and Rails settings
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'

NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'nathanaelkane/vim-indent-guides'

NeoBundleLazy "lambdalisue/vim-django-support", {
            \ "autoload": {
            \   "filetype": ["python", "python3", "djangohtml"]
            \ }}

NeoBundleLazy 'davidhalter/jedi-vim', {
            \ "autoload": {
            \   "filetype": ["python", "python3", "djangohtml"],
            \ }, 
            \ "build": {
            \   "mac": "pip install jedi",
            \   "unix": "pip install jedi",
            \ }}

" clang-support
NeoBundle 'justmao945/vim-clang'
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'kana/vim-operator-user'
NeoBundle 'rhysd/vim-clang-format'
 
call neobundle#end()

" Required:
filetype indent on
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""" END neobundle.vim """
