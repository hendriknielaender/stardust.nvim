local util = require("stardust.util")
local theme = require("stardust.theme")

vim.o.background = "dark"
vim.g.colors_name = "stardust"

util.load(theme)
