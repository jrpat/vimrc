call AutoPairCommon()

setl nostartofline

let g:html_indent_inctags = 'hbox,vbox'

inoremap <buffer> </ </<c-x><c-o><cr><esc>==a
imap <buffer> >> <right></<esc>F<i

inoremap <buffer> ;d data-

