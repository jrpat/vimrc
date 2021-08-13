" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Core

set nocompatible
set lazyredraw
set timeoutlen=1000 ttimeoutlen=0
set clipboard^=unnamed,unnamedplus
filetype plugin indent on
let mapleader = " "




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Colors

set t_Co=256

command! DARK colo jr-dark
command! LIGHT colo jr-light

if !exists('g:colors_name')
  syn on
  let theme = readfile(expand('~/.termcolor'))[0]
  exe 'colo jr-'.theme
endif



" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Settings

" Text Defaults
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set textwidth=72
set autoindent
set formatoptions=croqn1jp

" VI Compat
set cpoptions-=a

" GUI
set wildmode=list:longest
set completeopt=menuone
set foldlevel=99
set foldminlines=0
set foldmethod=indent
set wildmenu
set hidden
set nowrap
set scrolloff=2
set ttymouse=xterm2
set laststatus=2
set mouse=a
set previewheight=20
set sidescroll=1
set sidescrolloff=2

" Search
set ignorecase
set incsearch
set smartcase

" No noises
set belloff=all
set novisualbell
set t_vb=

" Cursor
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"
let &t_SR = "\e[4 q"
let &t_ti .= "\<esc>[2 q"
set nostartofline

" Temp Files
set directory=~/.vim/.swap
set undodir=~/.vim/.undo
set viminfo+=n~/.vim/.viminfo

" Tags
set tags=./.git/tags;

" History
set history=4096

" Undo
set undofile
set undolevels=500

" Search Files
if executable('rg')
  set grepprg=rg\ --vimgrep\ --glob='!tmp'\ $*
endif
command! -nargs=+ Grep silent! grep! <q-args> | bot copen | redraw!

" Netrw
let g:netrw_list_hide = '^\./$,^\.\./$'
let g:netrw_banner = 0
let g:netrw_hide = 1
let g:netrw_altfile = 1
let g:netrw_sort_sequence = '[\/]$,*' . (empty(&suffixes) ? '' : ',\%(' .
  \ join(map(split(&suffixes, ','), 'escape(v:val, ".*$~")'), '\|') . '\)[*@]\=$')

" SQL
let g:sql_type_default = 'sqlite'

" Quickfix
augroup qf_cursorline | au!
  au FileType qf setl cursorline
augroup END




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Mappings

" Mark Ergonomics
noremap ` '
noremap ' `

" Move Cursor Around
map <c-j> 8j
map <c-k> 8k
map <c-l> <c-w>l
map <c-h> <c-w>h
map <leader>j <c-w>j
map <leader>k <c-w>k
map <leader><tab> <c-w>p
" experiment:
map gj <c-w>j
map gk <c-w>k
map gl <c-w>l
map gh <c-w>h

" Folds
nmap <leader>f0 :setl foldlevel=0<cr>
nmap <leader>f9 :setl foldlevel=99<cr>
nmap <leader>f<leader> zA
nmap <leader>ff za

" Buffers
nmap <leader>. :b#<cr>
command! BD b#|bd! #

" Files
nmap - :call BrowseDirectory()<cr>
cabbr <expr> %d expand('%:p:h')
cabbr <expr> %f expand('%')

" Sessions
nmap <leader>ss :SessionCreate<space>
nmap <leader>so :call FuzzyFind('ls -1 ~/.vim/sessions', ':SessionLoad %s')<cr>

" Fuzzy Find
nmap <leader>ee :call FuzzyFile('', 'call EditIfExists("%s")')<cr>
nmap <leader>er :call FuzzyFind("cat ~/.vim/.mru", ':e %s')<cr>
nmap <leader>e- :call FuzzyFile('--no-ignore '.expand('%:p:h'), ':e %s')<cr>
nmap <leader>e. :call FuzzyBufs(':b %s')<cr>
nmap <leader>e; :exe 'e /tmp/scratch-'.localtime()<cr>

