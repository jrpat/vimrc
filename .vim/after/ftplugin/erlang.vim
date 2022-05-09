call AutoPairCommon()

setl softtabstop=2
setl shiftwidth=2
setl tabstop=2

setl iskeyword+=:
setl complete=.,w,b,u,t,i,k
setl dictionary=~/.vim/dict/erlang.dict

setl makeprg=erlc\ %

let &l:keywordprg = get(g:, 'erlang_keywordprg', 'erl -man')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>tt :Term erl<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <buffer> >> ->
inoremap <buffer> :: =>

