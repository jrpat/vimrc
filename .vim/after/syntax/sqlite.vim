" Vim syntax file
" Language: SQL, SQLite
" License:  Vim

if exists('b:current_syntax') | finish | endif

syn case ignore


" Keywords - https://www.sqlite.org/lang_keywords.html
syn keyword sqlKeyword ABORT ACTION ADD AFTER ALL ALTER ALWAYS ANALYZE
syn keyword sqlKeyword AND AS ASC ATTACH AUTOINCREMENT BEFORE BEGIN
syn keyword sqlKeyword BETWEEN BY CASCADE CASE CAST CHECK COLLATE COLUMN
syn keyword sqlKeyword COMMIT CONFLICT CONSTRAINT CREATE CROSS CURRENT
syn keyword sqlKeyword CURRENT_DATE CURRENT_TIME CURRENT_TIMESTAMP
syn keyword sqlKeyword DATABASE DEFAULT DEFERRABLE DEFERRED DELETE DESC
syn keyword sqlKeyword DETACH DISTINCT DO DROP EACH ELSE END ESCAPE
syn keyword sqlKeyword EXCEPT EXCLUDE EXCLUSIVE EXISTS EXPLAIN FAIL
syn keyword sqlKeyword FILTER FIRST FOLLOWING FOR FOREIGN FROM FULL
syn keyword sqlKeyword GENERATED GLOB GROUP GROUPS HAVING IF IGNORE
syn keyword sqlKeyword IMMEDIATE IN INDEX INDEXED INITIALLY INNER INSERT
syn keyword sqlKeyword INSTEAD INTERSECT INTO IS ISNULL JOIN KEY LAST
syn keyword sqlKeyword LEFT LIKE LIMIT MATCH NATURAL NO NOT NOTHING
syn keyword sqlKeyword NOTNULL NULL NULLS OF OFFSET ON OR ORDER OTHERS
syn keyword sqlKeyword OUTER OVER PARTITION PLAN PRAGMA PRECEDING
syn keyword sqlKeyword PRIMARY QUERY RAISE RANGE RECURSIVE REFERENCES
syn keyword sqlKeyword REGEXP REINDEX RELEASE RENAME REPLACE RESTRICT
syn keyword sqlKeyword RIGHT ROLLBACK ROW ROWS SAVEPOINT SELECT SET
syn keyword sqlKeyword TABLE TEMP TEMPORARY THEN TIES TO TRANSACTION
syn keyword sqlKeyword TRIGGER UNBOUNDED UNION UNIQUE UPDATE USING
syn keyword sqlKeyword VACUUM VALUES VIEW VIRTUAL WHEN WHERE WINDOW WITH
syn keyword sqlKeyword WITHOUT

" https://sqlite.org/forum/forumpost/9b020fbab7db4cd45dab7f8e37a7b2540e4e28467654c3b1cf02c21e46dfaf21
syn keyword sqlKeyword STORED

" Data Types (Core) - https://www.sqlite.org/datatype3.html
syn keyword sqlType TEXT NUMERIC INTEGER REAL BLOB
syn keyword sqlSpecial NULL FALSE TRUE
syn keyword sqlType BOOLEAN

" Collation - https://sqlite.org/datatype3.html#collating_sequences
syn keyword sqlKeyword NOCASE BINARY RTRIM

" Operators - https://www.sqlite.org/lang_expr.html
syn keyword sqlOperator COLLATE IS NOT IN LIKE GLOB MATCH REGEXP AND OR

" Scalar Functions - https://sqlite.org/lang_corefunc.html
syn keyword sqlFunction abs changes char coalesce glob hex ifnull iif
syn keyword sqlFunction instr last_insert_rowid length like likelihood
syn keyword sqlFunction likely load_extension lower ltrim max min nullif
syn keyword sqlFunction printf quote random randomblob replace round
syn keyword sqlFunction rtrim soundex sqlite_compileoption_get
syn keyword sqlFunction sqlite_compileoption_used sqlite_offset
syn keyword sqlFunction sqlite_source_id sqlite_version substr substring
syn keyword sqlFunction total_changes trim typeof unicode unlikely upper
syn keyword sqlFunction zeroblob

" Math functions - https://sqlite.org/lang_mathfunc.html
syn keyword sqlFunction acos acosh asin asinh atan atan2 atanh ceil
syn keyword sqlFunction ceiling cos cosh degrees exp floor ln log log
syn keyword sqlFunction log10 log2 mod pi pow power radians sin sinh
syn keyword sqlFunction sqrt tan tanh trunc 

" Date/Time Functions - https://sqlite.org/lang_datefunc.html
syn keyword sqlFunction date time datetime julianday strftime

" Aggregate Functions - https://sqlite.org/lang_aggfunc.html
syn keyword sqlFunction avg count count group_concat max min sum total

" Window Functions - https://sqlite.org/windowfunctions.html#biwinfunc
syn keyword sqlFunction row_number rank dense_rank percent_rank
syn keyword sqlFunction cume_dist ntile lag lead first_value last_value
syn keyword sqlFunction nth_value

" JSON Functions - https://sqlite.org/json1.html
syn keyword sqlFunction json json_array json_array_length json_extract
syn keyword sqlFunction json_insert json_object json_patch json_remove
syn keyword sqlFunction json_replace json_set json_type json_valid
syn keyword sqlFunction json_quote json_group_array json_group_object
syn keyword sqlFunction json_each json_tree

" Strings - https://www.sqlite.org/lang_keywords.html
syn region sqlString  start=+'+  skip=+\\\\\|\\'+  end=+'+

" Identifiers - https://www.sqlite.org/lang_keywords.html
syn region sqlIdent   start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region sqlIdent   start=+\[+ skip=+\\\\\|\\"+  end=+\]+
syn region sqlIdent   start=+`+  skip=+\\\\\|\\"+  end=+`+

" Numbers - https://www.sqlite.org/lang_expr.html
syn match sqlNumber "-\=\<[0-9]*\>"
syn match sqlNumber "-\=\<[0-9]*\.[0-9]*\>"
syn match sqlNumber "-\=\<[0-9][0-9]*e[+-]\=[0-9]*\>"
syn match sqlNumber "-\=\<[0-9]*\.[0-9]*e[+-]\=[0-9]*\>"
syn match sqlNumber "\<0x[abcdefABCDEF0-9]*\>"

" Comments - https://www.sqlite.org/lang_comment.html
syn region sqlComment start="/\*"  end="\*/" contains=sqlTodo
syn match sqlComment "--.*$" contains=sqlTodo
syn keyword sqlTodo contained TODO FIXME XXX DEBUG NOTE contained
syn sync ccomment sqlComment


" Default Highlighting
hi link sqlSpecial  Special
hi link sqlKeyword  Keyword
hi link sqlType     Type 
hi link sqlOperator Operator
hi link sqlFunction Function
hi link sqlString   String
hi link sqlIdent    Identifier
hi link sqlNumber   Number
hi link sqlComment  Comment
hi link sqlTodo     Todo


let b:current_syntax = 'sql'

