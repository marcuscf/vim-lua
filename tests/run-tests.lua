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

    local vim_save = string.format([[-c 'silent! write! %s' -c 'qa!']], output_file_name)

    local vim_full_command = string.format('%s %s %s %s', vim, vim_init, vim_indent, vim_save)

    print('Running: ' .. vim_full_command)
    local success, return_type, return_number = os.execute(vim_full_command)

    print_os_result(success, return_type, return_number)
end

function sanitize_file_name(file_name)
    -- This is mostly to avoid quoting problems, but being a little bit
    -- stricter than that may be safer and avoid nasty surprises in the future.
    if not string.match(file_name, '^[%w._-]+$') then
        error('Invalid file name: ' .. file_name)
    end
end

function print_os_result(success, return_type, return_number)
    print(string.format('Success: %s, return type: %s, return code: %d', success, return_type, return_number))
end

function run_diff(name1, name2)
    local diff_command = string.format([[diff '%s' '%s']], name1, name2)
    print('Running: ' .. diff_command)
    local success, return_type, return_number = os.execute(diff_command)
    print_os_result(success, return_type, return_number)
    if success and return_type == 'exit' and return_number == 0 then
        print('Test succeeded')
    else
        print('Test FAILED')
    end
end

local file_names = {
    {'01_IN_indent.lua', '01_OUT_indent.lua', '01_expected_indent.lua'},
    {'02_IN_indent.lua', '02_OUT_indent.lua', '02_expected_indent.lua'},
}

for i, v in ipairs(file_names) do
    local input_file_name = v[1]
    local output_file_name = v[2]
    local expected_file_name = v[3]

    run_vim(input_file_name, output_file_name)
    run_diff(output_file_name, expected_file_name)
    print()
end
