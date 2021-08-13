call AutoPairCommon()

setl nostartofline

inoremap <buffer> </ </<c-x><c-o><esc>==a
imap <buffer><expr> // (CurSyntax() != "String") ? "</" : "//"
imap <buffer> >> <right></<esc>F<i

inoremap <buffer> ;d data-

