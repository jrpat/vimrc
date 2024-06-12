fun! s:Up(word)
  " Do not uppercase word if inside a larger word
  if CurChar(-1 * (len(a:word) + 1)) =~ '\w' | return a:word | endif
  
  " Do not uppercase word if within a comment or string
  if CurSyntax() =~# 'Comment\|String' | return a:word | endif

  " Do not uppercase word if not a docker keyword
  if CurSyntax(1) !~# 'dockerfileInstruction\|dockerfileKeyword' | return a:word | endif

  return toupper(a:word)
endfun

fun! s:Keyword(...)
  for word in a:000
    let w = tolower(word)
    exe printf('iabbrev <expr><buffer> %s <SID>Up("%s")', w, w)
  endfor
endfun

command -buffer -nargs=+ DockerKeyword call s:Keyword(<f-args>)


DockerKeyword add arg cmd copy entrypoint env expose from healthcheck label
DockerKeyword maintainer onbuild run shell stopsignal user volume workdir