" Refresh
nmap <leader>rv :source ~/.vimrc<cr>
nmap <leader>rf :source %<cr>
nmap <leader>rs :syn sync fromstart<cr>:redraw!<cr>
nmap <leader>rt :call GenCTags()<cr>
nmap <leader>rp :call SourceLocalVimrc()<cr>
nmap <leader>rP :sp<cr>:silent bufdo call SourceLocalVimrc()<cr>:q<cr>:echo<cr>
nmap <leader>rr :e<cr>

" Vimscript
vmap <leader>vv :<c-u>@*<cr>
nmap <leader>vv vil<leader>vv
nmap <leader>vp myvip<leader>vv'y
nmap <leader>vf myggVG<leader>vv'y

" Windows
nmap <leader>pq :pclose<cr>
nmap <c-w>z :tab sp<cr>
tnoremap <c-w><tab> gt

" Snippets
imap \<tab> <esc>:call SnipInsert()<cr>
imap <c-]> <esc>:call SnipNext()<cr>
imap <c-\> <esc>:call SnipNext('b')<cr>

" Convenience
map <leader>w :w<cr>
map <leader>q :q<cr>
map Q @q

" Visual Mode
vnoremap v V
vnoremap p "_dP
vnoremap P "_dP

" Line Object
xnoremap il g_o_o
xnoremap al $o_o
onoremap il :normal vil<cr>
onoremap al :normal val<cr>

" 'Definition' Object
xnoremap ii a{V
xnoremap io <esc>/^}<cr>V%
onoremap ii :normal vii<cr>
onoremap io :normal vio<cr>

" Command-Line Conveniences
cmap ;l <lt>leader>
cmap ;e <expr>
cmap ;b <buffer>
cmap ;s <silent>
cmap ;c <lt>cr>
cmap ;x <lt>esc>
cmap ;h <lt>left>
cmap ;n nnoremap<space>
cmap ;i inoremap<space>

" Comments
vmap g/ :CommentToggle<cr>
nmap g/ Vg/
inoremap <expr> ;- TextBar()
nnoremap <leader>_ yypv$r-

" Terminal
tnoremap <esc><esc> <c-\><c-n>
tnoremap <c-h> <c-w>h
tnoremap <c-l> <c-w>l
tnoremap <c-j> <c-w>j
tnoremap <c-k> <c-w>k
nmap <leader>tc :TermCopy<cr>
nmap <leader>tp :TermPaste<cr>
nmap <leader>to :TermOpen<cr>
nmap <leader>tO :TermOpen!<cr>
nmap <leader>tq :TermQuit<cr>
nmap <leader>tQ :TermQuit!<cr>
nmap <leader>t; :Term bash<cr><c-w>p
" send and jump:
vmap <leader>x<leader> :<c-u>call TermEval(@*, 1)<cr>
nmap <leader>x<leader> :call TermEval(getline('.'), 1)<cr>
" send and stay:
vmap <leader>xx :<c-u>call TermEval(@*)<cr>
nmap <leader>xx :call TermEval(getline('.'))<cr>
nmap <leader>xf :Stay ggVG<leader>xx<cr>
nmap <leader>xp :Stay vip<leader>xx<cr>
nmap <leader>xi :Stay vii<leader>xx<cr>
nmap <leader>xo :Stay vio<leader>xx<cr>
imap <c-f8> <esc><leader>xxa

" Errors
nmap <leader>co :below copen<cr>
nmap <leader>cn :cnext<cr>
nmap <leader>cp :cprev<cr>
nmap <leader>cf :cnfile<cr>
nmap <leader>cq :cclose<cr>

" Tags
nnoremap <leader>] "tyiw<c-w>p:tag <c-r>t<cr>zz8<c-e><c-w>p10<>

" Align
vnoremap <leader>a :Align<space>




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Utils

