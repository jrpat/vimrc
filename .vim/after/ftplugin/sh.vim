call AutoPairCommon()

let g:is_posix=1

setl formatoptions+=ro

inoremap <buffer> ;s $
inoremap <buffer> $$ $()<left>
inoremap <buffer> ;a &

nnoremap <buffer> <leader>tt :Term bash<cr>
nnoremap <buffer> <leader>xf :call TermEval('. '.expand('%'))<cr>

nnoremap <buffer> <leader>ms :call TaskStart('shellcheck', $"shellcheck {expand('%')}")<cr>

