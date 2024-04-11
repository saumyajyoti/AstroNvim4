return {
  {
    -- further customize the options set by the community
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 150,
    opts = function()
      local opts = {}
      local THEME_NAME = "gruvcat"

      local colors_overrides = THEME_NAME ~= "catppuccin" and require("plugins.catppuccin." .. THEME_NAME) or {}
      opts.color_overrides = colors_overrides
      -- flavour = "macchiato", -- latte, frappe, macchiato, mocha
      opts.background = {
        -- :h background
        light = "latte",
        dark = "mocha",
      }
      opts.transparent_background = false
      opts.show_end_of_buffer = true -- show the '~' characters after the end of buffer
      opts.term_colors = false
      opts.dim_inactive = {
        enabled = false,
        shade = "dark",
        percentage = 0.15,
      }
      opts.no_italic = false -- Force no italic
      opts.no_bold = false -- Force no bold
      opts.no_underline = false -- Force no underline

      local highlights = require "plugins.catppuccin.highlights"
      opts.custom_highlights = highlights.custom_highlights
      opts.styles = highlights.styles
      opts.highlight_overrides = highlights.highlight_overrides

      opts.integrations = require "plugins.catppuccin.integrations"
      return opts
    end,
  },
}
