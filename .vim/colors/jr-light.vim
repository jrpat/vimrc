""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic Setup

hi clear
syn reset
let g:colors_name = "mia-light"
set bg=light


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI

hi Normal             cterm=NONE      ctermbg=NONE  ctermfg=00

hi Cursor             cterm=NONE      ctermbg=8     ctermfg=15
hi CursorLine         cterm=NONE      ctermbg=254   ctermfg=NONE
hi CursorColumn       cterm=NONE      ctermbg=255
hi ColorColumn        cterm=NONE      ctermbg=255   ctermfg=NONE
hi Directory          cterm=NONE      ctermbg=NONE  ctermfg=5 
hi Folded             cterm=NONE      ctermbg=NONE  ctermfg=8 
hi LineNr             cterm=NONE      ctermbg=NONE  ctermfg=251
hi CursorLineNr       cterm=NONE      ctermbg=NONE  ctermfg=248
hi MatchParen         cterm=NONE      ctermbg=8     ctermfg=15
hi ModeMsg            cterm=NONE      ctermbg=NONE  ctermfg=8 
hi NonText            cterm=NONE      ctermbg=NONE  ctermfg=251
hi Pmenu              cterm=NONE      ctermbg=255   ctermfg=0 
hi PmenuSel           cterm=NONE      ctermbg=4     ctermfg=15
hi PmenuSbar          cterm=NONE      ctermbg=245   ctermfg=NONE
hi QuickFixLine       cterm=NONE      ctermbg=252   ctermfg=NONE
hi Search             cterm=NONE      ctermbg=4     ctermfg=15
hi IncSearch          cterm=NONE      ctermbg=4     ctermfg=15
hi Visual             cterm=NONE      ctermbg=6     ctermfg=15
hi WarningMsg         cterm=NONE      ctermbg=NONE  ctermfg=1 
hi ErrorMsg           cterm=NONE      ctermbg=1     ctermfg=15

hi VertSplit          cterm=NONE      ctermbg=254   ctermfg=254
hi StatusLine         cterm=NONE      ctermbg=8     ctermfg=0
hi StatusLineNC       cterm=NONE      ctermbg=252   ctermfg=243
hi StatusLineTerm     cterm=NONE      ctermbg=8     ctermfg=0
hi StatusLineTermNC   cterm=NONE      ctermbg=252   ctermfg=243
hi TabLineFill        cterm=NONE      ctermbg=254   ctermfg=NONE

hi QuickFixLine       cterm=NONE      ctermbg=250    ctermfg=NONE
hi qfLineNr           cterm=NONE      ctermbg=NONE  ctermfg=1 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax

hi Comment            cterm=NONE      ctermbg=NONE  ctermfg=08
hi Constant           cterm=NONE      ctermbg=NONE  ctermfg=09
hi String             cterm=NONE      ctermbg=NONE  ctermfg=02
hi Character          cterm=NONE      ctermbg=NONE  ctermfg=01
hi Number             cterm=NONE      ctermbg=NONE  ctermfg=09
hi Boolean            cterm=NONE      ctermbg=NONE  ctermfg=09
hi Float              cterm=NONE      ctermbg=NONE  ctermfg=09

hi Identifier         cterm=NONE      ctermbg=NONE  ctermfg=01
hi Function           cterm=NONE      ctermbg=NONE  ctermfg=04

hi Statement          cterm=NONE      ctermbg=NONE  ctermfg=01
hi Conditional        cterm=NONE      ctermbg=NONE  ctermfg=05
hi Repeat             cterm=NONE      ctermbg=NONE  ctermfg=03
hi Label              cterm=NONE      ctermbg=NONE  ctermfg=03
hi Operator           cterm=NONE      ctermbg=NONE  ctermfg=00
hi Keyword            cterm=NONE      ctermbg=NONE  ctermfg=05
hi Exception          cterm=NONE      ctermbg=NONE  ctermfg=01

hi PreProc            cterm=NONE      ctermbg=NONE  ctermfg=03
hi Include            cterm=NONE      ctermbg=NONE  ctermfg=04
hi Define             cterm=NONE      ctermbg=NONE  ctermfg=05
hi Macro              cterm=NONE      ctermbg=NONE  ctermfg=01
hi PreCondit          cterm=NONE      ctermbg=NONE  ctermfg=03

hi Type               cterm=NONE      ctermbg=NONE  ctermfg=03
hi StorageClass       cterm=NONE      ctermbg=NONE  ctermfg=03
hi Structure          cterm=NONE      ctermbg=NONE  ctermfg=05
hi Typedef            cterm=NONE      ctermbg=NONE  ctermfg=03

hi Special            cterm=NONE      ctermbg=NONE  ctermfg=06
hi SpecialChar        cterm=NONE      ctermbg=NONE  ctermfg=06
hi Tag                cterm=NONE      ctermbg=NONE  ctermfg=03
hi Delimiter          cterm=NONE      ctermbg=NONE  ctermfg=14
hi SpecialComment     cterm=NONE      ctermbg=NONE  ctermfg=06
hi Debug              cterm=NONE      ctermbg=NONE  ctermfg=01

hi Title              cterm=NONE      ctermbg=NONE  ctermfg=06

hi Error              cterm=NONE      ctermbg=01    ctermfg=00

hi Todo               cterm=NONE      ctermbg=NONE  ctermfg=08

hi vimGroup           cterm=NONE      ctermbg=NONE  ctermfg=4


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Personalizations

hi EchoGood ctermfg=2
hi EchoBad  ctermfg=1

