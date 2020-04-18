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
    goto ::label::
::label::
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

    '\a\b\f\n\r\t\v\\\"\'\077\x4d'

-- numeric constants
    3       3.0     3.1416     314.16e-2     0.31416E1
    0xff    0x0.1E  0xA23p-4   0X1.921FB54442D18P+1

-- arithmetic operators
    + - * / % ^

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

--  bit32
    bit32.arshift
    bit32.band
    bit32.bnot
    bit32.bor
    bit32.btest
    bit32.bxor
    bit32.extract
    bit32.lrotate
    bit32.lshift
    bit32.replace
    bit32.rrotate
    bit32.rshift

--  coroutine
    coroutine.create
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
    math.atan2
    math.ceil
    math.cos
    math.cosh
    math.deg
    math.exp
    math.floor
    math.fmod
    math.frexp
    math.huge
    math.ldexp
    math.log
    math.max
    math.min
    math.modf
    math.pi
    math.pow
    math.rad
    math.random
    math.randomseed
    math.sin
    math.sinh
    math.sqrt
    math.tan
    math.tanh

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
    string.rep
    string.reverse
    string.sub
    string.upper

--  table
    table.concat
    table.insert
    table.pack
    table.remove
    table.sort
    table.unpack
