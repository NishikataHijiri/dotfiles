" Maintainer:   Nishikata Hijiri
" Last Modified: 2015-02-17T14:26:13

""" Release autogroup in MyAutoCmd
augroup MyAutoCmd
    autocmd!
augroup END
 
" ----------------------------------------------- "
" Start Neobundle Settings.
" ----------------------------------------------- "
filetype off

let s:noplugin = 0
let s:bundle_root = expand('~/.vim/bundle')
let s:neobundle_root = s:bundle_root . '/neobundle.vim'

if has('vim_starting')
    execute "set runtimepath+=" . s:neobundle_root
endif
call neobundle#begin(s:bundle_root)

NeoBundleFetch 'Shougo/neobundle.vim'


NeoBundleLazy 'Shougo/neocomplete.vim', {
            \ "autoload": {"insert": 1}}

let g:neocomplete#enable_at_startup = 1
let s:hooks = neobundle#get_hooks("neocomplete.vim")


function! s:hooks.on_source(bundle)
    let g:acp_enableAtStartup = 0
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default': '',
                \ 'vimshell': $HOME.'/.vimshell_hist',
                \ 'scheme'  : $HOME.'/.gosh_completions'
                \}
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns['default'] = '\h\w*'

    let g:clang_user_options = '-std=c++11'
    let g:clang_complete_auto = 0
    let g:clang_auto_select = 0
    let g:clang_use_library = 0

    if !exists('g:neocomplete#force_omni_input_patterns')
        let g:neocomplete#force_omni_input_patterns = {}
    endif

    let g:neocomplete#force_overwrite_completefunc = 1
    let g:neocomplete#force_omni_input_patterns.cpp = 
                                    \ '[^.[:digit:] *\t]\%(\.\|->\)\w*\|\h\w*::\w*'
    
    "NeoCompleteEnable
endfunction


NeoBundle "thinca/vim-template"
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%m-%d-%Y')/g
    silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction

autocmd MyAutoCmd User plugin-template-loaded
            \   if search('<+CURSOR+>')
            \ |     silent! execute 'normal! "_da>'
            \ | endif

NeoBundleLazy "sjl/gundo.vim", {
            \ "autoload": {
            \   "commands": ['GundoToggle'],
            \}}

NeoBundleLazy "vim-scripts/TaskList.vim", {
            \ "autoload": {
            \   "mapoings": ['<Plug>TaskList'],
            \}}
nmap <Leader>T <Plug>TaskList

NeoBundle 'marijnh/tern_for_vim', {
    \ 'build': {
    \   'others': 'npm install'
    \}}
"autocmd MyAutoCmd FileType javascript setlocal omnifunc=tern#Complete

NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tpope/vim-fugitive'


" Completion packages
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

let g:neosnippet#enable_snipmate_compatibility = 1


" Ruby and Rails settings
NeoBundle 'tpope/vim-rails'
NeoBundle 'tpope/vim-endwise'

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'tomtom/tcomment_vim'

NeoBundle 'Shougo/vimproc', {
\	'build' : {
\		'mac' : 'make -f make_mac.mak',
\		'unix' : 'make -f make_unix.mak',
\	},
\}

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

let s:hooks = neobundle#get_hooks("jedi-vim")
function! s:hooks.on_source(bundle)
    let g:jedi#auto_vim_configuration =  0
    let g:jedi#rename_command = '<Leader>R'
    let g:jedi#goto_command = '<Leader>G'
    let g:jedi#completions_enabled=0
    let g:jedi#popup_on_dot = 1
    let g:jedi#auto_initialization = 1
    autocmd MyAutoCmd FileType python setlocal omnifunc=g:jedi#auto_initialization#complete
    autocmd MyAutoCmd FileType python let b:did_ftplugin = 1
endfunction


autocmd MyAutoCmd FileType python setlocal completeopt-=preview


inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)


NeoBundleLazy "thinca/vim-quickrun", {
            \ "autoload": {
            \   "mappings": ['nxo', '<Plug>(quickrun)'],
            \}}

nmap <Leader>r <Plug>(quickrun)
noremap <Leader>w <C-w><C-w>

let s:hooks = neobundle#get_hooks("vim-quickrun")
function! s:hooks.on_source(bundle)
    let g:quickrun_config = {
    \	"cc/g++" : {
    \		"cmdopt" : "-std=c++11",
    \		"hook/time/enable" : 1
    \	},
    \	"_" : {
    \		"outputter/buffer/split" : "botright 10sp",
    \		"outputter/buffer/close_on_empty" : 1,
    \		"runner" : "vimproc",
    \		"runner/vimproc/updatetime" : 60
    \	},
    \}

    let g:quickrun_config.tex = {'command' : 'autolatex'}
    let g:quickrun_config.python = {'command' : 'python3'}

    let g:quickrun_config['html'] = {
                \ 'command': 'open',
                \ 'exec' : '%c %s',
                \ 'outputter' : 'browser'
                \ }
endfunction


" web development env
NeoBundleLazy 'mattn/emmet-vim', {
            \ 'autoload' : {
            \   'filetypes' : 
            \       ['html', 'html5', 'eruby', 'jsp', 'xml', 'css', 'scss', 'coffee'],
            \   'commands' : ['<Plug>ZenCodingExpandNormal']
            \ }}
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

NeoBundle 'open-browser.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'tell-k/vim-browsereload-mac'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-endwise.git' 
NeoBundle 'ruby-matchit'
NeoBundle 'vim-scripts/dbext.vim'
NeoBundle 'nathanaelkane/vim-indent-guides'

autocmd MyAutoCmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd MyAutoCmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd MyAutoCmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
 

NeoBundleCheck
call neobundle#end()

" Required:
filetype plugin indent on
" ----------------------------------------------- "
" End Neobundle Settings.
" ----------------------------------------------- "