fun! GetChar(...)
  let [line, colu] = (a:0 > 1) ? [a:1, a:2] : ['.', a:1]
  if (colu =~ '\$') | let colu = col('$') - 2 | endif
  return strcharpart(getline(line), colu, 1)
endfun

fun! CurChar(...)
  let off = 1 - (a:0 > 0 ? a:1 : 0)
  return GetChar('.', col('.') - off)
endfun

fun! SyntaxAt(line, col, trans)
  let id = synID(a:line, a:col, 1)
  let id = a:trans ? synIDtrans(id) : id
  return synIDattr(id, 'name')
endfun

fun! CurSyntax(...)
  let offset = (mode() == 'i') ? 1 : 0
  return SyntaxAt(line('.'), col('.')-offset, !a:0)
endfunction

fun! Chars(str)
  return split(a:str, '\zs')
endfun

let g:ctags_opt = get(g:, 'ctags_opt', {})
fun! GenCTags(...)
"  let dir = expand('%:p:h')
  let dir = getcwd()
  let opt = '-R --sort=yes --extras=Ff -f .git/tags'
  let cmd = 'ctags '.opt.' '.get(g:ctags_opt, &ft, '')
  echom cmd.' '.dir
  call TaskStart('ctags', cmd.' '.dir)
endfun

fun! ShouldSwapUnderscoreHyphen(char)
  return (col('.') > 1) && (CurChar(-1) !~ '\v[[:space:]'.a:char.']')
endfun

fun! SwapUnderscoreHyphen()
  inoremap <expr><buffer> - ShouldSwapUnderscoreHyphen('-') ? '_' : '-'
  inoremap <expr><buffer> _ ShouldSwapUnderscoreHyphen('_') ? '-' : '_'
"  inoremap <buffer> _ -
"  inoremap <buffer> - _
endfun


fun! StayNormal(cmds)
  let b:StayNormal = winsaveview()
  exe 'normal ' . a:cmds
  call winrestview(b:StayNormal)
  unlet b:StayNormal
endfun
command! -nargs=1 Stay call StayNormal(<q-args>)

fun! StayCmd(cmd)
  let b:StayCmd = winsaveview()
  exe a:cmd
  call winrestview(b:StayCmd)
"  unlet b:StayCmd
endfun
command! -nargs=1 StayCmd call StayCmd(<q-args>)

fun! TabSize()
  return &et ? &sts : &ts
endfun

fun! IndentLevel(...)
  let offset = a:0 ? a:1 : 0
  let line = line('.') + offset
  return indent(line) / TabSize()
endfun

fun! GitRoot()
  let root = system('git -C '.expand('%:p:h').' rev-parse --show-toplevel')
  if v:shell_error != 0 | throw "No git root found!" | endif
  return trim(root)
endfun

fun! ShellJob(cmd, ...)
  let opts = a:0 ? a:1 : {}
  return job_start(['/bin/sh', '-c', a:cmd], opts)
endfun

fun! EditIfExists(path)
  if filereadable(a:path)
    exe 'e '.a:path
  else
    echo "No such file"
  endif
endfun

fun! EchoHL(hl, ...)
  let hl = a:0 ? a:hl : split(a:hl)[0]
  let msg = a:0 ? a:1 : join(split(a:hl)[1:], ' ')
  exe 'echohl '.hl | echo msg | echohl None
endfun
command! -nargs=1 Echohl call EchoHL(<q-args>)

fun! EchoResult(result, good, bad)
  let msg = a:result ? a:bad : a:good
  call EchoHL(a:result ? 'EchoBad' : 'EchoGood', msg)
endfun
hi EchoGood ctermfg=2
hi EchoBad  ctermfg=1
hi EchoDim  ctermfg=8

command! Marks :marks abcdefghijklmnopqrstuvwxyz




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Directory Browsing

fun! BrowseDirectory()
  let fname = expand('%:t')
  Ex
  setl bufhidden=wipe buftype=quickfix
  nnoremap <buffer> <leader>q :Rex<cr>
  exe 'silent! /'.fname
