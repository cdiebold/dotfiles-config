if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

setlocal nomodeline
setlocal nobuflisted
setlocal nolist nospell
setlocal nowrap nofoldenable
setlocal nonumber norelativenumber
setlocal foldcolumn=0 colorcolumn=0

call gina#action#include('browse')
call gina#action#include('changes')
call gina#action#include('compare')
call gina#action#include('diff')
call gina#action#include('edit')
call gina#action#include('show')

" Does this buffer points files on working-tree or index/commit?
let s:is_worktree = empty(gina#core#buffer#param('%', 'rev'))

if g:gina#command#ls#use_default_aliases
  if s:is_worktree
    call gina#action#shorten('edit')
  else
    call gina#action#shorten('show')
  endif
endif

if g:gina#command#ls#use_default_mappings
  if s:is_worktree
    nmap <buffer> <Return> <Plug>(gina-edit)zv
  else
    nmap <buffer> <Return> <Plug>(gina-show)zv
  endif
endif
