a = { 1, { } -- +1 on the line below
    abc
}

b = { { -- +2 on the line below
        abc
    }, { def }, { -- -1 on this line, +1 on the line below
        ghi
    }, { -- -1 on this line, +1 on the line below
        jkl
    } -- -1 on this line
} -- -1 on this line

c = { 'gv', { instance = 'vim' }, -- +1 on the line below
    properties = { floating = true } } -- -1 on the line below

d = { 'gv', { instance = 'vim' }, -- +1 on the line below
    properties = { floating = true } -- keep +1 unchanged
} -- -1 on the line below

e = { { -- +2 on the line below
        abc
    } } -- -1 on this line, -1 on the line below

f
