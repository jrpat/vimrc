call AutoPairCommon()
call SwapUnderscoreHyphen()

" Only for C files (not cpp)
if &ft=='c'
  setl cindent
  setl cino=(s,m1,l1
endif

" Prevents erroneous error highlighting
let c_no_curly_error = 1


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
inoremap <buffer><expr> // CurSyntax() != 'String' ? '/* X */<esc>FX"_s' : '//'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Shortcuts

fun! C_ShouldArrow()
  return CurSyntax() !~? '\vComment|String|Macro'
endfun

" easier arrow operator
inoremap <buffer> .> ->

" disable autopair for angle brackets
inoremap <buffer> < <
inoremap <buffer> <> <><left>

inoremap <buffer> ;; <esc>myA;<esc>`ya
"inoremap <buffer> ;r<space> return<space>
inoremap <buffer> ;a &
inoremap <buffer> ;d *
inoremap <buffer> ;n \n
inoremap <buffer> ;cs char *
inoremap <buffer> ;ccs const char *

inoremap <buffer> ;i<space> #include<space>
inoremap <buffer> ;i< #include <><left>
inoremap <buffer> ;i" #include ""<left>

inoremap <buffer> #D #define<space>
inoremap <buffer> #I #ifdef<space>
inoremap <buffer> #L #else
inoremap <buffer> #E #endif
inoremap <buffer> #N #ifndef<space>
inoremap <buffer> #U #undef<space>

inoremap <buffer> ;p printf("X\n", %%%%);<esc>FX"_s


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other File

OtherFile h c
OtherFile c h


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Man pages

nnoremap <leader>hm :topleft term ++close man<space>
nnoremap <leader>hM :tab term ++close man<space>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REPL - no real repl, so we use shell + compile/run

let b:clibs = get(b:, 'clibs', {'m':1})
let b:cflags = get(b:, 'cflags', {})
"let b:cflags = get(b:, 'cflags', {'Wall':1, 'Wextra':1})

" open term
nnoremap <buffer> <leader>tt :Term $SHELL<cr>

" build
nnoremap <buffer> <leader>xm :call TermEval('tcc '.expand('%'))<cr>
nnoremap <buffer> <leader>xM :CCBuild<cr> 

" build and run
nnoremap <buffer> <leader>xx :call TermEval('tcc -run '.expand('%'))<cr>
nnoremap <buffer> <leader>xX :CCRun<cr>

" send to repl
nnoremap <buffer> <leader>xl :call TermEval(getline('.'))<cr>

fun! s:cc(run, ...)
  let flags = a:0 ? a:1 : ''
  for [k, v] in items(b:cflags)
    if (v || len(v)) | let flags = flags.' -'.k.(v==1 ? '' : '='.v) | endif
  endfor
  let libs = ''
  for [k,v] in items(b:clibs)
    if (v || len(v)) | let libs = libs.' -l'.k | endif
  endfor
  let out = '/tmp/vimrepl_'.expand('%:t:r')
  call system('rm '.out)
  let cmd = 'cc '.expand('%').' -o '.out.' '.flags.' '.libs
  call TermEval(cmd.(a:run ? ' && '.out : ''))
  return out
endfun
command! -buffer CCRun call s:cc(1)
command! -buffer CCBuild call s:cc(0)


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GDB

nnoremap <buffer> <leader>xd :DBG<cr>
nnoremap <leader>xb :call TermEval('b '.expand('%').':'.line('.'))<cr>
nnoremap <leader>xB :call TermEval('clear '.expand('%').':'.line('.'))<cr>

fun! s:dbg()
  let prg = s:cc(0, '-g -O0')
  call TermEval('gdb --tui '.prg)
endfun
command! -buffer DBG call s:dbg()