endfun




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Local Vimrc

fun! SourceLocalVimrc()
  if (getcwd() == expand('~')) | return | endif
  try | let root = GitRoot() | catch | let root = expand('%:p:h') | endtry
  let dir = expand('%:p:h')
  let file = root.'/.vimrc'
  if filereadable(file) | exe "source ".file | echom "Sourced ".file | endif
endfun




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Fuzzy Find

fun! FuzzyFind(shcmd, vimcmd)
  try
    let output = system(a:shcmd . ' 2>/dev/null' . ' | fzy')
  finally
    redraw!
  endtry
  if v:shell_error == 0 && !empty(output)
    exe printf(a:vimcmd, trim(output))
  endif
endfun

fun! FuzzyList(list, vimcmd)
  let shcmd = 'printf "'.join(a:list, '\n').'"'
  return FuzzyFind(shcmd, a:vimcmd)
endfun

fun! FuzzyFile(dir, vimcmd)
  let opts = '--files --hidden --follow '
        \  . '--glob !.git '
        \  . '--glob !.swap '
        \  . '--glob !.undo '
  call FuzzyFind('rg '.opts.' '.a:dir, a:vimcmd)
endfun

fun! FuzzyBufs(vimcmd)
  let b = 1
  let bufs = []
  while b <= bufnr('$')
    if buflisted(b)
      call add(bufs, bufname(b))
    endif
    let b = b+1
  endwhile
  call FuzzyList(bufs, a:vimcmd)
endfun




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Sessions

fun! SessionSave(...)
  let file = a:0 ? '~/.vim/sessions/'.a:1 : v:this_session
  if !strlen(file) | return | end
  let opts = &sessionoptions
  set sessionoptions-=blank
  set sessionoptions-=options
  set sessionoptions+=tabpages
  exe "mksession! ".expand(file)
  let &sessionoptions = opts
endfun

fun! SessionInit(...)
  augroup sessions | au!
    au VimLeavePre * call SessionSave()
    au BufEnter * call SessionSave()
  augroup END
  if a:0
    exe "source ".expand('~/.vim/sessions/'.a:1)
  endif
endfun

command! -nargs=1 SessionCreate call SessionSave(<f-args>) | call SessionInit()
command! -nargs=1 SessionLoad call SessionInit(<f-args>)




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Async Tasks

let g:tasks = get(g:, 'tasks', {})
let g:taskcbs = get(g:, 'taskcbs', {})

fun! TaskStart(name, cmd, ...)
  let opt = a:0 ? a:1 : {}
  if has_key(g:tasks, a:name) | return | endif
  let cmd = a:cmd . ' >/tmp/vimtask_'.fnameescape(a:name).' 2>&1'
  let job = ShellJob(cmd, extend(opt, {'exit_cb': 'TaskFinished'}))
  let g:tasks[a:name] = job
endfun

fun! TaskFinished(job, status)
  let name=''
  for [_name, _job] in items(g:tasks)
    if _job == a:job | let name = _name | unlet g:tasks[name] | break | endif
  endfor
  if !len(name) | return | endif
  call EchoResult(a:status, ' ✔ '.name.' finished', ' × '.name.' failed')
  if !a:status | cclose | else | call TaskCopen(name) | endif
  let cb = get(g:taskcbs, name, '')
  if len(cb) | call function(cb)(a:status) | endif
endfun

fun! TaskCopen(name, ...)
  let opt = extend((a:0 ? a:1 : {}), {'lines': systemlist('cat /tmp/vimtask_'.fnameescape(a:name))})
  call setqflist([], ' ', opt)
  bot copen
endfun

fun! TaskCb(name, fn)
  if len(a:fn) | let g:taskcbs[a:name] = a:fn | else | unlet g:taskcbs[a:name] | endif
endfun




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Terminal

