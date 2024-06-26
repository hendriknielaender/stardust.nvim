local c = require("stardust.colors")
local config = require("stardust.config")

local M = {}

M.base = {
  -- Styles
  Bold = { style = "bold" },
  Italic = { style = "italic" },
  Underlined = { style = "underline" },

  Boolean = { fg = c.orange },
  Character = { fg = c.string_color, style = "bold" },
  ColorColumn = { bg = c.dark_gray },
  Comment = { fg = c.light_green },
  Conceal = { fg = c.light_gray, bg = config.transparent_background and "NONE" or c.bg },
  Conditional = { fg = c.light_yellow, style = "bold" },
  Constant = { fg = c.light_yellow, style = "bold" },
  Cursor = { fg = c.cursor_fg, bg = c.cursor_bg, style = "bold" },
  CursorColumn = { bg = c.dark },
  CursorIM = { fg = c.cursor_fg, bg = c.cursor_bg },
  CursorLine = { bg = c.dark },
  CursorLineNr = { fg = c.light_gray, style = "bold" },
  Debug = { fg = c.debug_color, style = "bold" },
  Define = { fg = c.define, style = "bold" },
  Delimiter = { fg = c.fg },
  DiffAdd = { fg = c.diff_add },
  DiffChange = { fg = c.diff_change, style = "underline" },
  DiffDelete = { fg = c.diff_delete },
  DiffText = { fg = c.diff_text },
  Directory = { fg = c.directory_fg, style = "bold" },
  Error = { fg = c.error_red, style = "bold" },
  ErrorMsg = { fg = c.error_red, style = "bold" },
  Exception = { fg = c.exception_fg, style = "bold" },
  Float = { fg = c.float_color },
  FloatBorder = { fg = c.gray, bg = c.dark },
  FoldColumn = { fg = c.accent, bg = c.dark },
  Folded = { fg = c.accent, bg = c.dark },
  Function = { fg = c.func_color },
  Identifier = { fg = c.identifier_color },
  Ignore = { fg = c.ignore_fg, bg = c.bg },
  IncSearch = { fg = c.light_gray, bg = c.inc_search_bg },
  Include = { fg = c.include_fg, style = "bold" },
  Keyword = { fg = c.light_yellow, style = "bold" },
  Label = { fg = c.blue, style = "underline" },
  LineNr = { fg = c.context },
  Macro = { fg = c.purple, style = "bold" },
  MatchParen = { fg = c.hint_blue, style = "underline" },
  MatchParenCur = { style = "underline" },
  MatchWord = { style = "underline" },
  MatchWordCur = { style = "underline" },
  ModeMsg = { fg = c.mode_msg, bg = c.bg },
  MoreMsg = { fg = c.more_msg },
  MsgArea = { fg = c.fg, bg = config.transparent_background and "NONE" or c.bg },
  MsgSeparator = { fg = c.fg, bg = c.bg },
  NonText = { fg = c.non_text_fg },
  Normal = { fg = c.fg, bg = c.bg },
  NormalFloat = { bg = c.dark },
  NormalNC = { fg = c.fg, bg = config.transparent_background and "NONE" or c.bg },
  Number = { fg = c.number_fg },
  Operator = { fg = c.operator_fg },
  Pmenu = { fg = c.light_gray, bg = c.popup_back },
  PmenuSbar = { bg = c.dark },
  PmenuSel = { fg = c.dark, bg = c.pmenu_sel_bg },
  PmenuThumb = { bg = c.gray },
  PreCondit = { fg = c.purple, style = "bold" },
  PreProc = { fg = c.pre_proc_fg, style = "bold" },
  Question = { fg = c.question_fg },
  QuickFixLine = { bg = c.quick_fix_line_bg },
  Repeat = { fg = c.light_yellow, style = "bold" },
  Search = { fg = c.light_gray, bg = c.search_orange },
  SignColumn = { bg = c.bg },
  Special = { fg = c.light_yellow },
  SpecialChar = { fg = c.special_char, style = "bold" },
  SpecialComment = { fg = c.special_comment, style = "bold" },
  SpecialKey = { fg = c.blue, style = "bold" },
  SpellBad = { fg = c.error_red, style = "underline" },
  SpellCap = { fg = c.yellow, style = "underline" },
  SpellLocal = { fg = c.green, style = "underline" },
  SpellRare = { fg = c.purple, style = "underline" },
  Statement = { fg = c.light_yellow, style = "bold" },
  StatusLine = { fg = c.dark },
  StatusLineNC = { fg = c.dark },
  StatusLineSeparator = { fg = c.dark },
  StatusLineTerm = { fg = c.dark },
  StatusLineTermNC = { fg = c.dark },
  StorageClass = { fg = c.storage_class_fg, style = "bold" },
  String = { fg = c.string_color },
  Structure = { fg = c.structure_fg, style = "bold" },
  Substitute = { fg = c.light_gray, bg = c.substitute_bg },
  TabLine = { fg = c.light_gray, bg = c.dark },
  TabLineFill = { fg = c.fg, bg = c.dark },
  TabLineSel = { fg = c.fg, bg = c.dark },
  Tag = { fg = c.tag_fg },
  TermCursor = { fg = c.cursor_fg, bg = c.cursor_bg },
  TermCursorNC = { fg = c.cursor_fg, bg = c.cursor_bg },
  Title = { fg = c.title_fg, style = "bold" },
  Todo = { fg = c.todo_fg, bg = c.bg, style = "bold" },
  Type = { fg = c.type_fg },
  Typedef = { fg = c.typedef_fg },
  Variable = { fg = c.accent },
  VertSplit = { fg = c.vert_split_fg, bg = c.dark },
  Visual = { bg = c.cursor_bg },
  VisualNOS = { bg = c.dark },
  WarningMsg = { fg = c.warning_msg_fg, bg = c.bg },
  Whitespace = { fg = c.whitespace_fg },
  WildMenu = { fg = c.dark, bg = c.blue },
  lCursor = { fg = c.cursor_fg, bg = c.cursor_bg },
}

return M
