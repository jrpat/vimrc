call AutoPairCommon()
call SwapUnderscoreHyphen()

setl noet

hi link goSpaceError Normal


inoremap <buffer> :: :=<space>
inoremap <buffer> ;p fmt.Println()<left>
inoremap <buffer> ;P fmt.Printf("X", %%%%)<esc>FXs
inoremap <buffer> ;r &


set indentkeys-=<:>   " switch/case indenting is wonky


fun! GoUpperMethod(char)
  return '.'.((CurSyntax() == 'String') ? a:char : toupper(a:char))
endfun

for char in Chars('abcdefghijklmnopqrstuvwxyz')
  exe printf('inoremap <expr><buffer> .%s GoUpperMethod("%s")', char, char)
endfor


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use gofmt to tidy

" we have to do this check bc otherwise the edit! below causes an error 
if !exists('*Go_FmtComplete')
  fun! Go_FmtComplete(status)
    if a:status
      call TaskCopen('gofmt')
      wincmd p
    else
      let v = winsaveview()
      edit!
      call winrestview(v)
    endif
  endfun
endif

nmap <buffer> <tab> :update<cr>:call TaskStart('gofmt', 'gofmt -w '.expand('%'))<cr>
nmap <buffer> <leader>? :call TaskCopen('gofmt')<cr>

call TaskCb('gofmt', 'Go_FmtComplete')

