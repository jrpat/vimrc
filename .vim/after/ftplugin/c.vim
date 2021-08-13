call AutoPairCommon()
call SwapUnderscoreHyphen()

setl cindent
setl cino=(s,m1,l1

" Prevents erroneous error highlighting
let c_no_curly_error = 1

" see `ctags --list-kinds-full=C`
let g:ctags_opt['c'] = '--kinds-C=+defghlmpstuvxz'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comments

" SQLite-style comment blocks
setl comments=s0:/*,mb:**,ex:*/
setl comments+=b://

" use std c comments for separators
let b:commentbar = '/*%s*/'

" use // comments for commenting out blocks
setl commentstring=//\ %s

" use std c comments for actual comments
inoremap <buffer> /* /*<cr>X<cr>/<esc>k0fX"_s
inoremap <buffer> // /* X */<esc>FX"_s


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts

fun! C_ShouldArrow()
  return CurSyntax() !~? '\vComment|String'
endfun

" easier arrow operator
inoremap <buffer><expr> .. C_ShouldArrow() ? '->' : '..'
inoremap <buffer> .,. ...

" disable autopair for angle brackets
inoremap <buffer> < <
inoremap <buffer> <> <><left>

inoremap <buffer> ;; <esc>myA;<esc>`ya
inoremap <buffer> ;d #define<space>
inoremap <buffer> ;i #include<space>
inoremap <buffer> ;r return<space>
inoremap <buffer> ;a &
inoremap <buffer> ;s *
inoremap <buffer> ;n \n

inoremap <buffer> ;p printf("X\n", %%%%);<esc>FX"_s


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Easier macro backslashes

fun! C_BslashEOL(first, last)
  let vov = winsaveview()
  set ve=all
  for line in range(a:first, a:last)
    exe 'norm '.line.'gg'
    .s/\v(\s|\\)+$//e
    exe 'norm '.&tw.'|r\'
  endfor
  set ve=
  call winrestview(vov)
endfun
command! -range BslashEOL call C_BslashEOL(<line1>, <line2>)

nnoremap <buffer> <leader>\ :BslashEOL<cr>
vnoremap <buffer> <leader>\ :BslashEOL<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other File

nnoremap <buffer> <leader>eo :call C_ShowOtherFIle()<cr>

silent! fun! C_ShowOtherFIle()
  let path = resolve(expand('%'))
  let path = fnamemodify(path,':r').'.'.(fnamemodify(path,':e')=='c' ? 'h' : 'c')
  exe 'e '.path
endfun


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Man pages

nnoremap <leader>hm :topleft term ++close man<space>
nnoremap <leader>hM :tab term ++close man<space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REPL - no real repl, so we use bash + compile/run

" open term
nnoremap <buffer> <leader>tt :Term bash<cr>

" build
nnoremap <buffer> <leader>xm :call TermEval('tcc '.expand('%'))<cr>
nnoremap <buffer> <leader>xM :GCCBuild<cr> 

" build and run
nnoremap <buffer> <leader>xx :call TermEval('tcc -run '.expand('%'))<cr>
nnoremap <buffer> <leader>xX :GCCRun<cr>

" send to repl
nnoremap <buffer> <leader>xl :call TermEval(getline('.'))<cr>

let b:ccflags = get(b:, 'ccflags', {"Wall":1, "Wextra":1})

fun! s:gcc(run, ...)
  let flags = a:0 ? a:1 : ''
  for [k, v] in items(b:ccflags)
    if v | let flags = flags.' -'.k | endif
  endfor
  let out = '/tmp/vimrepl_'.expand('%:t:r')
  call system('rm '.out)
  let libs = '-lm'
  let cmd = 'gcc '.expand('%').' -o '.out.' '.flags.' '.libs
  if a:run
    let cmd = cmd.' && '.out
  endif
  call TermEval(cmd)
  return out
endfun
command! -buffer GCCRun call s:gcc(1)
command! -buffer GCCBuild call s:gcc(0)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GDB

nnoremap <buffer> <leader>xd :DBG<cr>
nnoremap <leader>xb :call TermEval('b '.expand('%').':'.line('.'))<cr>
nnoremap <leader>xB :call TermEval('clear '.expand('%').':'.line('.'))<cr>

fun! s:dbg()
  let prg = s:gcc(0, '-g -O0')
  call TermEval('gdb --tui '.prg)
endfun
command! -buffer DBG call s:dbg()

