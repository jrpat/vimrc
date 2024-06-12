call AutoPairCommon()
call SwapUnderscoreHyphen()

imap <buffer> ;l <lt>leader>
imap <buffer> ;e <expr>
imap <buffer> ;b <buffer>
imap <buffer> ;s <silent>
imap <buffer> ;h <lt>left>
imap <buffer> ;c <lt>cr>
imap <buffer> ;x <lt>esc>
"imap <buffer> ;f fun! X<cr>endfun<esc>k0fXs
imap <buffer> ;i inoremap<space>
imap <buffer> ;n nnoremap<space>

imap <buffer> ;a &

" disable auto-pair quotes
inoremap <buffer> " "
inoremap <buffer> "" ""<left>

inoremap <buffer> $" $""<left>

