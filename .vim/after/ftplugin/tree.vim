setl cursorline

setl foldmethod=expr
set foldtext=TreeFoldText()

fun! TreeFoldText()
  return getline(v:foldstart)
endfun

augroup tree
  au WinEnter <buffer> setl cursorline
  au WinLeave <buffer> setl nocursorline

"  au WinEnter <buffer> let &t_EI = "\e[4 q"
"  au WinLeave <buffer> let &t_EI = "\e[2 q"
"
"  au WinEnter <buffer> startinsert
"  au WinEnter <buffer> stopinsert
"
"  au WinLeave <buffer> startinsert
"  au WinLeave <buffer> stopinsert
augroup END

nnoremap <buffer> <leader><tab> <c-w>p

