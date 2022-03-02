set comments+=b:///

" override c ftplugin
let b:commentbar = '/'
iunmap <buffer> //

OtherFile hh cc
OtherFile cc hh,h

OtherFile hpp cpp
OtherFile cpp hpp,h

OtherFile h cpp,cc


inoremap <buffer> #P #pragma<space>
inoremap <buffer> ;s std::
inoremap <buffer> ;t template <><left>
inoremap <buffer> ;cs char*<space>
inoremap <buffer> ;ccs const char*<space>
inoremap <buffer> ;m m_

inoremap <buffer> << <<

inoremap <buffer> < <><left>
inoremap <buffer> <> <>

inoremap <buffer> ;; ::
inoremap <buffer> ;: <esc>myA;<esc>`ya

inoremap <buffer> /*<space> /*  */<left><left><left>
inoremap <buffer> /*<cr> /*<cr>X<cr>/<esc>k0fX"_s

" ... is used more in cpp than c, so let's accomodate that
iunmap <buffer> ..
iunmap <buffer> .,.
inoremap <buffer> .> ->


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" REPL - no real repl, so we use shell + compile/run

" open term
nnoremap <buffer> <leader>tt :Term $SHELL<cr>

" build
nnoremap <buffer> <leader>xM :CPPBuild<cr> 

" build and run
nnoremap <buffer> <leader>xx :CPPRun<cr>
nnoremap <buffer> <leader>xX :CPPRun<cr>

let b:cflags = get(b:, 'cflags', {"Wall":1, "Wextra":1})

fun! s:cpp(run, ...)
  let flags = a:0 ? a:1 : ''
  for [k, v] in items(b:cflags)
    if (v || len(v)) | let flags = flags.' -'.k.(v==1 ? '' : '='.v) | endif
  endfor
  let out = '/tmp/vimrepl_'.expand('%:t:r')
  call system('rm '.out)
  let libs = '-lm'
  let cmd = 'c++ '.expand('%').' -o '.out.' '.flags.' '.libs
  call TermEval(cmd.(a:run ? ' && '.out : ''))
  return out
endfun
command! -buffer CPPRun call s:cpp(1)
command! -buffer CPPBuild call s:cpp(0)
