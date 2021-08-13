call AutoPairCommon()

inoremap <buffer> ;s $
inoremap <buffer> $$ $()<left>


nnoremap <buffer> <leader>tt :Term bash<cr>
nnoremap <buffer> <leader>xf :call TermEval('. '.expand('%'))<cr>

