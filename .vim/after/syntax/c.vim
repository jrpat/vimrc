syn keyword cType u8 u16 u32 u64
syn keyword cType i8 i16 i32 i64

syn match cFunction /\v^\k{-}\s*\(/me=e-1
hi link cFunction Function

hi link cPreCondit Macro

