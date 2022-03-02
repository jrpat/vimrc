call AutoPairCommon()

let g:is_posix=1

set formatoptions+=ro

inoremap <buffer> ;s $
inoremap <buffer> $$ $()<left>

nnoremap <buffer> <leader>tt :Term bash<cr>
nnoremap <buffer> <leader>xf :call TermEval('. '.expand('%'))<cr>

