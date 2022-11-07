syn keyword gigCommand  set env cmd

syn region  gigComment		start="^\s*\#" skip="\\$" end="$"
syn region  gigComment		start=/;\s*\#/hs=s+1 skip="\\$" end="$"

" variable reference
	" /optional/envs
syn match gigVarRef "$\(\(/\)\?\([[:alnum:]_]*/\)*\)\a[[:alnum:]_]*"
	" ${...} may contain any character except '}'
syn match gigVarRef "${[^}]*}"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

hi def link   gigComment  Comment
hi def link   gigCommand  Statement
hi def link   gigVarRef   Identifier

