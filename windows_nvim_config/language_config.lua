--use this file to update parsers and their associated files
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.cpp.used_by = "tpp"
