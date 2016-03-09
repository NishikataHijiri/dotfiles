" License: MIT
" Maintainer: alice

""" Release autogroup in CustomAutoCmd
augroup CustomAutoCmd
   autocmd!
augroup END


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
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'itchyny/lightline.vim'

NeoBundle 'gregsexton/gitv'
NeoBundle 'tpope/vim-fugitive'
" NeoBundle 'Townk/vim-autoclose'


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
    " NeoBundle 'Shougo/neco-syntax'
    " NeoBundle 'Shougo/neosnippet-snippets'
   
    " NeoBundleLazy 'Shougo/neocomplete.vim', {
    "             \ 'depends' : 'Shougo/vimproc',
    "             \ 'autoload' : { 'insert' : 1, }
    "             \ }

    " NeoBundleLazy 'Shougo/neosnippet', {
    "             \ 'depends' : 'Shougo/neosnippet-snippets',
    "             \ 'autoload' : {
    "             \   'insert' : 1,
    "             \   'filetype' : 'snippet',
    "             \ }}
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

" Clang-support 
" NeoBundle 'justmao945/vim-clang'
" NeoBundle 'Rip-Rip/clang_complete'
" NeoBundle 'kana/vim-operator-user'
" NeoBundle 'rhysd/vim-clang-format'

" Apple Swift
NeoBundle 'toyamarinyon/vim-swift'
 
call neobundle#end()

" Require" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
""" END neobundle.vim """



""" NeoCompletion """
" Basic config.
" let s:hooks = neobundle#get_hooks("neocomplete.vim")
" function! s:hooks.on_source(bundle)
"     let g:acp_enableAtStartup                           = 0
"     let g:neocomplete#sources#syntax#min_keyword_length = 3
"     let g:neocomplete#enable_at_startup                 = 1
"     let g:neocomplete#auto_completion_start_length      = 3
"
"     let g:neocomplete#enable_ignore_case                = 1
"     let g:neocomplete#enable_smart_case                 = 1
"     let g:neocomplete#enable_camel_case                 = 1
"     let g:neocomplete#enable_auto_select                = 0
"
"     let g:neocomplete#use_vimproc                       = 1
"     let g:neocomplete#sources#buffer#cache_limit_size   = 1000000
"     let g:neocomplete#sources#tags#cache_limit_size     = 30000000
"     let g:neocomplete#enable_fuzzy_completion           = 1
"     let g:neocomplete#lock_buffer_name_pattern          = '\*ku\*'
"
"     let g:neocomplete#sources#dictionary#dictionaries = {
"                     \ 'default': '',
"                     \ 'vimshell': $HOME.'/.vimshell_hist',
"                     \ 'scheme'  : $HOME.'/.gosh_completions'
"                     \}
"
"     if !exists('g:neocomplete#keyword_patterns')
"         let g:neocomplete#keyword_patterns = {}
"     endif
"     let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" endfunction
 

" Enable omni completion.
autocmd FileType css    setlocal omnifunc = csscomplete#CompleteCSS
autocmd FileType xml    setlocal omnifunc = xmlcomplete#CompleteTags
autocmd FileType html   setlocal omnifunc = htmlcomplete#CompleteTags
" autocmd FileType python         setlocal omnifunc = pythoncomplete#Complete
" autocmd FileType javascript     setlocal omnifunc = javascriptcomplete#CompleteJS

" Enable heavy omni completion.
" if !exists('g:neocomplete#sources#omni#input_patterns')
"   let g:neocomplete#sources#omni#input_patterns = {}
" endif
"
"
" let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
" let g:neocomplete#sources#omni#input_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)'
" let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::' 

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
" let g:neosnippet#enable_snipmate_compatibility = 1
" This setting for Default snippets makes disabled 
" let g:neosnippet#disable_runtime_snippets = {'_' : 1}

" let g:neosnippet#snippets_directory = []
" Tell Neosnippet about the other snippets
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
    let g:jedi#completions_enabled = 0
    let g:jedi#popup_on_dot = 1
    let g:jedi#popup_select_first = 0
    let g:jedi#auto_initialization = 1
    autocmd CustomAutoCmd FileType python setlocal omnifunc=g:jedi#auto_initialization#complete
    autocmd CustomAutoCmd FileType python let b:did_ftplugin = 1
endfunction

" if ! empty(neobundle#get("neocomplete.vim"))
"   autocmd CustomAutoCmd FileType python setlocal completeopt-=preview
" endif
""" END: jedi-vim: python support """ 



" " """ Clang Completion Tools """
" """ clang_complete """
" " disable auto completion for vim-clang
" let g:clang_auto = 0
"
" " let g:clang_debug = 5
" " default 'longest' can not work with neocomplete
" let g:clang_c_completeopt   = 'menuone,preview'
" let g:clang_cpp_completeopt = 'menuone,preview'
"
" " For c and c++ completion options
" let g:clang_c_options   = '-std=c11'
" let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'
"
"
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
"
" let g:neocomplete#force_omni_input_patterns.c   = '[^.[:digit:] *\t]\%(\.\|->\)\w*'
" let g:neocomplete#force_omni_input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*' 
"
" let g:clang_use_path = 1
" let g:clang_include_sysheaders = 1  
" """ END: clang_complete """  

" """ clang-format """
" let g:clang_format#style_options = {
"             \ "AccessModifierOffset" : -4,
"             \ "AllowShortIfStatementsOnASingleLine" : "true",
"             \ "AlwaysBreakTemplateDeclarations" : "true",
"             \ "Standard" : "C++11"
"             \ }
" """ END: clang-format """ 
"
" """ clang_complete """
" let g:clang_auto_select     = 0
" let g:clang_complete_auto   = 0
" let g:clang_use_library     = 1
"
" let g:clang_complete_copen    = 1
" let g:clang_periodic_quickfix = 1
"
" let g:clang_user_options = '-std=c++1z -stdlib=libc++'
"
"
if has('mac')
    let g:clang_library_path = "/usr/lib/"
endif
" """ END: clang_complete """
" """ END: Clang Completion Tools """


""" END: NeoBundle configuration """



""" Unite.vim """
nnoremap [unite] <Nop>
nmap <Leader>f [unite]

nnoremap [unite]u :<C-u>Unite -no-split<Space>
nnoremap <silent> [unite]f :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>bookmark<CR>
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir<Space>file<CR>
nnoremap <silent> ,vr :<C-u>UniteResume<CR>


nnoremap <silent> ,vb  :<C-u>Unite<Space>build<CR>
nnoremap <silent> ,vcb :<C-u>Unite<Space>build:!<CR> 
nnoremap <silent> ,vch :<C-u>UniteBuildClearHighlight<CR>
""" END unite.vim """


 
""" NeoCompletion """
" inoremap <expr><C-g> neocomplete#undo_completion()
" inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommented key-mappings.
" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function() abort
"   " return neocomplete#close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
" inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>" 

" inoremap <expr><C-y> neocomplete#close_popup()
" inoremap <expr><C-e> neocomplete#cancel_popup()

" inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Neosnippets config
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" smap <C-k> <Plug>(neosnippet_expand_or_jump)
" xmap <C-k> <Plug>(neosnippet_expand_target)
"
" imap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
"             \ "\<Plug>(neosnippet_expand_or_jump)" :
"             \ pumvisible() ? "\<C-n>" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
"             \ "\<Plug>(neosnippet_expand_or_jump)" :
"             \ "\<TAB>"
""" END NeoCompletion """



""" QuickRun  """
nmap <Leader>r <Plug>(quickrun)
noremap <Leader>w <C-w><C-w>
au FileType qf nnoremap <silent><buffer>q :quit<CR>

let g:quickrun_no_default_key_mappings=1
nnoremap <Leader>r :write<CR>:QuickRun -mode n<CR>
xnoremap <Leader>r :<C-u>write<CR>gv:QuickRun -mode v<CR>

nnoremap <Leader>r :cclose<CR>:write<CR>:QuickRun -mode n<CR>
xnoremap <Leader>r :<C-u>cclose<CR>:write<CR>gv:QuickRun -mode v<CR>

nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"
""" END QuickRun """



""" vimshell """
nmap <silent> vs :<C-u>VimShell<CR>   
nmap <silent> vp :<C-u>VimShellPop<CR>
""" END vimshell """



""" caw.vim """
" comment out pro """
nmap <Leader>c <Plug>(caw:i:toggle)
vmap <Leader>c <Plug>(caw:i:toggle) 
""" END caw.vim """



