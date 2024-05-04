return {
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     theme = "catppuccin",
  --     sections = {
  --       lualine_a = {
  --         {
  --           "datetime",
  --           -- options: default, us, uk, iso, or your own format string ("%H:%M", etc..)
  --           style = "default",
  --         },
  --       },
  --     },
  --   },
  -- },
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      -- add new user interface icon
      icons = {
        VimIcon = "",
        ScrollText = "",
        -- GitBranch = "",
        -- GitAdd = "",
        -- GitChange = "",
        -- GitDelete = "",
      },
      -- modify variables used by heirline but not defined in the setup call directly
      status = {
        -- define the separators between each section
        separators = {
          left = { "", "" }, -- separator for the left side of the statusline
          right = { "", " " }, -- separator for the right side of the statusline
          tab = { " ", " " },
        },
        -- add new colors that can be used by heirline
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
        attributes = {
          mode = { bold = true },
        },
        icon_highlights = {
          file_icon = {
            statusline = false,
          },
        },
      },
    },
  },
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts)
      -- local Lazy = {
      --   condition = require("lazy.status").has_updates,
      --   update = { "User", pattern = "LazyUpdate" },
      --   provider = function() return "   " .. require("lazy.status").updates() .. " " end,
      --   on_click = {
      --     callback = function() require("lazy").update() end,
      --     name = "update_plugins",
      --   },
      --   hl = { fg = "gray" },
      -- }

      local status = require "astroui.status"
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 1, right = 1 } } },
        status.component.git_branch(),
        -- status.component.file_info(),
        status.component.git_diff(),
        status.component.diagnostics(),
        status.component.fill(),
        status.component.cmd_info(),
        status.component.fill(),
        status.component.lsp { lsp_progress = false },
        status.component.virtual_env(),
        status.component.treesitter(),

        {
          -- define a simple component where the provider is just a folder icon
          status.component.builder {
            -- astronvim.get_icon gets the user interface icon for a closed folder with a space after it
            { provider = require("astroui").get_icon "FolderClosed" },
            -- add padding after icon
            padding = { left = 0, right = 1 },
            -- set the foreground color to be used for the icon
            hl = { fg = "bg" },
            -- use the right separator and define the background color
            surround = {
              separator = { "", "" }, -- "right", -- { " ", "" },
              color = "#a96b2c", -- "folder_icon_bg",
            },
          },
          -- add a file information component and only show the current working directory name
          status.component.file_info {
            -- we only want filename to be used and we can change the fname
            -- function to get the current working directory name
            filename = {
              fname = function(nr) return vim.fn.getcwd(nr) end,
              padding = { left = 1, right = 1 },
            },
            -- disable all other elements of the file_info component
            filetype = false,
            file_icon = false,
            file_modified = false,
            file_read_only = false,
            -- use no separator for this part but define a background color
            surround = {
              separator = { "", "" }, -- "left", -- none",
              color = "file_info_bg",
              condition = false,
            },
          },
        },
        -- Lazy,
        status.component.builder {
          condition = require("lazy.status").has_updates,
          update = { "User", pattern = "LazyUpdate" },
          provider = function() return "   " .. require("lazy.status").updates() end, -- "   " .. require("lazy.status").updates() .. " " },
          on_click = {
            callback = function() require("lazy").update { show = false } end,
            name = "update_plugins",
          },
          hl = { fg = "#ff9e64" },
          surround = { separator = "right", color = "nav_bg" },
        },

        status.component.nav {
          ruler = {},
          percentage = { padding = { left = 1 } },
          scrollbar = false, -- padding = { left = 1 }, hl = { fg = "scrollbar" } },
          surround = { separator = "right", color = "nav_bg" },
        },
        -- status.component.mode { surround = { separator = "right" } },
      }
      -- opts.statusline[1] = status.component.mode { mode_text = { padding = { left = 1, right = 1 } } } -- add the mode text
    end,
  },
}
