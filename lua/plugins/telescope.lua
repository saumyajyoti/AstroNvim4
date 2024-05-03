return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "jvgrootveld/telescope-zoxide",
    "debugloop/telescope-undo.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
    "nvim-telescope/telescope-media-files.nvim",
    "Verf/telescope-everything.nvim",
    "ghassan0/telescope-glyph.nvim",
    "tsakirist/telescope-lazy.nvim",
    "fdschmidt93/telescope-egrepify.nvim",
    { "2kabhishek/nerdy.nvim", cmd = "Nerdy" },
    -- "nat-418/telescope-color-names.nvim",

    -- {
    --   "polirritmico/telescope-lazy-plugins.nvim",
    --   opts = {
    --     extensions = {
    --       lazy_plugins = {
    --         lazy_config = vim.fn.stdpath "config" .. "/lua/lazy_setup.lua", -- path to the file containing the lazy opts and setup() call.
    --         lazy_spec_table = vim.fn.stdpath "config" .. "/lua/lazy_setup.lua",
    --       },
    --     },
    --   },
    -- },
    {
      "AstroNvim/astrocore",
      opts = {
        mappings = {
          n = {
            ["<Leader>fz"] = { "<Cmd>Telescope zoxide list<CR>", desc = "Find directories" },
            ["<Leader>fu"] = { "<Cmd>Telescope undo<CR>", desc = "Find undos" },
            ["<Leader>fe"] = { "<Cmd>Telescope file_browser<CR>", desc = "Open File browser" },
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
            -- ["<Leader>ft"] = {
            --   function()
            --     local builtin = require "telescope.builtin"
            --     builtin.colorscheme { enable_preview = true }
            --   end,
            --   desc = "Live Theme Preview",
            -- },
            -- search highlight groups
            ["<Leader>fH"] = { "<Cmd>Telescope highlights<cr>", desc = "Highlight groups" },
            -- ["<Leader>fp"] = { "<Cmd>Telescope lazy_plugins<cr>", desc = "Plugins configurations" },
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
    telescope.load_extension "everything"
    telescope.load_extension "glyph"
    telescope.load_extension "lazy"
    telescope.load_extension "egrepify"
    telescope.load_extension "nerdy"
    -- telescope.load_extension "color_names"
    -- telescope.load_extension "find_files"
    -- telescope.load_extension "lazy_plugins"
  end,
}
