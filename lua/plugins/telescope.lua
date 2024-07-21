return {

  { "nvim-telescope/telescope-media-files.nvim", lazy = true },
  { "Verf/telescope-everything.nvim", lazy = true },
  { "ghassan0/telescope-glyph.nvim", lazy = true },
  { "2kabhishek/nerdy.nvim", cmd = "Nerdy", lazy = true },
  {
    "nvim-telescope/telescope-frecency.nvim",
    lazy = true,

    specs = {

      {
        "nvim-telescope/telescope.nvim",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-telescope/telescope-media-files.nvim",
          "Verf/telescope-everything.nvim",
          "ghassan0/telescope-glyph.nvim",
          "fdschmidt93/telescope-egrepify.nvim",
          "2kabhishek/nerdy.nvim",
          "nvim-telescope/telescope-frecency.nvim",
          {
            "AstroNvim/astrocore",
            opts = {
              mappings = {
                n = {
                  ["<Leader>fg"] = {
                    function()
                      local path = vim.loop.cwd() .. "/.git"
                      local ok, err = vim.loop.fs_stat(path)
                      if ok then require("telescope.builtin").git_files { prompt_prefix = "󰊢 " } end
                    end,
                    desc = "Find Git Files",
                  },
                  ["<Leader>ff"] = {
                    function()
                      local builtin = require "telescope.builtin"
                      builtin.find_files {
                        -- cwd = vim.fn.expand "%:p:h",
                        prompt_prefix = "🔍",
                        find_command = {
                          "fd",
                          "--type",
                          "f",
                          "--strip-cwd-prefix",
                          "-E*.dll",
                          "-E*.pdb",
                          "-E.git",
                          "-E*.exe",
                          "-E*.bmp",
                          "-E*.png",
                          "--follow",
                          "--color=never",
                        },
                      }
                    end,

                    -- "<Cmd>Telescope find_files find_command=fd,-E*.dll,-E*.pdb,-E.git,-E*.exe,-E*.bmp,-E*.png,-tf,--follow,--color=never prompt_prefix=🔍<CR>",
                    desc = "Find Files",
                  },
                  ["<Leader>."] = {
                    function()
                      local builtin = require "telescope.builtin"
                      builtin.find_files {
                        cwd = vim.fn.expand "%:p:h",
                        prompt_prefix = "󰙅 ",
                        find_command = {
                          "fd",
                          "--type",
                          "f",
                          "--strip-cwd-prefix",
                          "-E*.dll",
                          "-E*.pdb",
                          "-E.git",
                          "-E*.exe",
                          "-E*.bmp",
                          "-E*.png",
                          "--follow",
                          "--color=never",
                        },
                      }
                    end,
                    desc = "Find Siblings",
                  },

                  ["<C-p>"] = {
                    function()
                      local builtin = require "telescope.builtin"
                      local path = vim.loop.cwd() .. "/.git"
                      local ok, err = vim.loop.fs_stat(path)
                      if ok then
                        builtin.git_files { prompt_prefix = "󰊢 " }
                      else
                        builtin.find_files {
                          prompt_prefix = "🔍",
                          find_command = {
                            "fd",
                            "--type",
                            "f",
                            "--strip-cwd-prefix",
                            "-E*.dll",
                            "-E*.pdb",
                            "-E.git",
                            "-E*.exe",
                            "-E*.bmp",
                            "-E*.png",
                            "--follow",
                            "--color=never",
                          },
                        }
                      end
                    end,
                    desc = "Smart Find Files",
                  },
                  -- search highlight groups
                  ["<Leader>fE"] = {
                    function() require("telescope").extensions.egrepify.egrepify {} end,
                    desc = "eGrepify Search",
                  },
                  ["<Leader>fH"] = { "<Cmd>Telescope highlights<cr>", desc = "Highlight groups" },
                  ["<Leader>fp"] = { "<Cmd>Telescope lazy<cr>", desc = "Plugins configurations" },
                  ["<Leader>fs"] = { "<Cmd>Telescope frecency<cr>", desc = "Frecent File Search" },
                  ["<Leader>f."] = {
                    function() require("telescope").extensions.chezmoi.find_files() end,
                    desc = "Chezmoi Configurations",
                  },
                },
              },
            },
          },
        },
        -- the first parameter is the plugin specification
        -- the second is the table of options as set up in Lazy with the `opts` key
        opts = function()
          -- config = function(plugin, opts)
          local telescope = require "telescope"

          telescope.load_extension "media_files"
          telescope.load_extension "everything"
          telescope.load_extension "glyph"
          telescope.load_extension "egrepify"
          telescope.load_extension "nerdy"
          telescope.load_extension "frecency"
          telescope.load_extension "chezmoi"
        end,
      },
    },
  },
}