""" TaskLists """
nmap <Leader>T <Plug>TaskList
""" END: TaskLists """



" """ Clang Completion """
" map <silent> <Leader>q <Esc>:ClangCloseWindow<CR> 
"
" " map to <Leader>cf in C++ code
" autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR> 
" autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
"
" " if you install vim-operator-user
" autocmd FileType c,cpp,objc map <buffer><Leader>x <Plug>(operator-clang-format)
"
" " Toggle auto formatting:
" nmap <Leader>C :ClangFormatAutoToggle<CR>
"
" """ END: Clang Completion """ 


""" QuickRun """
let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
    let g:quickrun_config = get(g:, 'quickrun_config', {})

    let g:quickrun_config._ = {
                \ 'runner' : 'vimproc',
                \ 'runner/vimproc/updatetime' : 60,
                \ 'outputter' : 'error',
                \ 'outputter/error/success' : 'buffer',
                \ 'outputter/error/error'   : 'quickfix',
                \ 'outputter/buffer/split'  : ':botright 10sp',
                \ 'outputter/buffer/close_on_empty' : 1,
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
       let g:syntastic_cpp_compiler_options = '--std=c++1z --stdlib=libc++'
    
       let g:quickrun_config['cpp/clang++1z'] = {
                \ 'type': 'cpp/clang++',
                \ 'cmdopt': '--std=c++1z --stdlib=libc++',
                \}
    
       let g:quickrun_config['cpp'] = {'type': 'cpp/clang++1z'}
    endif

    """ Apple Swift """
    if has("mac") 
        let g:quickrun_config['swift'] = {
            \ 'command': 'swift',
            \ 'cmdopt' : '-sdk $OSX_SDK',
            \ 'exec'   : '%c %o %s',
            \}
    endif

endfunction
""" END: QuickRun """
