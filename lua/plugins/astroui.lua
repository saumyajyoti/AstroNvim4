-- AstroUI provides the basis for configuring the AstroNvim User Interface
-- Configuration documentation can be found with `:h astroui`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme
    colorscheme = "catppuccin", -- astrodark",
    -- AstroUI allows you to easily modify highlight groups easily for any and all colorschemes
    -- highlights = {
    --   init = { -- this table overrides highlights in all themes
    --     -- Normal = { bg = "#000000" },
    --   },
    --   astrodark = { -- a table of overrides/changes when applying the astrotheme theme
    --     -- Normal = { bg = "#000000" },
    --   },
    -- },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
      VimIcon = "",
      ScrollText = "",
    },
    status = { -- Configure characters used as separators for various elements
      separators = {
        none = { "", "" },
        left = { "", "" }, -- separator for the left side of the statusline
        right = { "", " " }, -- separator for the right side of the statusline
        -- left = { "", "  " },
        -- right = { "  ", "" },
        center = { "  ", "  " },
        tab = { "|", "" },
        breadcrumbs = "  ", -- 
        path = "  ",
      },
      colors = function(hl)
        local get_hlgroup = require("astroui").get_hlgroup
        -- use helper function to get highlight group properties
        local comment_fg = get_hlgroup("Comment").fg
        -- hl.git_branch_fg = comment_fg
        -- hl.git_added = comment_fg
        -- hl.git_changed = comment_fg
        -- hl.git_removed = comment_fg
        -- hl.blank_bg = get_hlgroup("Folded").fg
        hl.file_info_bg = get_hlgroup("Visual").bg
        -- hl.nav_icon_bg = get_hlgroup("String").fg
        -- hl.nav_fg = hl.nav_icon_bg
        hl.folder_icon_bg = get_hlgroup("@comment.warning").bg
        return hl
      end,
      -- attributes = {
      --   mode = { bold = true },
      -- },
      icon_highlights = {
        file_icon = {
          statusline = false,
        },
      },
    },
    highlights = {
      -- set highlights for all themes
      -- use a function override to let us use lua to retrieve
      -- colors from highlight group there is no default table
      -- so we don't need to put a parameter for this function
      init = function()
        local get_hlgroup = require("astroui").get_hlgroup
        -- get highlights from highlight groups
        local bg_alt = get_hlgroup("Normal").bg
        local bg_2 = get_hlgroup("Visual").bg
        local green = get_hlgroup("String").fg
        -- local red = get_hlgroup("Error").fg
        local bg = get_hlgroup("LineNr").bg -- "#1d2021"
        local input_bg = get_hlgroup("CursorLineNr").bg -- "#32302f"
        -- return a table of highlights for snacks.picker based on
        -- colors retrieved from highlight groups
        return {
          SnacksPickerBorder = { fg = bg, bg = bg },
          SnacksPicker = { bg = bg },
          SnacksPickerPreviewBorder = { fg = bg_alt, bg = bg_alt },
          SnacksPickerPreview = { bg = bg_alt },
          SnacksPickerPreviewTitle = { fg = bg, bg = green },
          SnacksPickerBoxBorder = { fg = bg, bg = bg },
          SnacksPickerInputBorder = { fg = input_bg, bg = bg },
          -- SnacksPickerInputSearch = { fg = red, bg = bg },
          SnacksPickerListBorder = { fg = bg, bg = bg },
          SnacksPickerList = { bg = bg },
          SnacksPickerListTitle = { fg = bg, bg = "#076678" },
          SnacksPickerListFooter = { bg = bg },
          SnacksPickerPrompt = { fg = get_hlgroup("Special").fg, bg = bg },
          SnacksPickerTree = { bg = bg },
        }
      end,
    },
  },
}
