local get_opts = function()
  return {
    cwd_only = true,
    preview = { hide_on_startup = false },
    layout_config = {
      width = 0.75,
      height = 0.75,
    },
    mappings = {
      i = {
        ["<esc>"] = require("telescope.actions").close,
      },
    },
    open_buffer_indicators = {
      previous = "󱞹",
      others = "",
    },
  }
end

return {
  "danielfalk/smart-open.nvim",
  cmd = { "SmartOpen" },
  dependencies = {
    {
      "kkharji/sqlite.lua",
      init = function() vim.g.sqlite_clib_path = "C:/Users/smukhe5.GAR/scoop/apps/sqlite/current/sqlite3.dll" end,
    },

    "nvim-telescope/telescope.nvim",
    { "nvim-telescope/telescope-fzy-native.nvim" },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fs"] = {
              "<cmd>SmartOpen<cr>",
              desc = "Smart Open",
            },
          },
        },
      },
    },
  },
  config = function()
    require("telescope").load_extension "smart_open"
    -- local colors = require("tokyonight.colors").setup()
    vim.api.nvim_set_hl(0, "Directory", { fg = "#a89984" })

    local opts = get_opts()
    vim.api.nvim_create_user_command(
      "SmartOpen",
      function() require("telescope").extensions.smart_open.smart_open(opts) end,
      {}
    )
  end,
}
