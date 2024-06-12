hi link htmlTag Comment
hi link htmlEndTag Comment

syn keyword htmlTagName contained svg use
syn keyword htmlTagName contained hbox vbox

syn keyword htmlTagName contained show for switch case

syn match htmlArg contained /\v[[:alnum:]\?@:-]+\=/me=e-1

hi htmlItalic     cterm=none
hi htmlBold       cterm=none
hi htmlBoldItalic cterm=none


