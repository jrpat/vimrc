call AutoPairCommon()
call AutoPairQuote('`')
call SwapUnderscoreHyphen()

let b:commentbar = '-'
setl commentstring=--\ %s

inoremap <buffer> ;nn NOT NULL
inoremap <buffer> ;pk PRIMARY KEY
inoremap <buffer> ;fk FOREIGN KEY ()<left>
inoremap <buffer> ;ref REFERENCES X(___)<esc>FXs
inoremap <buffer> ;od ON DELETE CASCADE
inoremap <buffer> ;ou ON UPDATE CASCADE

inoremap <buffer> ;eq EXPLAIN QUERY PLAN

xnoremap <buffer> ii a(V

nnoremap <buffer> <leader>die yyPV:s/ AS//e<cr>$F "_C;<esc>0cwDROP<esc>ea IF EXISTS<esc>0

fun! SQLite_SetupRepl()
  TermEval .headers on
  TermEval .mode columns
  TermEval .prompt "\nsqlite> " "   ...> "
endfun

nnoremap <buffer> <leader>tr :call SQLite_SetupRepl()<cr>
nnoremap <buffer> <leader>tt :Term sqlite3 



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Automatically Uppercase Keywords

fun! s:Up(word)
  " Do not uppercase word if inside a larger word
  if CurChar(-1 * (len(a:word) + 1)) =~ '\w' | return a:word | endif
  
  " Do not uppercase word if within a comment or string
  if CurSyntax() =~# 'Comment\|String' | return a:word | endif

  " Let user specify other cases in which not to uppercase
  if exists('*Sql_Should_Uppercase')
    if !Sql_Should_Uppercase() | return a:word | endif
  endif

  return toupper(a:word)
endfun

fun! s:SQLKeyword(...)
  for word in a:000
    let w = tolower(word)
    exe printf('iabbrev <expr><buffer> %s <SID>Up("%s")', w, w)
  endfor
endfun

command -buffer -nargs=+ SQLKeyword call s:SQLKeyword(<f-args>)


" Keywords - https://www.sqlite.org/lang_keywords.html
SQLKeyword ABORT ACTION ADD AFTER ALL ALTER ALWAYS ANALYZE
SQLKeyword AND AS ASC ATTACH AUTOINCREMENT BEFORE BEGIN
SQLKeyword BETWEEN BY CASCADE CASE CAST CHECK COLLATE COLUMN
SQLKeyword COMMIT CONFLICT CONSTRAINT CREATE CROSS CURRENT
SQLKeyword CURRENT_DATE CURRENT_TIME CURRENT_TIMESTAMP
SQLKeyword DATABASE DEFAULT DEFERRABLE DEFERRED DELETE DESC
SQLKeyword DETACH DISTINCT DO DROP EACH ELSE END ESCAPE
SQLKeyword EXCEPT EXCLUDE EXCLUSIVE EXISTS EXPLAIN FAIL
SQLKeyword FILTER FIRST FOLLOWING FOR FOREIGN FROM FULL
SQLKeyword GENERATED GLOB GROUP GROUPS HAVING IF IGNORE
SQLKeyword IMMEDIATE IN INDEX INDEXED INITIALLY INNER INSERT
SQLKeyword INSTEAD INTERSECT INTO IS ISNULL JOIN KEY LAST
SQLKeyword LEFT LIKE LIMIT MATCH NATURAL NO NOT NOTHING
SQLKeyword NOTNULL NULL NULLS OF OFFSET ON OR ORDER OTHERS
SQLKeyword OUTER OVER PARTITION PLAN PRAGMA PRECEDING
SQLKeyword PRIMARY QUERY RAISE RANGE RECURSIVE REFERENCES
SQLKeyword REGEXP REINDEX RELEASE RENAME REPLACE RESTRICT
SQLKeyword RIGHT ROLLBACK ROW ROWS SAVEPOINT SELECT SET
SQLKeyword TABLE TEMP TEMPORARY THEN TIES TO TRANSACTION
SQLKeyword TRIGGER UNBOUNDED UNION UNIQUE UPDATE USING
SQLKeyword VACUUM VALUES VIEW VIRTUAL WHEN WHERE WINDOW WITH
SQLKeyword WITHOUT

" https://sqlite.org/forum/forumpost/9b020fbab7db4cd45dab7f8e37a7b2540e4e28467654c3b1cf02c21e46dfaf21
SQLKeyword STORED

" Data Types (Core) - https://www.sqlite.org/datatype3.html
SQLKeyword TEXT NUMERIC INTEGER REAL BLOB
SQLKeyword NULL FALSE TRUE
SQLKeyword BOOLEAN

" Operators - https://www.sqlite.org/lang_expr.html
SQLKeyword COLLATE IS NOT IN LIKE GLOB MATCH REGEXP AND OR

" Triggers - https://sqlite.org/lang_createtrigger.html
SQLKeyword OLD NEW

" Upsert - https://sqlite.org/lang_upsert.html
SQLKeyword EXCLUDED

" Collation - https://sqlite.org/datatype3.html#collating_sequences
SQLKeyword NOCASE BINARY RTRIM

