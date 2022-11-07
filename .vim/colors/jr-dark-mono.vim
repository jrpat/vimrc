""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setup

hi clear
syn reset
let g:colors_name = "jr-dark-mono"
set bg=dark


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI

hi Normal             cterm=NONE      ctermbg=NONE  ctermfg=15

hi Cursor             cterm=NONE      ctermbg=8     ctermfg=15
hi CursorLine         cterm=NONE      ctermbg=8     ctermfg=NONE
hi CursorColumn       cterm=NONE      ctermbg=12    ctermfg=NONE
hi ColorColumn        cterm=NONE      ctermbg=12    ctermfg=NONE
hi Directory          cterm=NONE      ctermbg=NONE  ctermfg=4
hi Folded             cterm=NONE      ctermbg=NONE  ctermfg=8
hi LineNr             cterm=NONE      ctermbg=NONE  ctermfg=8
hi CursorLineNr       cterm=NONE      ctermbg=NONE  ctermfg=246
hi MatchParen         cterm=NONE      ctermbg=8     ctermfg=15
hi ModeMsg            cterm=NONE      ctermbg=NONE  ctermfg=6
hi NonText            cterm=NONE      ctermbg=NONE  ctermfg=0
hi Pmenu              cterm=NONE      ctermbg=237   ctermfg=252
hi PmenuSel           cterm=NONE      ctermbg=4     ctermfg=16
hi PmenuSbar          cterm=NONE      ctermbg=245   ctermfg=NONE
hi QuickFixLine       cterm=NONE      ctermbg=252   ctermfg=NONE
hi Search             cterm=NONE      ctermbg=2     ctermfg=0
hi IncSearch          cterm=NONE      ctermbg=2     ctermfg=0
hi Visual             cterm=NONE      ctermbg=8    ctermfg=15
hi WarningMsg         cterm=NONE      ctermbg=NONE  ctermfg=1
hi ErrorMsg           cterm=NONE      ctermbg=1     ctermfg=16

hi VertSplit          cterm=NONE      ctermbg=233   ctermfg=233
hi StatusLine         cterm=BOLD      ctermbg=8     ctermfg=16
hi StatusLineNC       cterm=NONE      ctermbg=235   ctermfg=8
hi StatusLineTerm     cterm=NONE      ctermbg=8     ctermfg=232
hi StatusLineTermNC   cterm=NONE      ctermbg=235   ctermfg=8

hi TabLineFill        cterm=NONE      ctermbg=16    ctermfg=NONE
hi TabLine            cterm=NONE      ctermbg=16    ctermfg=240
hi TabLineSel         cterm=NONE      ctermbg=0     ctermfg=248

hi QuickFixLine       cterm=NONE      ctermbg=53    ctermfg=NONE
hi qfLineNr           cterm=NONE      ctermbg=NONE  ctermfg=9

hi netrwTreeBar       cterm=NONE      ctermbg=NONE  ctermfg=8


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

hi Comment            cterm=NONE      ctermbg=NONE  ctermfg=08
hi Constant           cterm=NONE      ctermbg=NONE  ctermfg=15
hi String             cterm=NONE      ctermbg=NONE  ctermfg=02
hi Character          cterm=NONE      ctermbg=NONE  ctermfg=02
hi Number             cterm=NONE      ctermbg=NONE  ctermfg=15
hi Boolean            cterm=NONE      ctermbg=NONE  ctermfg=15
hi Float              cterm=NONE      ctermbg=NONE  ctermfg=15

hi Identifier         cterm=NONE      ctermbg=NONE  ctermfg=15
hi Function           cterm=NONE      ctermbg=NONE  ctermfg=04

hi Statement          cterm=NONE      ctermbg=NONE  ctermfg=01
hi Conditional        cterm=NONE      ctermbg=NONE  ctermfg=05
hi Repeat             cterm=NONE      ctermbg=NONE  ctermfg=05
hi Label              cterm=NONE      ctermbg=NONE  ctermfg=05
hi Operator           cterm=NONE      ctermbg=NONE  ctermfg=15
hi Keyword            cterm=NONE      ctermbg=NONE  ctermfg=15
hi Exception          cterm=NONE      ctermbg=NONE  ctermfg=15

hi PreProc            cterm=NONE      ctermbg=NONE  ctermfg=15
hi Include            cterm=NONE      ctermbg=NONE  ctermfg=15
hi Define             cterm=NONE      ctermbg=NONE  ctermfg=15
hi Macro              cterm=NONE      ctermbg=NONE  ctermfg=15
hi PreCondit          cterm=NONE      ctermbg=NONE  ctermfg=15

hi Type               cterm=NONE      ctermbg=NONE  ctermfg=15
hi StorageClass       cterm=NONE      ctermbg=NONE  ctermfg=15
hi Structure          cterm=NONE      ctermbg=NONE  ctermfg=15
hi Typedef            cterm=NONE      ctermbg=NONE  ctermfg=15

hi Special            cterm=NONE      ctermbg=NONE  ctermfg=15
hi SpecialChar        cterm=NONE      ctermbg=NONE  ctermfg=10
hi Tag                cterm=NONE      ctermbg=NONE  ctermfg=15
hi Delimiter          cterm=NONE      ctermbg=NONE  ctermfg=15
hi SpecialComment     cterm=NONE      ctermbg=NONE  ctermfg=15
hi Debug              cterm=NONE      ctermbg=NONE  ctermfg=15

hi Title              cterm=NONE      ctermbg=NONE  ctermfg=15

hi Error              cterm=NONE      ctermbg=01    ctermfg=15

hi Todo               cterm=NONE      ctermbg=NONE  ctermfg=08

hi vimGroup           cterm=NONE      ctermbg=NONE  ctermfg=15


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personalizations

hi EchoGood ctermfg=2
hi EchoBad  ctermfg=1


