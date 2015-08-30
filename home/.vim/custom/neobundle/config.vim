" Maintainer:   alicengh


""" NeoCompletion """
" Basic config.
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

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Enable omni completion.
autocmd FileType css            setlocal omnifunc = csscomplete#CompleteCSS
autocmd FileType python         setlocal omnifunc = pythoncomplete#Complete
autocmd FileType xml            setlocal omnifunc = xmlcomplete#CompleteTags
autocmd FileType html,markdown  setlocal omnifunc = htmlcomplete#CompleteTags
autocmd FileType javascript     setlocal omnifunc = javascriptcomplete#CompleteJS

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
""" END NeoCompletion """



""" Unite.vim """
let g:unite_enable_start_insert   = 1
let g:vinarise_enable_auto_detect = 1
""" END Unite.vim """



""" VimFiler """
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
""" END VimFiler """
