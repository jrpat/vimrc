call AutoPairCommon()

setl nostartofline

let g:html_indent_inctags = 'hbox,vbox'

inoremap <buffer> </ </<c-x><c-o><cr><esc>==a
imap <buffer> << <right></<esc>F<i

inoremap <buffer> ;b <br>
inoremap <buffer> ;d data-


if &ft =~ 'html'
  runtime! ftplugin/javascript.vim
endif

fun! IsJS()
  return CurSyntax() =~ '^javaScript'
endfun

" resolve clashes with javascript
inoremap <buffer><expr> ;a IsJS() ? 'await ' : '&;<left>'

