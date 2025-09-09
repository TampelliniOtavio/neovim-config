-- Default configs, autocmds and execs
require("defaults")

-- Plugin Manager
require("config.lazy")

-- Colorscheme Configuration
require("colorscheme")

local utils = require('utils.ftplugin')

-- Autoload all config folder, excluding lazy.lua
utils.loadFolder('/lua/config', {'lazy.lua'})

-- Auto Commands
require("autocmds")

