" integer number
syn match luaNumber "-\?\<\d\+\>"
" floating point number, with dot, optional exponent
syn match luaNumber  "-\?\<\d\+\.\d*\%([eE][-+]\=\d\+\)\=\>"
" floating point number, starting with a dot, optional exponent
syn match luaNumber  "-\?\.\d\+\%([eE][-+]\=\d\+\)\=\>"
" floating point number, without dot, with exponent
syn match luaNumber  "-\?\<\d\+[eE][-+]\=\d\+\>"

hi link luaIn Repeat
hi link luaOperator Conditional

