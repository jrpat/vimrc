""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Convenience

call AutoPairCommon()
call SwapUnderscoreHyphen()

inoremap <buffer> ;; ::
inoremap <buffer> ** {*}
inoremap <buffer> ;s $
inoremap <buffer> $$ ${}<left>
inoremap <buffer> ;0 if 0 {<cr>}<esc>O

inoremap <buffer> ;d dict

if expand('%:e') == 'tcl'
  nnoremap <buffer> <leader>tt :Term tclsh<cr>:call Tcl_SetupRepl()<cr>
  nnoremap <buffer> <leader>tw :Term wish<cr>:call Tcl_SetupRepl()<cr>
  nnoremap <buffer> <leader>tr :call Tcl_SetupRepl()<cr>
  nnoremap <buffer> <leader>tj :Term jimsh<cr>
else
  nnoremap <buffer> <leader>tt :Term jimsh<cr>
endif

vnoremap <buffer> <leader>\ :Align \\\\<cr>

noremap <buffer> <leader>x% :call TermEval('source '.expand('%'))<cr>



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Terminal Interaction

vmap <buffer> <leader>xnx :<c-u>call Tcl_NsEval(@*)<cr>
nmap <buffer> <leader>xnx :call Tcl_NsEval(getline('.'))<cr>
nmap <buffer> <leader>xnp myvip<leader>xnx'y
nmap <buffer> <leader>xni myvii<leader>xnx'y
nmap <buffer> <leader>xno myvio<leader>xnx'y
nmap <buffer> <leader>xc :call TermEval('clear')<cr>


fun! Tcl_SetupRepl()
  call TermEval('set tcl_prompt1 {puts -nonewline "\n% "}')
  call TermEval('proc ? {} {$::errorInfo}')
  TermDo tnoremap ;; ::
  TermDo tnoremap ;s $
endfun

fun! Tcl_NsEval(str, ...)
  let jump = a:0 ? a:1 : 0
  let nslist = Tcl_FindContainingNamespaces()
  if !len(nslist) | throw "Namespace not found" | endif  
  let ns = join(nslist, '::')
  let str = 'namespace eval '.ns." {\n" . a:str . "\n}"
  call TermEval(str, jump)
endfun



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Utils

fun! Tcl_FindContainingNamespaces(...)
  let nslist = a:0 ? a:1 : []
  if !exists('b:Tcl_FCN')  " first time through
    let b:Tcl_FCN = winsaveview()
  endif
  let tabsize = TabSize()
  let lvl = (indent('.') / tabsize)
  let indstr = &et ? repeat(' ', tabsize) : "\t"
  let prefix = '^'.repeat(indstr, (lvl - 1))
  let find = prefix.'\w'
  let nline = search(find, 'bW')
  if nline == 0 | return nslist | endif
  if getline(nline) =~ (prefix.'namespace eval')
    call search('namespace eval \k', 'e')
    let ns = matchlist(getline('.'), '\vnamespace eval ((\k|:)+)')[1]
    let nslist = [ns] + nslist
  endif
  if GetChar(0) == ' '
    return Tcl_FindContainingNamespaces(nslist)
  else
    call winrestview(b:Tcl_FCN)
    unlet b:Tcl_FCN
    return nslist
  endif
endfun


fun! Tcl_FindContainingNamespace()
  return join(Tcl_FindContainingNamespaces(), '::')
endfun


