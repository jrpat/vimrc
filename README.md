# My Vim Setup

Here for your perusal. Steal what you like, ignore what you don't. Do
what you will with it ;)

Below I describe the high-level ideas. As always, check out the code for
the real goodies.


## No Plugins *(!)*

I've been using vim for 15+ years now, and have gone through a number of
config iterations. They all involved many plugins. There's nothing wrong
with plugins, but this time I wanted to do things a little
differently...

I implemented all desired functionality as minimally as reasonably¹
possible in plain vimscript. This has let me vim's built-in features² on
a deeper level, explore vimscript³, and consider what features
I actually want. The goal is to mold the tool to my way of working
instead of the other way around.

> ¹ While still being ergonomic and featureful  <br>
> ² So... so many features                      <br>
> ³ Quirky, but not as bad as its reputation    <br>


### Plugin-Like Functionality

I implemented a lot of functionality that I used to get from plugins in
plain vimscript.

All of these features combined are implemented in about the same amount
of code as a single typical vim plugin. This is because they don't have
to be robust enough to support Every Conceivable Use-Case, or provide
config variables for Every Conceivable Option. Instead, I can tweak the
code to work the way I want. And that's kind of the point. Vim is
extremely moldable! Make it work for you.

Each of these has its own section in `.vimrc`, so you can go check out
how they work and/or steal them and customize them to suit you.

I note line counts below as a primitive heuristic for complexity. These
are normal readable lines, not code-golf.

Listed roughly in order of how often I use them each day:

