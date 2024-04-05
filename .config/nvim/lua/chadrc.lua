-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  changed_themes = {
    ashes = {
       base_30 = {
        black = "#1b1e25",
        pmenu_bg = "#E1DCEE",
        folder_bg = "#D5A5AA",
        pink = "#D5A5AA",
        nord_blue = "#DEC386",
        lightbg = "#1b1e25",
        green = "#B28999",
        light_grey = "#D5A5AA",
        statusline_bg= "#1b1e25",
        darker_black = "#1b1e25",
        purple = "#D5A5AA",
      },
      base_16 = {
        --variables, xml tags
        base08 = "#83A6BF",
        --strings, inherited class
        base0B = "#DEC386",
        --keywords, storage, selector
        base0E = "#B28999",
        --functions, methodsods
        base0D = "#EAB2C2",
        --integers, boolean, constants
        base09 = "#83A6BF",
        --default fg, caret, delimiters
        base05 = "#DEC386",
        --lighter bg (status bars)
        base01 = "#83A6BF",
        --light folder 
        base02 = "#B28999",
        --comments, invisibles, line highlights
        base03 = "#B19C9B",
        --classes, markup bold
        base0A = "#7293A9",
        --default bg?
        base00 = "#1b1e25",
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
