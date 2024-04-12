return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "jvgrootveld/telescope-zoxide",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fz"] = { "<Cmd>Telescope zoxide list<CR>", desc = "Find directories" },
            ["<Leader>fu"] = { "<Cmd>Telescope undo<CR>", desc = "Find undos" },
            ["<Leader>fe"] = { "<Cmd>Telescope file_browser<CR>", desc = "Open File browser" },
          },
        },
      },
    },
  },
  opts = function()
    local telescope = require "telescope"
    telescope.load_extension "zoxide"
    telescope.load_extension "undo"
    telescope.load_extension "file_browser"
    telescope.load_extension "live_grep_args"
  end,
}