let g:terms = get(g:, 'terms', {})

fun! TermCreate(cmd, ...)
  let place = a:0 ? a:1 : 'vert botright'
  let opt = {'curwin':!len(place), 'exit_cb':'TermOnExit'}
  let termid = localtime()
  exe place.' let buf = term_start(a:cmd, opt)'
  let g:terms[termid] = {'buf':buf, 'job':job_info()[0]}
  let b:termid_me = termid                " set in terminal
  let b:termid_target = termid
  wincmd p | let b:termid_target = termid " set in buffer
  TermCopy
endfun

fun! TermOnExit(job, status)
  for [id, t] in items(g:terms)
    if (t.job == a:job) | unlet g:terms[id] | endif
  endfor
endfun

fun! TermGet()
  let term = get(g:terms, get(b:, 'termid_target'), {})
  if !len(term) | echo "No term!" | endif
  return term
endfun

fun! TermOpen(split)
  let term = TermGet() | if !len(term) | return | endif
  let pre = ((winnr('#') == 1) || a:split) ? 'botright vert s' : '2windo '
  exe pre.'b'.(term.buf)
  wincmd p
endfun

fun! TermQuit(close)
  let term = TermGet() | if !len(term) | return | endif
  call job_stop(term['job'])
  if a:close | exe bufwinnr(term.buf).'wincmd c' | endif
endfun

fun! TermSend(str)
  let term = TermGet() | if !len(term) | return | endif
  call term_sendkeys(term.buf, a:str)
endfun

fun! TermEval(str, ...)
  let term = TermGet() | if !len(term) | return | endif
  let jump = a:0 ? a:1 : 0
  for line in split(a:str, "\n")
    call term_sendkeys(term.buf, line."\n")
  endfor
  if &buftype == 'terminal'
    norm A
  else
    if jump | exe bufwinnr(term.buf).'wincmd w' | endif
  endif
endfun

fun! TermDo(str, ...)
  let term = TermGet() | if !len(term) | return | endif
  let jump = a:0 ? a:1 : 0
  let view = winsaveview()
  let [curbuf, altbuf] = [bufnr('%'), bufnr('#')] " keepalt does not work
  exe term['buf'].'bufdo '.a:str
  if altbuf > 0 | exe 'b'.altbuf | endif
  exe 'b'.curbuf
  call winrestview(view)
  if jump | exe bufwinnr(term.buf).'wincmd w' | endif
endfun

fun! TermGo()
  let term = TermGet() | if !len(term) | return | endif
  exe bufwinnr(term.buf).'wincmd w'
endfun

command! -nargs=1 -bang -complete=file Term call TermCreate(<f-args>, <bang>0 ? '' : 'botright vert')
command! -nargs=1 -bang -complete=file TermBelow call TermCreate(<f-args>, 'below')
command! -nargs=1 -bang TermDo call TermDo(<q-args>, <bang>0)
command! -nargs=1 -bang TermEval call TermEval(<q-args>, <bang>0)
command! -bar -bang TermQuit call TermQuit(<bang>0)
command! -bar -bang TermOpen call TermOpen(<bang>0)
command! -bar TermCopy let g:termid_copied = get(b:, 'termid_me', get(b:, 'termid_target', 0))
command! -bar TermPaste let b:termid_target = g:termid_copied
command! -bar TermGo call TermGo()




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Auto-Pair

let s:AutoPair_Maps = {
  \  'open': '{ {}<left>'
  \, 'both': '{} {}'
  \, 'newl': '{<CR> {}<left><CR><esc>O'
  \, 'pads': '{<space> {  }<left><left>'
  \, 'back': '<expr> {<bs> ""'
  \, 'clos': '<expr> } ((CurChar() == "\}") ? "\<right>" : "\}")'
\}

let s:AutoPairQuote_Maps = {
  \  'open': '<expr> { (CurChar() != "\}" ? "\{\}<left>" : "<right>")'
  \, 'back': '<expr> {<bs> ""'
\}

