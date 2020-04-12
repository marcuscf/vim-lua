" Vim indent file
" Language:	Lua script
" Maintainer:	Marcus Aurelius Farias <masserahguard-lua 'at' yahoo com>
" First Author:	Max Ischenko <mfi 'at' ukr.net>
" Last Change:	2020 Apr 11

" Only load this indent file when no other was loaded.
if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal indentexpr=GetLuaIndent()

" To make Vim call GetLuaIndent() when it finds '\s*end' or '\s*until'
" on the current line ('else' is default and includes 'elseif').
setlocal indentkeys+=0=end,0=until,}

" Only define the function once.
if exists("*GetLuaIndent")
  finish
endif

function s:PreviousLineBracesBalance(line)
  let idx = 0
  let depth = 0

  while idx < len(a:line)

    if a:line[idx] ==# "{"
      let depth += 1
    elseif a:line[idx] ==# "}"
      " Avoid going below zero because a line like this
      " }, {
      " is not balanced and should trigger indentation on the line below
      let depth = depth == 0 ? 0 : depth - 1
    endif

    let idx += 1

  endwhile

  return depth
endfunction

function s:CountUnindents(line)
  let idx = 0
  let unindents = 0
  let indents = 0

  while idx < len(a:line)

    if a:line[idx] ==# "{"
      " This line has an "{"
      let indents += 1
    elseif a:line[idx] ==# "}"
      if indents > 0
        " This line had an "{" that's now closed by this "}"
        let indents -= 1
      else
        " This line has an unmatched "}" so we should unindent it
        let unindents += 1
      endif
    endif

    let idx += 1

  endwhile

  return unindents
endfunction

function! GetLuaIndent()
  " Find a non-blank line above the current line.
  let prevlnum = prevnonblank(v:lnum - 1)

  " Hit the start of the file, use zero indent.
  if prevlnum == 0
    return 0
  endif

  " Add a 'shiftwidth' after lines that start a block:
  " 'function', 'if', 'for', 'while', 'repeat', 'else', 'elseif'
  let ind = indent(prevlnum)
  let prevline = getline(prevlnum)
  let midx = match(prevline, '^\s*\%(if\>\|for\>\|while\>\|repeat\>\|else\>\|elseif\>\|do\>\|then\>\)')
  if midx == -1
    let midx = match(prevline, '\<function\>\s*\%(\k\|[.:]\)\{-}\s*(')
  endif

  if midx != -1
    " Add 'shiftwidth' if what we found previously is not in a comment and
    " an "end" or "until" is not present on the same line.
    if synIDattr(synID(prevlnum, midx + 1, 1), "name") != "luaComment" && prevline !~ '\<end\>\|\<until\>'
      let ind += &shiftwidth
    endif
  else
    " No indentation based on keywords, let's check for tables

    " Add 'shiftwidth' when there are unbalanced { on the previous line
    let prevBalance = s:PreviousLineBracesBalance(prevline)
    let ind += prevBalance * &shiftwidth
  endif

  " Subtract a 'shiftwidth' on end, else (and elseif), until
  " This requires 'indentkeys'.
  let midx = match(getline(v:lnum), '^\s*\%(end\|else\|until\)')
  if midx != -1 && synIDattr(synID(v:lnum, midx + 1, 1), "name") != "luaComment"
    let ind -= &shiftwidth
  endif

  " Subtract 'shiftwidth' when typing } on the current line
  " This requires 'indentkeys'.
  let unindents = s:CountUnindents(getline(v:lnum))
  if unindents > 0
    let ind -= unindents * &shiftwidth
  endif

  return ind
endfunction

" vim: et ts=8 sw=2
