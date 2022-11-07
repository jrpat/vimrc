if &ft != 'cpp' | finish | endif

setl comments+=b:///

" override c ftplugin
let b:commentbar = '/'
iunmap <buffer> //

OtherFile hh cc
OtherFile cc hh,h

OtherFile hpp cpp
OtherFile cpp hpp,h

OtherFile h cpp,cc


fun! CPPReference(q)
  call system('open "https://duckduckgo.com/?sites=cppreference.com&q='.a:q.'"')
endfun
com! -nargs=1 CPPReference call CPPReference(<f-args>)

nnoremap <buffer> <leader>hr :CPPReference<space>

inoremap <buffer> #P #pragma<space>
inoremap <buffer> ;t template <><left>
inoremap <buffer> ;s std::
inoremap <buffer> ;m m_
inoremap <buffer> ;d *

inoremap <buffer> << <<

inoremap <buffer> < <><left>
inoremap <buffer> <> <>

inoremap <buffer> ;; ::
inoremap <buffer> ;: <esc>myA;<esc>`ya

inoremap <buffer> /* /*  */<left><left><left>


inoremap <buffer> .> ->

iunmap <buffer> ;n
inoremap <buffer> ;ne noexcept

iunmap <buffer> ;cs
iunmap <buffer> ;ccs
inoremap <buffer> ;c const



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REPL - no real repl, so we use shell + compile/run

call extend(b:cflags, {
      \ 'std':'c++20',
      \ 'I/opt/homebrew/include':1,
      \ 'L/opt/homebrew/lib':1,})
let b:cxx = get(b:, 'cxx', '/opt/homebrew/opt/llvm/bin/clang++')

" open term
nnoremap <buffer> <leader>tt :Term $SHELL<cr>

" build
nnoremap <buffer> <leader>xM :CPPBuild<cr> 

" build and run
nnoremap <buffer> <leader>xx :CPPRun<cr>
nnoremap <buffer> <leader>xX :CPPRun<cr>

fun! s:cpp(run)
  let flags = ''
  for [k,v] in items(b:cflags)
    if (v || len(v)) | let flags = flags.' -'.k.(v==1 ? '' : '='.v) | endif
  endfor
  let libs = ''
  for [k,v] in items(b:clibs)
    if (v || len(v)) | let libs = libs.' -l'.k | endif
  endfor
  let out = '/tmp/vimrepl_'.expand('%:t:r')
  let cmd = printf('%s %s -o %s %s %s', b:cxx, expand('%'), out, flags, libs)
  call TermEval('rm -f '.out.' && '.cmd.(a:run ? ' && '.out : ''))
  return out
endfun
command! -buffer CPPRun call s:cpp(1)
command! -buffer CPPBuild call s:cpp(0)

