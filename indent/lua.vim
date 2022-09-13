" Vim indent file
" Language:	Lua script
" Maintainer:	Marcus Aurelius Farias <masserahguard-lua 'at' yahoo com>
" First Author:	Max Ischenko <mfi 'at' ukr.net>
" Last Change:	2020 May 17

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetLuaIndent()

" To make Vim call GetLuaIndent() when it finds '\s*end' or '\s*until'
" on the current line ('else' is default and includes 'elseif').
setlocal indentkeys+=0=end,0=until,0=}

let b:undo_indent = "setlocal indentexpr< indentkeys<"

" Only define the function once.
if exists("*GetLuaIndent")
  finish
endif

function! s:BracesBalance(line, mode)
  " a:line -> the line to be checked as a string
  " a:mode = 1 -> compute the indentation/unindentation for the next line
  " a:mode = 2 -> compute the unindentation amout for the current line
  let l:idx = 0
  let l:indents = 0
  let l:unindents = 0
  let l:indentIdx = -1
  let l:foundIndentIdx = 0

  while l:idx < len(a:line)

    if !l:foundIndentIdx
      if a:line[l:idx] =~# '\s'
        let l:indentIdx = l:idx
      else
        let l:foundIndentIdx = 1
      endif
    endif

    if a:line[l:idx] ==# "{"
      let indents += 1
    elseif a:line[l:idx] ==# "}"
      if l:indents > 0
        " This line had an "{" that's now closed by this "}"
        let l:indents -= 1
      else
        if a:mode == 1 && l:indentIdx != l:idx-1 || a:mode == 2 && l:indentIdx == l:idx-1
          " Mode 1: This line has an unmatched "}" in the middle or end so we
          " should unindent the next line.
          " Mode 2: This line has an unmatched "}" at the beginning so we
          " should unindent it.
          let l:unindents += 1
        endif
      endif
    endif

    let l:idx += 1

  endwhile

  if a:mode == 1
    return l:indents - l:unindents
  elseif a:mode == 2
    return l:unindents
  else
    return 0
  endif
endfunction

function! GetLuaIndent()
  " Find a non-blank line above the current line.
  let l:prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if l:prevlnum == 0
    return 0
  endif

  " Add a 'shiftwidth' after lines that start a block:
  " 'function', 'if', 'for', 'while', 'repeat', 'else', 'elseif'
  let l:ind = indent(l:prevlnum)
  let l:prevline = getline(l:prevlnum)
  let l:midx = match(l:prevline, '^\C\s*\%(if\>\|for\>\|while\>\|repeat\>\|else\>\|elseif\>\|do\>\|then\>\)')
  if l:midx == -1
    let l:midx = match(l:prevline, '\C\<function\>\s*\%(\k\|[.:]\)\{-}\s*(')
  endif

  if l:midx != -1
    " Add 'shiftwidth' if what we found previously is not in a comment and
    " an "end" or "until" is not present on the same line.
    if synIDattr(synID(l:prevlnum, l:midx + 1, 1), "name") != "luaComment" && l:prevline !~# '\<end\>\|\<until\>'
      let l:ind += shiftwidth()
    endif
  else
    " No indentation based on keywords, let's check for tables
    if l:prevline !~# '^\s*}\s*$'
      " A bare } results in the same indentation on the line below (it's going
      " to be unindented immediately when typed). If the previous line is more
      " complex, scan it looking for braces are and add 'shiftwidth' when
      " there are unbalanced { on the previous line
      let l:prevBalance = s:BracesBalance(l:prevline, 1)
      let l:ind += l:prevBalance * shiftwidth()
    endif
  endif

  " Subtract a 'shiftwidth' on end, else, elseif, until
  " This requires 'indentkeys'.
  let l:currline = getline(v:lnum)
  let l:midx = match(l:currline, '^\C\s*\%(end\|else\|until\)')
  if l:midx != -1 && synIDattr(synID(v:lnum, l:midx + 1, 1), "name") != "luaComment"
    let l:ind -= shiftwidth()
  endif

  " Subtract 'shiftwidth' when typing } on the current line
  " This requires 'indentkeys'.
  let l:unindents = s:BracesBalance(l:currline, 2)
  if l:unindents > 0
    let l:ind -= l:unindents * shiftwidth()
  endif

  return l:ind
endfunction

" vim: et ts=8 sw=2
