call AutoPairCommon()

setl omnifunc=htmlcomplete#CompleteTags
call htmlcomplete#DetectOmniFlavor()
setl nostartofline

nnoremap g> f>a

inoremap <buffer> </ </<c-x><c-o><esc>==a
imap <buffer><expr> // (CurChar(-1) =~ '\S') ? '</<esc>F<i' : '<c-v>//'

inoremap <buffer> .= className=""<left>

inoremap <buffer><expr> <cr> (CurChar(-1) == '>') ? '<cr><esc>O' : '<cr>'

imap <buffer> ;; <esc>viwoc<<esc>pf>a//<esc>i<space>

