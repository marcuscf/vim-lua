local input_file_name = arg[1]
local output_file_name = arg[2]

local shiftwidth = 4

local vim = 'vim -u NONE -i NONE'

local vim_init = string.format([[
-c set nocompatible lazyredraw
-c edit %s
-c source ../indent/lua.vim
-c set shiftwidth=%d expandtab]], input_file_name, shiftwidth)

local vim_indent = '-c normal ggVG='

local vim_save = string.format('-c write! %s -c qa!', output_file_name)

local vim_full_command = string.format('%s %s %s %s', vim, vim_init, vim_indent, vim_save)

local success, return_type, return_number = os.execute(vim_full_command)
