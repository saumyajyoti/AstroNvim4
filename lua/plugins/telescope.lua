return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "jvgrootveld/telescope-zoxide",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fz"] = { "<Cmd>Telescope zoxide list<CR>", desc = "Find directories" },
            ["<Leader>fu"] = { "<Cmd>Telescope undo<CR>", desc = "Find undos" },
            ["<Leader>fe"] = { "<Cmd>Telescope file_browser<CR>", desc = "Open File browser" },
            -- ["<Leader>ft"] = {
            --   function()
            --     local builtin = require "telescope.builtin"
            --     builtin.colorscheme { enable_preview = true }
            --   end,
            --   desc = "Live Theme Preview",
            -- },
            -- search highlight groups
            ["<Leader>fH"] = { "<Cmd>Telescope highlights<cr>", desc = "Highlight groups" },
          },
        },
      },
    },
  },
  -- the first parameter is the plugin specification
  -- the second is the table of options as set up in Lazy with the `opts` key
  config = function(plugin, opts)
    local telescope = require "telescope"
    -- run the core AstroNvim configuration function with the options table
    require "astronvim.plugins.configs.telescope"(plugin, opts)

    telescope.load_extension "media_files"
    telescope.load_extension "zoxide"
    telescope.load_extension "undo"
    telescope.load_extension "file_browser"
    telescope.load_extension "live_grep_args"
  end,
}
