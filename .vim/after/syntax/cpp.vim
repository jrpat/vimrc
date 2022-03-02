syn match cppFunction /\v^[[:alnum:]:]{-}\s*\(/me=e-1
hi link cppFunction Function

syn match cppAttribute /\v\[\[\w{-}\]\]/
hi link cppAttribute Special

