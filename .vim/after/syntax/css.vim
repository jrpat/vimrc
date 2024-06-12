
syn match cssVariable /\v--[\w-]+/
hi link cssVariable Identifier

syn match cssValueLength contained "[-+]\=\d\+\(\.\d*\)\=\(lvh\|lvw\|lvmin\|lvmax\|svh\|svw\|svmin\|svmax\|dvh\|dvw\|dvmin\|dvmax\)\>" contains=cssUnitDecorators