- **Auto-Pair** *(~30 lines)*
  - Similar to [auto-pairs](https://github.com/jiangmiao/auto-pairs)
  - Automatically insert closing paren/bracket/brace/*etc* when typing
    the opening one
  - Skipping over the closing character. So if you type `)` next to
    a `)`, the cursor skips over it instead of doubling it up.
  - Deleting an opening character deletes the closing character.
    - I didn't want to `imap <expr> <bs>` so right now it is just
      essentially `imap <expr> (<bs> ""`, so it only deletes the opening
      character if you backspace right away. I might change this in the
      future.
  - Some other niceties
- **Comments** *(~15 lines)*
  - Comment/uncomment the selected lines, as per
    [commentary](https://github.com/tpope/vim-commentary)
- **Fuzzy Find** *(~30 lines)*
  - Integrates [fzy](https://github.com/jhawthorn/fzy) to select all
    kinds of things like files, open buffers, or any other list of
    things
- **Most-Recently-Used files** *(~20 lines)*
  - Keeps track of recently opened files, and uses `fzy` to easily open
    them back later
  - Mostly implemented with `sed`
  - Prune non-existent files with `:MRUPrune` *(another 7 lines)*
- **Terminal/REPL Interaction** *(~75 lines)*
  - Makes interacting with a `:terminal` very easy. You can:
      - send any text to the terminal (current line, current selection,
        etc...)
      - associate a different terminal with each buffer *(for instance,
        send lua code to a lua repl, and tcl code to a tclsh
        repl)*. Each buffer has a "target" terminal.
      - a terminal's target is itself, so you can easily eval history
      - *...more stuff...*
  - This is my most complex "plugin-like". By removing some of the
    features I don't use and refactoring what's left, I could probably
    get it down to about 40 lines and have a cleaner feature set.
- **Per-project `vimrc`** *(7 lines)*
  - A simple mapping to load a `.vimrc` at the top level of a git repo,
    which I have ended up using a lot for project-specific tasks, imaps,
    syntax highlighting, etc...
- **Directory Browsing** *(13 lines, including netrw config)*
  - Simple browsing via `-` key à la
    [dirvish](https://github.com/justinmk/vim-dirvish) or
    [vinegar](https://github.com/tpope/vim-vinegar) with the creature
    comforts like selecting the current file automatically.
- **Snippets** *(~35 lines)*
  - Similar to [snipmate](https://github.com/garbas/vim-snipmate) or
    [neosnippet](https://github.com/Shougo/neosnippet.vim)
  - Different snippets per filetype
  - Supports one-off and named placeholders
  - `foo\<tab>` to insert the `foo` snippet
  - Trivial to create snippets, so I can create a standard set for
    a language, or just a few for my current task:
    - Each snippet stored in its own file in `~/.vim/snips/<filetype>`
    - `:Snip <name>` opens a split window with the snippet file
    - `%%%%` is a one-off placeholder
    - `%%name%%` is a named placeholder. Filling it in will fill in all
      other placeholders with the same name
    - Simple example:
    ```text
    for (%%%% %%var%%=0; %%var%% < %%%%; %%var%%++) {
        %%%%
    }
    ```
    - Snippets are inserted at the correct indent level, though they are
      written left-aligned like normal files.
  - In insert mode, `c-]`/`c-\` jump to the next/previous placeholder
- **Async Tasks** *(~30 lines)*
  - Easily launch background tasks, and see their results in the
    quickfix window, if desired. Similar to
    [dispatch](https://github.com/tpope/vim-dispatch).
- **Surround** *(26 lines, including mappings)*
  - Similar to tpope's [surround](https://github.com/tpope/vim-surround)
  - Wrap the selected text in parens/brackets/*etc...*
  - Convert a grouping into another (for instance `(xyz)` → `[xyz]`)
  - Some other niceties
- **Align text by delimiters** *(~2 lines)*
  - Similar to [easy-align](https://github.com/junegunn/vim-easy-align)
  - Implemented entirely with `sed` and `column`

-----

## General Usage

### Small "Life-Changers"

##### `<c-j>` and `<c-k>` to jump multiple lines at once.
These make it easy enough to hop around the visible region (and scroll
quickly), that they eliminated any need or desire for plugins like
easymotion.

##### `nmap <leader>w :w<cr>` and `nmap <leader>q :q<cr>`
These just make it easier to write and quit windows.

##### Swap `'` and <code>&DiacriticalGrave;</code>
I prefer jumping to the exact location of the mark instead of the
beginning of its line, and `'` is easier to reach than
<code>&DiacriticalGrave;</code>.

##### `<leader>v` family of maps to execute vimscript from the current buffer
These often make good alternatives to the command-line, and really open
up the ability to mold vim in ad-hoc ways. I got the idea from emacs
[ielm](https://www.emacswiki.org/emacs/InferiorEmacsLispMode),
and now I use it dozens of times each day in vim.


### Heavy use of `imap`s

I generally use `;` followed by one or two characters to insert
commonly-used text. For instance, in C files, I map `;d` to `#define
` and `;i` to `#include `.

Some particularly helpful ones for writing vimscript are in
`.vim/after/ftplugin/vim.vim` and the `Command-Line Conveniences`
subsection in `.vimrc`.


### Heavy use of ctags

A *much* simpler and lighter alternative to things like
[LSP](https://microsoft.github.io/language-server-protocol/). It has
good support in vanilla vim, and doesn't require you to keep
a background daemon running. 



### Lots of ftplugins

I have a lot of customizations for each language, mainly falling into
these categories:

- imaps - Shortcuts to save keystrokes
- repl - I try to develop in a repl-like workflow in every language
- tools - Shortcuts for piping to / integrating with language-specific tools


### Mappings

Check out the `Mappings` section of `.vimrc` for all the global
mappings. They're generally organized mnemonically, though the mnemonic
[may not be obvious at first unless
you're](https://www.python.org/dev/peps/pep-0020/#id2) me.



### Things I don't love

I have tried to intelligently remap `-` to `_` and vice versa, so that
I can do `snake_case` variables without hitting shift, while also typing
a minus or sql/lua comment without hitting shift. However, I've yet to
come up with a heuristic that does the right thing often enough. I still
trip on it a few times each day. But on balance, it saves me more
keystrokes than it costs me by 10x or more.


## Vim[script] Resources

- The manual (`:h`, [vimhelp.org](https://vimhelp.org/),
  [quickref](https://vimhelp.org/quickref.txt.html)).
  - It's incredibly thorough, but sometimes it can be hard to find
    exactly what you need if you don't already know what it's
    called. C'est la vie. I still use it multiple times each day.
  - If you have a few minutes to kill, try browsing a random
    section. You're guaranteed to learn something new!

- [Learn Vim the Hard Way](https://learnvimscriptthehardway.stevelosh.com/)
  - I found myself referencing this site frequently as I began digging
    deeper into vimscript. I still refer back to it if I can't remember
    the exact name of some function, but I know what chapter it's in.

- Any of [tpope](https://github.com/tpope)'s plugins
  - "There's gold in them thar hills!"

- #vim on [Libera IRC](https://libera.chat/)
  - The people there are generally knowledgeable and helpful


