
if !exists('g:colors_name')
  syn on
  let theme = readfile(expand('~/.termcolor'))[0]
  exe 'colo jr-' . split(theme, '-')[0]
endif

