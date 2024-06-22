---@class Stardust
---@field config StardustConfig
---@field palette StardustPalette
local Stardust = {}

---@alias Contrast "hard" | "soft" | ""

---@class ItalicConfig
---@field strings boolean
---@field comments boolean
---@field operators boolean
---@field folds boolean
---@field emphasis boolean

---@class HighlightDefinition
---@field fg string?
---@field bg string?
---@field sp string?
---@field blend integer?
---@field bold boolean?
---@field standout boolean?
---@field underline boolean?
---@field undercurl boolean?
---@field underdouble boolean?
---@field underdotted boolean?
---@field strikethrough boolean?
---@field italic boolean?
---@field reverse boolean?
---@field nocombine boolean?

---@class StardustConfig
---@field terminal_colors boolean?
---@field undercurl boolean?
---@field underline boolean?
---@field bold boolean?
---@field italic ItalicConfig?
---@field strikethrough boolean?
---@field contrast Contrast?
---@field invert_selection boolean?
---@field invert_signs boolean?
---@field invert_tabline boolean?
---@field invert_intend_guides boolean?
---@field inverse boolean?
---@field overrides table<string, HighlightDefinition>?
---@field palette_overrides table<string, string>?
Stardust.config = {
  terminal_colors = true,
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  invert_intend_guides = false,
  inverse = true,
  contrast = "",
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = false,
}

-- Main Stardust color palette
---@class StardustPalette
Stardust.palette = {
  Boolean = "#ffa263",
  Character = "#dca3a3",
  Comment = "#acd2ac",
  Conditional = "#ffd787",
  Constant = "#ffd787",
  Cursor = "#000d18",
  Cursor_bg = "#8faf9f",
  Debug = "#bca3a3",
  Define = "#ffcfaf",
  Delimiter = "#8f8f8f",
  DiffAdd_bg = "#313c36",
  DiffChange_bg = "#333333",
  DiffDelete_bg = "#464646",
  DiffText_bg = "#41363c",
  Directory = "#9fafaf",
  ErrorMsg = "#80d4aa",
  ErrorMsg_bg = "#2f2f2f",
  Exception = "#c3bf9f",
  Float = "#c0bed1",
  FoldColumn = "#93b3a3",
  FoldColumn_bg = "#3f4040",
  Function = "#ffd787",
  Identifier = "#efdcbc",
  IncSearch = "#FFE636",
  IncSearch_bg = "#385f38",
  Keyword = "#ffd787",
  Macro = "#ffcfaf",
  ModeMsg = "#ffcfaf",
  MoreMsg = "#ffffff",
  Number = "#8cd0d3",
  Operator = "#dcdccc",
  PmenuSbar_bg = "#2e3330",
  PmenuThumb_bg = "#a0afa0",
  PreCondit = "#dfaf8f",
  PreProc = "#ffcfaf",
  Question = "#ffffff",
  Repeat = "#ffd787",
  Search_bg = "#284f28",
  SignColumn = "#9fafaf",
  SpecialChar = "#dca3a3",
  SpecialComment = "#82a282",
  Special = "#ffd787",
  SpecialKey = "#9ece9e",
  Statement = "#ffd787",
  StatusLine = "#dcdccc",
  StatusLine_bg = "#333333",
  StatusLineNC = "#7f7f7f",
  StatusLineNC_bg = "#262626",
  StorageClass = "#c3bf9f",
  String = "#ffc1c1",
  Structure = "#ffa263",
  Tag = "#e89393",
  Title = "#efefef",
  Todo = "#dfdfdf",
  Typedef = "#ffa263",
  Type = "#ffa263",
  Underlined = "#dcdccc",
  VertSplit = "#2e3330",
  VisualNOS = "#333333",
  VisualNOS_bg = "#f18c96",
  WarningMsg = "#ffffff",
  WarningMsg_bg = "#333333",
  WildMenu = "#cbecd0",
  WildMenu_bg = "#2c302d",
}

