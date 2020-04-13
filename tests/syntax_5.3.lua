-- loops, blocks and control flow
    while do
        -- ...
    end

    repeat
        -- ...
    until

    for in do
        -- ...
    end

    do
        -- ...
    end

    if then
        -- ...
    elseif then
        -- ...
    else
        -- ...
    end

    break
    goto
    return

-- boolean keywords
    and or not

-- functions and variables
    function(...)
        local a = 1
    end

-- keyword constants
    true false nil

-- string constants
    a = 'alo\n123"'
    a = "alo\n123\""
    a = '\97lo\10\04923"'
    a = [[alo
         123"]]
    a = [==[
         alo
         123"]==]

    '\a\b\f\n\r\t\v\\\"\'\077\u{015d}'

-- integer constants
    3   345   0xff   0xBEBADA

-- float constants
    3.0     3.1416     314.16e-2     0.31416E1     34e1
    0x0.1E  0xA23p-4   0X1.921FB54442D18P+1

-- arithmetic operators
    + - * / // % ^

-- bitwise operators
    & | ~ >> <<

-- relational operators
    == ~= < > <= >=

-- concatenation operator
    ..

-- length operator
    #

-- tables
     a = { [f(1)] = g; "x", "y"; x = 1, f(x), [30] = 23; 45 }

     do
       local t = {}
       t[f(1)] = g
       t[1] = "x"         -- 1st exp
       t[2] = "y"         -- 2nd exp
       t.x = 1            -- t["x"] = 1
       t[3] = f(x)        -- 3rd exp
       t[30] = 23
       t[4] = 45          -- 4th exp
       a = t
     end


-- metamethods
    __add
    __sub
    __mul
    __div
    __mod
    __pow
    __unm
    __idiv
    __band
    __bor
    __bxor
    __bnot
    __shl
    __shr
    __concat
    __len
    __eq
    __lt
    __le
    __index
    __newindex
    __call

-- weak tables
    __mode

-- environment
    _ENV

-- libraries
--  basic
    _G
    _VERSION
    assert
    collectgarbage
    dofile
    error
    getmetatable
    ipairs
    load
    loadfile
    next
    pairs
    pcall
    print
    rawequal
    rawget
    rawlen
    rawset
    require
    select
    setmetatable
    tonumber
    tostring
    type
    xpcall

--  coroutine
    coroutine.create
    coroutine.isyieldable
    coroutine.resume
    coroutine.running
    coroutine.status
    coroutine.wrap
    coroutine.yield

--  debug
    debug.debug
    debug.gethook
    debug.getinfo
    debug.getlocal
    debug.getmetatable
    debug.getregistry
    debug.getupvalue
    debug.getuservalue
    debug.sethook
    debug.setlocal
    debug.setmetatable
    debug.setupvalue
    debug.setuservalue
    debug.traceback
    debug.upvalueid
    debug.upvaluejoin

--  io
    io.close
    io.flush
    io.input
    io.lines
    io.open
    io.output
    io.popen
    io.read
    io.stderr
    io.stdin
    io.stdout
    io.tmpfile
    io.type
    io.write
    file:close
    file:flush
    file:lines
    file:read
    file:seek
    file:setvbuf
    file:write

--  math
    math.abs
    math.acos
    math.asin
    math.atan
    math.ceil
    math.cos
    math.deg
    math.exp
    math.floor
    math.fmod
    math.huge
    math.log
    math.max
    math.maxinteger
    math.min
    math.mininteger
    math.modf
    math.pi
    math.rad
    math.random
    math.randomseed
    math.sin
    math.sqrt
    math.tan
    math.tointeger
    math.type
    math.ult

--  os
    os.clock
    os.date
    os.difftime
    os.execute
    os.exit
    os.getenv
    os.remove
    os.rename
    os.setlocale
    os.time
    os.tmpname

--  package
    package.config
    package.cpath
    package.loaded
    package.loadlib
    package.path
    package.preload
    package.searchers
    package.searchpath

--  string
    string.byte
    string.char
    string.dump
    string.find
    string.format
    string.gmatch
    string.gsub
    string.len
    string.lower
    string.match
    string.pack
    string.packsize
    string.rep
    string.reverse
    string.sub
    string.unpack
    string.upper

--  table
    table.concat
    table.insert
    table.move
    table.pack
    table.remove
    table.sort
    table.unpack

--  utf8
    utf8.char
    utf8.charpattern
    utf8.codepoint
    utf8.codes
    utf8.len
    utf8.offset
