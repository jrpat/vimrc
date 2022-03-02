""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom Highlighting

syn keyword Keyword set lassign
syn match Keyword /\v<array set>/
syn match Keyword /\v<dict set>/
syn match Keyword /\v(^|\s)<variable>/

syn clear tclCommand

hi link tclRepeat Keyword

syn keyword PreProc source
syn match PreProc /\v<package require>/



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Variables

syn match tclVarRef /\v\$(\k|:){-}\(\k{-}\)/



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Proc Names

syn clear tclProcCommand
syn keyword tclProcCommand  apply coroutine return tailcall yield yieldto
syn keyword tclProcCommand  constructor

syn match tclProcCommand /\v<proc>\s{-}\S+/ contains=tclProcName
syn match tclProcCommand /\v<proc>\s{-}\{[^}]{-}\}/ contains=tclProcName
syn match tclProcCommand /\v<proc>\s{-}\"[^"]{-}\"/ contains=tclProcName
syn match tclProcCommand /\v<method>\s{-}\S+/ contains=tclProcName
syn match tclProcName /\v\s(\S+|\{[^}]{-}\}|\"[^"]{-}\")/ms=s+1 contained

hi link tclProcCommand Type
hi link tclProcName Function



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Namespace Names

syn match tclNamespaceCommand /\v<namespace eval>\s+\S+/ contains=tclNamespaceName
syn match tclNamespaceName /\v<namespace eval>\s+\S+/ms=s+14 contained

hi link tclNamespaceCommand Type
hi link tclNamespaceName Function



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Class Names

syn match tclClassCommand /\voo::class create\s+\S+/ contains=tclClassName
syn match tclClassName /\v<oo::class create>\s+\S+/ms=s+16 contained

syn match tclClassCommand /\voo::define\s+\S+/ contains=tclClassName
syn match tclClassName /\v<oo::define>\s+\S+/ms=s+10 contained

hi link tclClassCommand Type
hi link tclClassName Function



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" I don't use tk

if !get(b:, 'usestk', 0)
  syn clear tcltkWidget
  syn clear tcltkWidgetColor
  syn clear tcltkWidgetSwitch
  syn clear tcltkPackConf
  syn clear tcltkPackSwitch
  syn clear tcltkPackConfSwitch
endif


