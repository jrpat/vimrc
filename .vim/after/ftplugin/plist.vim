setl nofixeol

nnoremap <buffer> <leader>kx :%!plutil -convert xml1 -o - %<cr>
nnoremap <buffer> <leader>kb :%!plutil -convert binary1 -o - %<cr>
nnoremap <buffer> <leader>kj :%!plutil -convert json -r -o - %<cr>
