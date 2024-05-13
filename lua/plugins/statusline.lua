return {
  {
    "rebelot/heirline.nvim",
    optional = true,
    opts = function(_, opts)
      local status = require "astroui.status"
      opts.statusline = { -- statusline
        hl = { fg = "fg", bg = "bg" },
        status.component.mode { mode_text = { padding = { left = 0, right = 0 } } },
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
