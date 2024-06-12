call AutoPairCommon()
call SwapUnderscoreHyphen()

set isk+=$

inoremap <buffer> < <
inoremap <buffer> ;0 if (0) {<cr>}<esc>O
inoremap <buffer> ;t this.
inoremap <buffer> ;l console.log()<left>
inoremap <buffer> ;f function
inoremap <buffer> ;a await<space>
inoremap <buffer> ;c const<space>
inoremap <buffer> ;s $
inoremap <buffer> $( $('')<left><left>
inoremap <buffer> $$( $$('')<left><left>
inoremap <buffer> ## $('#')<left><left>
inoremap <buffer> ${ ${}<left>
inoremap <buffer> >> =>
inoremap <buffer> /* /*  */<left><left><left>

inoremap <buffer> `<cr> `<cr>`<esc>O

nnoremap <buffer> <leader>tt :Term node --experimental-repl-await --trace-warnings<cr>
nnoremap <buffer> <leader>x% :call TermEval('eval(fs.readFileSync("'.expand('%').'").toString())')<cr>

nnoremap <buffer> <leader>td :Term deno<cr>


if (expand('%:e') == 'jsx') || (expand('%')[-7] == '.lit.js')
  runtime ftplugin/jsx.vim
endif

