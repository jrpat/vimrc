call AutoPairCommon()
call SwapUnderscoreHyphen()

nnoremap <buffer> <leader>tt :Term swift repl<cr>:call Swift_SetupRepl()<cr>


fun! Swift_SetupRepl()
  call TermEval('import Foundation')
  call timer_start(2000, 'Swift_SetupRepl2')
endfun


fun! Swift_SetupRepl2(...)
  call TermEval(':set set print-decls false')
endfun