fun! AutoPair_Sub(cmd, open, close)
  return substitute(substitute(a:cmd, '{', a:open, 'g'), '}', a:close, 'g')
endfun

fun! AutoPair(pair, ...)
  let override = get(a:000, 0, {})
  let extras = get(a:000, 1, {})
  let [open, close] = Chars(a:pair)
  let maps = extend({}, s:AutoPair_Maps)
  for [key, val] in items(extend(maps, extras))
    exe 'inoremap <buffer> '.AutoPair_Sub(get(override, key, val), open, close)
  endfor
endfun

fun! AutoPairQuote(char, ...)
  let override = get(a:000, 0, {})
  for [key, val] in items(s:AutoPairQuote_Maps)
    exe 'inoremap <buffer> '.AutoPair_Sub(val, a:char, a:char)
  endfor
endfun

fun! AutoPairCommon()
  call AutoPair('()')
  call AutoPair('[]')
  call AutoPair('{}')
  call AutoPair('<>', {'pads':'{<space> { '}, {'lte':'{= {='})
  call AutoPairQuote('"')
  call AutoPairQuote("'")
  call AutoPairQuote('`')
endfun




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Surround

fun! MapSurround(pair)
  let [a,z] = Chars(a:pair)
  let m = 'vnoremap S%s "yc'.a.''.z.'<esc>"yP'
  exe printf(m,a) | exe printf(m,z)
endfun

call MapSurround('()')
call MapSurround('[]')
call MapSurround('{}')
call MapSurround('<>')
call MapSurround("''")
call MapSurround('""')
call MapSurround('``')
call MapSurround('  ')
call MapSurround('**')
call MapSurround('__')

