" Maintainer: alicengh
" Last Modified: 2015-08-31T20:44:24

" NOTE: Skip initialization for vim-tiny or vim-small
if 0 | endif

" NOTE: Neo-vim setting
" let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'
 
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
" NeoBundle 'vim-scripts/dbext.vim'

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

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'tomtom/tcomment_vim'

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
 
call neobundle#end()

" Required:
filetype indent on
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

""" END neobundle.vim """


""" NeoBundle configuration """
""" Release autogroup in CustomAutoCmd
augroup CustomAutoCmd
   autocmd!
augroup END
 

""" NeoCompletion """
" Basic config.
let s:hooks = neobundle#get_hooks("neocomplete.vim")
function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup                           = 0
    let g:neocomplete#sources#syntax#min_keyword_length = 3
    let g:neocomplete#enable_at_startup                 = 1
    let g:neocomplete#auto_completion_start_length      = 3
    let g:neocomplete#enable_ignore_case                = 1
    let g:neocomplete#enable_smart_case                 = 1
    let g:neocomplete#enable_camel_case                 = 1
    let g:neocomplete#use_vimproc                       = 1
    let g:neocomplete#sources#buffer#cache_limit_size   = 1000000
    let g:neocomplete#sources#tags#cache_limit_size     = 30000000
    let g:neocomplete#enable_fuzzy_completion           = 1
    let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'

    let g:neocomplete#sources#dictionary#dictionaries = {
                    \ 'default': '',
                    \ 'vimshell': $HOME.'/.vimshell_hist',
                    \ 'scheme'  : $HOME.'/.gosh_completions'
                    \}

    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'
endfunction
 

" Enable omni completion.
autocmd FileType css            setlocal omnifunc = csscomplete#CompleteCSS
" autocmd FileType python         setlocal omnifunc = pythoncomplete#Complete
autocmd FileType xml            setlocal omnifunc = xmlcomplete#CompleteTags
autocmd FileType html,markdown  setlocal omnifunc = htmlcomplete#CompleteTags
" autocmd FileType javascript     setlocal omnifunc = javascriptcomplete#CompleteJS

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::' 
let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*' 

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
" Tell Neosnippet about the other snippets
" let g:neosnippet#snippets_directory = '~/.vim/bundle/vim-snippets/snippets'
""" END: NeoCompletion """



""" Unite.vim """
let g:unite_enable_start_insert   = 1
let g:vinarise_enable_auto_detect = 1
""" END: Unite.vim """



""" VimFiler """
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
""" END: VimFiler """



""" EmmetVim """
let g:use_emmet_complete_tag = 1
let g:user_emmet_settings = {
            \ 'lang' : 'en',
            \ 'html' : {
            \   'filters' : 'html',
            \ },
            \ 'css' : {
            \   'filters' : 'fc',
            \ },
            \ 'php' : {
            \   'extends' : 'html',
            \   'filters' : 'html',
            \ },
            \}
let g:user_emmet_leader_key = '<C-z>'

augroup EmmetVim
    autocmd!
    autocmd FileType html,css,php let g:user_emmet_settings.indentation = '   '[:&tabstop]
augroup END
""" END: EmmetVim """ 



""" QuickRun """
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
    let g:quickrun_config = {
             \	"_" : {
             \ "outputter/buffer/split" : "botright 10sp",
             \ "outputter/buffer/close_on_empty" : 1,
             \ "runner" : "vimproc",
             \ "runner/vimproc/updatetime" : 60
             \ },
             \}

    let g:quickrun_config.tex = {'command' : 'autolatex'}
    let g:quickrun_config.python = {'command' : 'python3'}

    let g:quickrun_config['html'] = {
                \ 'command': 'open',
                \ 'exec' : '%c %s',
                \ 'outputter' : 'browser'
                \ }


    if executable("clang++")
       let g:syntastic_cpp_compiler = 'clang++'
       let g:syntastic_cpp_compiler_options = '--std=c++1y --stdlib=libc++'

       let g:quickrun_config['cpp/clang++14'] = {
                \ 'type': 'cpp/clang++',
                \ 'cmdopt': '--std=c++14 --stdlib=libc++',
                \}

       let g:quickrun_config['cpp'] = {'type': 'cpp/clang++14'}
    endif
endfunction
""" END: QuickRun """



""" Template """
autocmd CustomAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%m-%d-%Y')/g
    silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction

autocmd CustomAutoCmd User plugin-template-loaded
            \   if search('<+CURSOR+>')
            \ |     silent! execute 'normal! "_da>'
            \ | endif
""" END: Template """



""" jedi-vim: python support """
let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
    let g:jedi#auto_vim_configuration =  0
    let g:jedi#rename_command = '<Leader>R'
    let g:jedi#goto_command = '<Leader>G'
    let g:jedi#completions_enabled=0
    let g:jedi#popup_on_dot = 1
    let g:jedi#auto_initialization = 1
    autocmd CustomAutoCmd FileType python setlocal omnifunc=g:jedi#auto_initialization#complete
    autocmd CustomAutoCmd FileType python let b:did_ftplugin = 1
endfunction

autocmd CustomAutoCmd FileType python setlocal completeopt-=preview
""" END: jedi-vim: python support """ 
""" END: NeoBundle configuration """"
