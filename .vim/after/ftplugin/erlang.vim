call AutoPairCommon()

setlocal softtabstop=2
setlocal shiftwidth=2
setlocal tabstop=2

setlocal iskeyword+=:
setlocal complete=.,w,b,u,t,i,k
setlocal dictionary=~/.vim/dict/erlang.dict

setlocal makeprg=erlc\ %

let &l:keywordprg = get(g:, 'erlang_keywordprg', 'erl -man')

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

nnoremap <leader>tt :Term erl<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

inoremap <buffer> >> ->
inoremap <buffer> :: =>

