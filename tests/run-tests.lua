#!/usr/bin/lua

function run_vim(input_file_name, output_file_name)
    sanitize_file_name(input_file_name)
    sanitize_file_name(output_file_name)

    local shiftwidth = 4

    local vim = 'vim -u NONE -i NONE'

    local vim_init = string.format([[
        -c 'set nocompatible lazyredraw'
        -c 'edit %s'
        -c 'source ../indent/lua.vim'
        -c 'set shiftwidth=%d expandtab']], input_file_name, shiftwidth)

    vim_init = string.gsub(vim_init, '%s+', ' ')

    local vim_indent = [[-c 'normal ggVG=']]

    local vim_save = string.format([[-c 'write! %s' -c 'qa!']], output_file_name)

    local vim_full_command = string.format('%s %s %s %s', vim, vim_init, vim_indent, vim_save)

    print('Running: ' .. vim_full_command)
    local success, return_type, return_number = os.execute(vim_full_command)

    print(string.format('Success: %s, return type: %s, return code: %d', success, return_type, return_number))
end

function sanitize_file_name(file_name)
    -- This is mostly to avoid quoting problems, but being a little bit
    -- stricter than that may be safer and avoid nasty surprises in the future.
    if not string.match(file_name, '^[%w._-]+$') then
        error('Invalid file name: ' .. file_name)
    end
end

local input_file_name = '01_IN_indent.lua' -- arg[1]
local output_file_name = '01_OUT_indent.lua' -- arg[2]

run_vim(input_file_name, output_file_name)
