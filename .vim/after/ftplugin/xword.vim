setl noai nocin nosi inde= fo=t tw=72

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mode Mappings

function! InputGrid()
  call ClearMaps()
  inoremap <buffer> / <esc>:call NextNum()<cr>a
  inoremap <buffer> . ..<space>
  inoremap <buffer> , --<space>
  inoremap <buffer> m <cr>
  inoremap <buffer> l <cr>
  inoremap <buffer> < <cr>
  inoremap <buffer> > <cr>
  inoremap <buffer> ? <cr>
  inoremap <buffer> <bs> <esc>bC
endfunction

function! InputSolution()
  call ClearMaps()
  let b:sol1 = 1
  inoremap <buffer><expr> <space> CurChar(-1) == '-' ? ' ' : '- '
  inoremap <buffer> <bs> <esc>bcw
  inoremap <buffer> <cr> <cr><esc>0C
  inoremap <buffer> / <esc>:let b:sol1 = (b:sol1 + 1) % 2<cr>a
  for char in Chars('abcdefghijklmnopqrstuvwxyz')
    let cmd = 'inoremap <buffer><expr> @ "#" . (b:sol1 ? " " : "")'
    exe substitute(substitute(cmd, '@', char, ''), '#', toupper(char), '')
  endfor
endfunction

function! InputClues()
  call ClearMaps()
  inoremap <buffer><expr> " (CurChar() == '"') ? '<right>' : '""<left>'
endfunction

function ClearMap(map)
  try | exe "iunmap <buffer> ".a:map | catch /.*/ | endtry
endfunction

function! ClearMaps()
  call ClearMap('/')
  call ClearMap('.')
  call ClearMap(',')
  call ClearMap('<')
  call ClearMap('"')
  call ClearMap('<cr>')
  call ClearMap('<bs>')
  call ClearMap('<space>')
  call ClearMap('<space><space>')
  for char in Chars('abcdefghijklmnopqrstuvwxyz')
    call ClearMap(char)
  endfor
endfunction

command! -buffer Xnormal call ClearMaps()
command! -buffer Xgrid call InputGrid()
command! -buffer Xsolution call InputSolution()
command! -buffer Xclues call InputClues()

inoremap <buffer> ;n <esc>:Xnormal<cr>a
inoremap <buffer> ;g <esc>:Xgrid<cr>a
inoremap <buffer> ;s <esc>:Xsolution<cr>a
inoremap <buffer> ;c <esc>:Xclues<cr>a


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Helpers

function! NextNum()
  normal! mn
  let found = search('\d\d', 'bc')
  if !found
    let num = 0
  else
    exe "let num = ".expand('<cword>')
  endif
  normal! `n
  exe 'normal! a'.printf('%02d ', num+1)
endfunction


