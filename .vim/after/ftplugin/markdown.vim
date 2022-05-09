call AutoPairCommon()

setl fo+=t

iunmap <buffer> '
iunmap <buffer> '<bs>

inoremap <buffer> ``` ```
inoremap <buffer><expr> ;- TextBar('-')

inoremap <buffer> * **<left>
inoremap <buffer> ** ****<left><left>

inoremap <buffer> ;b <br>

nnoremap <buffer> <leader>y :%y<cr>

