setl tw=60
setl fo=qn

let b:commentbar = '─'

let b:boxing = 0
com! -bang -buffer BoxDraw let b:boxing = <bang>1

inoremap <buffer><expr>  _ b:boxing ? '─' : '_'
inoremap <buffer><expr> \| b:boxing ? '│' : '\|'
inoremap <buffer><expr>  { b:boxing ? '┌' : '{'
inoremap <buffer><expr>  [ b:boxing ? '└' : '['
inoremap <buffer><expr>  } b:boxing ? '┐' : '}'
inoremap <buffer><expr>  ] b:boxing ? '┘' : ']'

inoremap <buffer><expr> >  (CurChar(-1) =~ '\v(^\|\s)') ? '‣' : '>'
inoremap <buffer><expr> -> (CurChar(-1) =~ '\v(^\|\s)') ? '→' : '->'

inoremap <buffer> ;- <c-r>=TextBar()<cr>
nnoremap <buffer> ;- yypv$r-