" Wrap the word or grouping in a pair
nmap <expr> <leader>( (CurChar() =~ "\[[({\]") ? "myv%\"_S('y" : "myviw\"_S('y"
nmap <expr> <leader>[ (CurChar() =~ "\[[({\]") ? "myv%\"_S['y" : "myviw\"_S['y"
nmap <expr> <leader>{ (CurChar() =~ "\[[({\]") ? "myv%\"_S{'y" : "myviw\"_S{'y"

" Convert the grouping to a different pair
noremap <leader><leader>( %r)<c-o>r(
noremap <leader><leader>[ %r]<c-o>r[
noremap <leader><leader>{ %r}<c-o>r{




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Comments

fun! CommentToggle(first, last)
  let cstr = substitute(&commentstring, '\v(\%)s@!', '%%', 'g')
  let match = '\V' . substitute('\^\s\*'.&commentstring, '%s', '\\(\\.\\*\\)', '')
  let should_uncomment = (getline(a:first) =~ match)
  for n in range(a:first, a:last)
    if should_uncomment
      let newline = substitute(getline(n), match, '\1', '')
    else
      let newline = printf(cstr, getline(n))
    endif
    call setline(n, newline)
  endfor
endfun
command! -range CommentToggle :call CommentToggle(<line1>, <line2>)

fun! TextBar(...)
  let com = exists('b:commentbar') ? b:commentbar : (len(&cms) ? &cms : '-')
  let pattern = a:0 ? a:1 : com
  let both = split(pattern, '%s')
  let prefix = trim(both[0])
  let suffix = (len(both) > 1) ? both[-1:][0] : ''
  let filler = prefix[-1:]
  let n = &textwidth - (virtcol('.') - 1) - len(prefix) - len(suffix)
  return prefix . repeat(filler, n) . suffix
endfun




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ MRU Files

fun! MRUSaveFiles()
  let thisfile = MRUThisFile()
  if !len(thisfile) | return | endif
  let mrufile = '~/.vim/.mru'
  let cmd = 'touch '.mrufile.';'
      \   . 'sed -i -e "\|'.thisfile.'|d" '.mrufile.';'
      \   . 'sed -i -e "/^\s*$/d" '.mrufile.';'
      \   . 'printf "'.thisfile.'\n$(cat '.mrufile.')" > '.mrufile
  let b:mrujob = ShellJob(cmd)
endfun

fun! MRUThisFile()
  let f = expand('%:p')
  return ((&buftype != '') || (f =~ '^/dev/')) ? '' : f
endfun

fun! MRUPrune()
  let cmd = "while read file ; do [ -f \"$file\" ] && echo \"$file\" ; done "
        \ . '<~/.vim/.mru >/tmp/vimmru'
        \ . ' ; mv /tmp/vimmru ~/.vim/.mru'
  let b:mrujob = ShellJob(cmd)
endfun
command! MRUPrune call MRUPrune()

augroup mru | au!
  au BufRead * call MRUSaveFiles()
  au BufWrite * call MRUSaveFiles()
augroup END




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Align

" TODO: fix sed calls so this can align on any printable character
command! -nargs=1 -range Align
        \ <line1>,<line2>!sed 's^<args>^•✔&^g'
                       \ |column -e -t -s "•"
                       \ |sed 's^  ✔^^g'




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Snippets

" Placeholder formats:
"   Unnamed -> %%%%
"   Named   -> %%name%%

fun! SnipFile(name)
  return '~/.vim/snips/'.&ft.'/'.tolower(a:name)
endfun

fun! SnipInsert(...)
  let name = a:0 ? a:1 : expand('<cword>')
  if (name == '')
    SnipList
  else
    let lvl = IndentLevel()
    normal "_diw
    exe 'r '.SnipFile(name)
    if lvl | exe "normal V']".lvl.'>' | endif
    normal kJ
    call SnipNext()
  endif
endfun

fun! SnipNext_Replace(txt)
  exe '%s/'.@p.'/'.a:txt.'/g'
  normal! `<
  startinsert
  call feedkeys("\<right>")
endfun

fun! SnipNext(...)
  call search('%%\w\{-}%%', 'c'.(a:0 ? a:1 : ''))
  normal "py3f%
  let placeholder = @p
  if placeholder =~ '%%\w'
    normal! v3f%l
    redraw!
    call feedkeys(":\<c-u>call SnipNext_Replace('')\<left>\<left>")
  else
    call feedkeys('"_c3f%')
  endif
endfun

" create/edit
command! -nargs=1 Snip exe 'split '.SnipFile(<q-args>)
command! -nargs=1 SnipInsert call SnipInsert(<q-args>)
command! SnipList call FuzzyFind('ls '.SnipFile(''), ':SnipInsert %s')




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Altfile
"       Set altfile based on visited files, not just edited files

fun! SetAltFile()
  let old = get(w:, 'curfile', '')
  let new = expand('%')
  if (old == new) | return | endif
  if !len(new) | return | endif
  let w:curfile = new
  let old_is_real_file = len(old) && !len(getbufvar(bufnr(old), '&buftype'))
  if old_is_real_file | let @# = old | endif
endfun

augroup altfile | au!
  au BufWinEnter * call SetAltFile()
augroup END




" }}}~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" {{{ Debugging

fun! DbgHighlight()
  let rootID = synIDtrans(synID(line('.'),col('.'), 1))
  let out  = ' '    . synIDattr(synID(line('.'),col('.'), 0) ,'name')
  let out .= ' → '  . synIDattr(rootID,                       'name')
  let out .= ' : {' . synIDattr(rootID, 'fg')
  let out .= '/'    . synIDattr(rootID, 'bg') . '} '
  for mod in split('bold italic reverse standout underline undercurl strikethrough')
    let out .= (synIDattr(rootID, mod) ? ' '.mod : '')
  endfor
  return out
endfun

nmap <leader>hs :echo DbgHighlight()<cr>




" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~}}}

" vim: set fdm=marker tw=80 sts=2 ts=2 sw=2 et :