local function get_colors()
  local p = Stardust.palette
  local config = Stardust.config

  for color, hex in pairs(config.palette_overrides) do
    p[color] = hex
  end

  local bg = vim.o.background
  local contrast = config.contrast

  local color_groups = {
    dark = {
      bg0 = "#282828",
      bg1 = "#3c3836",
      bg2 = "#504945",
      bg3 = "#665c54",
      bg4 = "#7c6f64",
      fg0 = "#fbf1c7",
      fg1 = "#ebdbb2",
      fg2 = "#d5c4a1",
      fg3 = "#bdae93",
      fg4 = "#a89984",
      red = "#fb4934",
      green = "#b8bb26",
      yellow = "#fabd2f",
      blue = "#83a598",
      purple = "#d3869b",
      aqua = "#8ec07c",
      orange = "#fe8019",
    },
    light = {
      bg0 = "#fbf1c7",
      bg1 = "#ebdbb2",
      bg2 = "#d5c4a1",
      bg3 = "#bdae93",
      bg4 = "#a89984",
      fg0 = "#282828",
      fg1 = "#3c3836",
      fg2 = "#504945",
      fg3 = "#665c54",
      fg4 = "#7c6f64",
      red = "#9d0006",
      green = "#79740e",
      yellow = "#b57614",
      blue = "#076678",
      purple = "#8f3f71",
      aqua = "#427b58",
      orange = "#af3a03",
    },
  }

  if contrast ~= nil and contrast ~= "" then
    color_groups[bg].bg0 = p[bg .. "0_" .. contrast]
    color_groups[bg].red = p[bg .. "_red_" .. contrast]
    color_groups[bg].green = p[bg .. "_green_" .. contrast]
    color_groups[bg].aqua = p[bg .. "_aqua_" .. contrast]
  end

  return color_groups[bg]
end

local function get_groups()
  local colors = get_colors()
  local config = Stardust.config

  if config.terminal_colors then
    local term_colors = {
      colors.bg0,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.purple,
      colors.aqua,
      colors.fg4,
      colors.bg2,
      colors.red,
      colors.green,
      colors.yellow,
      colors.blue,
      colors.purple,
      colors.aqua,
      colors.fg1,
    }
    for index, value in ipairs(term_colors) do
      vim.g["terminal_color_" .. (index - 1)] = value
    end
  end

  local groups = {
    Boolean = { fg = colors.Boolean, bg = "NONE", bold = false, italic = false },
    Character = { fg = colors.Character, bg = "NONE", bold = true, italic = false },
    Comment = { fg = colors.Comment, bg = "NONE", bold = false, italic = config.italic.comments },
    Conditional = { fg = colors.Conditional, bg = "NONE", bold = true, italic = false },
    Constant = { fg = colors.Constant, bg = "NONE", bold = true, italic = false },
    Cursor = { fg = colors.Cursor, bg = colors.Cursor_bg, bold = true, italic = false },
    Debug = { fg = colors.Debug, bg = "NONE", bold = true, italic = false },
    Define = { fg = colors.Define, bg = "NONE", bold = true, italic = false },
    Delimiter = { fg = colors.Delimiter, bg = "NONE", bold = false, italic = false },
    Directory = { fg = colors.Directory, bg = "NONE", bold = true, italic = false },
    ErrorMsg = { fg = colors.ErrorMsg, bg = colors.ErrorMsg_bg, bold = true, italic = false },
    Exception = { fg = colors.Exception, bg = "NONE", bold = true, italic = false },
    -- Add other highlight groups following the same pattern
  }

  for group, hl in pairs(config.overrides) do
    if groups[group] then
      groups[group].link = nil
    end

    groups[group] = vim.tbl_extend("force", groups[group] or {}, hl)
  end

  return groups
end

---@param config StardustConfig?
Stardust.setup = function(config)
  Stardust.config = vim.tbl_deep_extend("force", Stardust.config, config or {})
end

--- main load function
Stardust.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("stardust.nvim: you must use Neovim 0.8 or higher", vim.log.levels.ERROR)
    return
  end

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end
  vim.g.colors_name = "stardust"
  vim.o.termguicolors = true

  local groups = get_groups()

  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return Stardust
