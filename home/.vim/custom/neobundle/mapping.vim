" Maintainer:   alicengh
" Last Modified: 2015-08-31T20:46:19

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
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommented key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function() abort
  " return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>" 

inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()

inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" Neosnippets config
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
            \ "\<Plug>(neosnippet_expand_or_jump)" :
            \ pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? 
            \ "\<Plug>(neosnippet_expand_or_jump)" :
            \ "\<TAB>"
""" END NeoCompletion """



""" QuickRun  """
nmap <Leader>r <Plug>(quickrun)
noremap <Leader>w <C-w><C-w>
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
