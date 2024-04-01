-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  changed_themes = {
    ashes = {
       base_30 = {
        black = "#100C18",
        pmenu_bg = "#E1DCEE",
        folder_bg = "#9B6EC9",
        pink = "#9B6EC9",
        nord_blue = "#C8B6E9",
        lightbg = "#100C18",
        green = "#9A728F",
        light_grey = "#9B6EC9",
        statusline_bg= "#100C18",
        darker_black = "#100C18",
        purple = "#9B6EC9",
      },
      base_16 = {
        --variables, xml tags
        base08 = "#9B6EC9",
        --strings, inherited class
        base0B = "#ACA3DF",
        --keywords, storage, selector
        base0E = "#9A728F",
        --functions, methodsods
        base0D = "#5F456F",
        --integers, boolean, constants
        base09 = "#B78A9f",
        --default fg, caret, delimiters
        base05 = "#ACA3DF",
        --lighter bg (status bars)
        base01 = "#D0C3ED",
        --light folder 
        base02 = "#9A728F",
        --comments, invisibles, line highlights
        base03 = "#B19C9B",
      },
    },
  },

  hl_override = {
    Normal = {
     bg = {"black", 0},

    },
  },

    theme = "ashes",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
