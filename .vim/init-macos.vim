
fun! MatchColorsToTerminal()
  if len($TMUX)
    let theme = trim(system('tmux showenv TERMTHEME'))
  else
    let theme = getenv('TERMTHEME')
  endif
  let theme = split(theme, '/')
  if len(theme) < 3 | return 0 | endif
  exe 'colo jr-'.theme[1]
  return 1
endfun

nnoremap <leader>rc :call MatchColorsToTerminal()<cr>

syn on
if !MatchColorsToTerminal()
  colo jr-dark
endif

