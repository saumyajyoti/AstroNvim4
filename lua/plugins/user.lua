-- You can also add or configure plugins by creating files in this `plugins/` folder
-- PLEASE REMOVE THE EXAMPLES YOU HAVE NO INTEREST IN BEFORE ENABLING THIS FILE
-- Here are some examples:
local Snacks = require "snacks"

---@type LazySpec
return {
  -- {
  --   "lukas-reineke/indent-blankline.nvim",
  --   enabled = false,
  --   event = "User AstroFile",
  --   main = "ibl",
  --   dependencies = { "HiPhish/rainbow-delimiters.nvim" },
  --   opts = function(_, opts)
  --     if not opts.indent then opts.indent = {} end
  --     opts.indent = {
  --       char = "┊", -- ┊┊ │ --
  --       tab_char = "│",
  --     }
  --     if not opts.scope then opts.scope = {} end
  --     opts.scope.enabled = true
  --     opts.scope.show_exact_scope = true
  --     opts.scope.highlight = vim.tbl_get(vim.g, "rainbow_delimiters", "highlight")
  --       or {
  --         "RainbowDelimiterRed",
  --         "RainbowDelimiterYellow",
  --         "RainbowDelimiterBlue",
  --         "RainbowDelimiterOrange",
  --         "RainbowDelimiterGreen",
  --         "RainbowDelimiterViolet",
  --         "RainbowDelimiterCyan",
  --       }
  --     if not opts.exclude then opts.exclude = {} end
  --     opts.exclude = {
  --       filetypes = { "help", "alpha", "dashboard", "Trouble", "lazy", "neo-tree" },
  --     }
  --     if not opts.whitespace then opts.whitespace = {} end
  --     opts.whitespace = {
  --       remove_blankline_trail = true,
  --     }
  --   end,
  --
  --   config = function(plugin, opts)
  --     require(plugin.main).setup(opts)
  --
  --     local hooks = require "ibl.hooks"
  --     hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
  --   end,
  -- },

  {
    "willothy/wezterm.nvim",
    config = true,
    --    keys = {
    --      {
    --        "<leader>wt",
    --        function() require("wezterm").switch_tab.index end,
    --        desc = "Wezterm Switch tab by index", --  using vim.v.count",
    --      },
    --    },
  },
  -- {
  --   "winter-again/wezterm-config.nvim",
  --   enable = false,
  --   config = function()
  --     -- changing this to true means the plugin will try to append
  --     -- $HOME/.config/wezterm' to your RTP, meaning you can more conveniently
  --     -- access modules in $HOME/.config/wezterm/lua/ for using with this plugin
  --     -- otherwise, store data where you want
  --     require("wezterm_config").setup {
  --       -- defaults:
  --       append_wezterm_to_rtp = false,
  --     }
  --   end,
  -- },
  {
    "folke/which-key.nvim",
    opts = function(_, opts)
      opts.icons = {
        separator = " ", -- "➜ ",  
      }
      opts.plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        spelling = {
          enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        presets = {
          operators = true, -- adds help for operators like d, y, ...
          motions = true, -- adds help for motions
          text_objects = true, -- help for text objects triggered after entering an operator
          windows = true, -- default bindings on <c-w>
          nav = true, -- misc bindings to work with windows
          z = true, -- bindings for folds, spelling and others prefixed with z
          g = true, -- bindings for prefixed with g
        },
      }
      -- opts.window = {
      --   border = "single", -- none, single, double, shadow
      --   position = "bottom", -- bottom, top
      --   margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]. When between 0 and 1, will be treated as a percentage of the screen size.
      --   padding = { 1, 2, 1, 2 }, -- extra window padding [top, right, bottom, left]
      --   winblend = 0, -- value between 0-100 0 for fully opaque and 100 for fully transparent
      --   zindex = 1000, -- positive value to position WhichKey above other floating windows.
      -- }
    end,
  },
  {

    "mrjones2014/legendary.nvim",
    -- since legendary.nvim handles all your keymaps/commands,
    -- its recommended to load legendary.nvim before other plugins
    priority = 10000,
    lazy = false,
    enabled = false,
    -- sqlite is only needed if you want to use frecency sorting
    -- dependencies = { "kkharji/sqlite.lua" },
    -- init = function()
    --   require("my.utils.lsp").on_attach(function(client, bufnr)
    --     if vim.tbl_contains(lsp_bound_buffer_ids, bufnr) then return end
    --     -- setup LSP-specific keymaps
    --     require("legendary").keymaps(require("my.legendary.keymap").lsp_keymaps(bufnr))
    --     require("legendary").commands(require("my.legendary.commands").lsp_commands(bufnr, client.name))
    --     table.insert(lsp_bound_buffer_ids, bufnr)
    --   end)
    -- end,
    opts = {
      -- keymaps = require("my.legendary.keymap").default_keymaps,
      -- commands = require("my.legendary.commands").default_commands,
      -- autocmds = require("my.legendary.autocmds").default_autocmds,
      -- funcs = require("my.legendary.functions").default_functions,
      col_separator_char = " ",
      default_opts = {
        keymaps = { silent = true, noremap = true },
      },

      extensions = {
        -- nvim_tree = true,
        which_key = { auto_register = true },
        lazy_nvim = true,
        smart_splits = {
          -- prev_win = "<C-\\>",
          -- directions = { "h", "j", "k", "l" },
          mods = {
            move = "<C>",
            resize = "<M>",
            swap = {
              prefix = "<C-w>s",
              mod = "",
            },
          },
        },
        op_nvim = false,
        diffview = true,
      },
    },
  },
  -- },
  {
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              -- ["<c-w>"] = {
              --   name = "Window",
              --   -- s = "Split window",
              --   -- v = "Split window vertically",
              --   w = "Switch windows",
              --   q = "Quit a window",
              --   o = "Close all other windows",
              --   T = "Break out into a new tab",
              --   ["-"] = "Decrease height",
              --   ["+"] = "Increase height",
              --   ["<lt>"] = "Decrease width",
              --   [">"] = "Increase width",
              --   ["|"] = "Max out the width",
              --   ["_"] = "Max out the height",
              --   ["="] = "Equally high and wide",
              --   -- h = "Go to the left window",
              --   -- l = "Go to the right window",
              --   -- k = "Go to the up window",
              --   -- j = "Go to the down window",
              --   s = {
              --     name = "Smart Swap",
              --     x = "Swap current with next",
              --     -- ["h"] = {
              --     --   function() require("smart-splits").swap_buf_left() end,
              --     --   desc = "Smart Swap Buffer Left",
              --     -- },
              --   },
              -- },

              -- disable default mapping
              -- ["<A-h>"] = {
              --   function() require("smart-splits").resize_left() end,
              --   desc = "Smart Resize Left",
              -- },
              -- ["<A-j>"] = { function() require("smart-splits").resize_down() end, desc = "Smart Resize Down" },
              -- ["<A-k>"] = { function() require("smart-splits").resize_up() end, desc = "Smart Resize Up" },
              -- ["<A-l>"] = { function() require("smart-splits").resize_right() end, desc = "Smart Resize Right" },
              -- -- moving between splits
              -- ["<C-h>"] = {
              --   function() require("smart-splits").move_cursor_left() end,
              --   desc = "Smart Move Cursor Left",
              -- },
              -- ["<C-j>"] = {
              --   function() require("smart-splits").move_cursor_down() end,
              --   desc = "Smart Move Cursor Down",
              -- },
              -- ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Smart Move Cursor Up" },
              -- ["<C-l>"] = {
              --   function() require("smart-splits").move_cursor_right() end,
              --   desc = "Smart Move Cursor Right",
              -- },
              -- ["<C-\\>"] = {
              --   function() require("smart-splits").move_cursor_previous() end,
              --   desc = "Smart Move Cursor Previous",
              -- },
              -- swapping buffers between windows
              -- ["<C-w>sh"] = {
              --   function() require("smart-splits").swap_buf_left() end,
              --   desc = "Smart Swap Buffer Left",
              -- },
              --
              -- ["<C-w>sj"] = {
              --   function() require("smart-splits").swap_buf_down() end,
              --   desc = "Smart Swap Buffer Down",
              -- },
              -- ["<C-w>sk"] = {
              --   function() require("smart-splits").swap_buf_up() end,
              --   desc = "Smart Swap Buffer Up",
              -- },
              -- ["<C-w>sl"] = {
              --   function() require("smart-splits").swap_buf_right() end,
              --   desc = "Smart Swap Buffer Right",
              -- },
              ["<C-w>s/"] = {
                function() require("smart-splits").swap_buf_previous() end,
                desc = "Smart Swap Buffer Previous",
              },

              -- resizing splits
              ["<C-w>R"] = { function() require("smart-splits").start_resize_mode() end, desc = "Smart Resize Mode" }, -- end_resize_mode()
            },
          },
        },
      },
    },
  },
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call

  {
    "windwp/nvim-autopairs",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.nvim-autopairs"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom autopairs configuration such as custom rules
      local npairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"
      local cond = require "nvim-autopairs.conds"
      npairs.add_rules(
        {
          Rule("$", "$", { "tex", "latex" })
            -- don't add a pair if the next character is %
            :with_pair(cond.not_after_regex "%%")
            -- don't add a pair if  the previous character is xxx
            :with_pair(
              cond.not_before_regex("xxx", 3)
            )
            -- don't move right when repeat character
            :with_move(cond.none())
            -- don't delete if the next character is xx
            :with_del(cond.not_after_regex "xx")
            -- disable adding a newline when you press <cr>
            :with_cr(cond.none()),
        },
        -- disable for .vim files, but it work for another filetypes
        Rule("a", "a", "-vim")
      )
    end,
  },

  {
    "chrisgrieser/nvim-scissors",
    dependencies = "folke/snacks.nvim", -- optional
    opts = {
      snippetDir = "U:/nvim/snippets",
    },
  },
  {
    "mangelozzi/rgflow.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>r"] = { desc = "󱎸 RipGrep" },
            },
          },
        },
      },
    },
    opts = {

      default_trigger_mappings = true,
      default_ui_mappings = true,
      default_quickfix_mappings = true,

      -- WARNING !!! Glob for '-g *{*}' will not use .gitignore file: https://github.com/BurntSushi/ripgrep/issues/2252
      cmd_flags = (
        "--smart-case -g *.{*,py} -g !*.{min.js,pyc} --fixed-strings --no-fixed-strings --no-ignore -M 500"
        -- Exclude globs
        .. " -g !**/.angular/"
        .. " -g !**/node_modules/"
        .. " -g !**/static/*/jsapp/"
        .. " -g !**/static/*/wcapp/"
      ),
    },
  },
  -- {
  --   "rolv-apneseth/tfm.nvim",
  --   lazy = false,
  --   opts = {
  --     -- default_mappings = false,
  --     enable_cmds = true,
  --   },
  --   dependencies = {
  --     {
  --       "AstroNvim/astrocore",
  --       opts = {
  --         mappings = {
  --           n = {
  --             ["<Leader>y"] = { ":Tfm<CR>", desc = "󰝰 Yazi File Manager" },
  --           },
  --         },
  --       },
  --     },
  --   },
  -- },
  ---@type LazySpec
  {
    "mikavilpas/yazi.nvim",
    event = "VeryLazy",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["<Leader>y"] = { "<cmd>Yazi<cr>", desc = "󰝰 Yazi File" },
              ["<Leader>Y"] = { "<cmd>Yazi cwd<cr>", desc = "󰝰 Yazi Work Directory" },
              ["<Leader><Up>"] = { "<cmd>Yazi toggle<cr>", desc = "󰝰 Yazi Resume" },
            },
          },
        },
      },
    },

    ---@type YaziConfig
    opts = {
      -- if you want to open yazi instead of netrw, see below for more info
      open_for_directories = false,
      -- the transparency of the yazi floating window (0-100). See :h winblend
      yazi_floating_window_winblend = 10,
      -- enable these if you are using the latest version of yazi
      use_ya_for_events_reading = true,
      use_yazi_client_id_flag = true,
      -- highlight buffers in the same directory as the hovered buffer
      highlight_hovered_buffers_in_same_directory = true,
      keymaps = {
        show_help = "<f1>",
      },
    },
  },
  {
    "lewis6991/hover.nvim",
    enabled = true,
    opts = {
      init = function()
        -- Require providers
        require "hover.providers.lsp"
        require "hover.providers.gh"
        -- require('hover.providers.jira')
        require "hover.providers.man"
        require "hover.providers.dictionary"
      end,
      preview_opts = {
        border = "single",
        focusable = true,
        focus = true,
      },
      -- Whether the contents of a currently open hover window should be moved
      -- to a :h preview-window when pressing the hover keymap.
      preview_window = true,
      title = true,
      mouse_providers = {
        "LSP",
      },
      mouse_delay = 1000,
    },
    config = function(lazy, opts)
      require("hover").setup(opts)
      -- Setup keymaps
      -- vim.keymap.set("n", "K", hover.hover, { desc = "hover.nvim" })
      -- vim.keymap.set("n", "gh", hover.hover_select, { desc = "hover.nvim (select)" })
      -- vim.keymap.set(
      --   "n",
      --   "<C-p>",
      --   function() hover.hover_switch("previous", hover.Options) end,
      --   { desc = "hover.nvim (previous source)" }
      -- )
      -- vim.keymap.set(
      --   "n",
      --   "<C-n>",
      --   function() hover.hover_switch("next", hover.Options) end,
      --   { desc = "hover.nvim (next source)" }
      -- )
      -- Mouse support
      -- vim.keymap.set("n", "<MouseMove>", require("hover").hover_mouse, { desc = "hover.nvim (mouse)" })
      vim.o.mousemoveevent = false
    end,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {
              ["gh"] = { desc = " Hover" },
              ["ghh"] = { function() require("hover").hover() end, desc = "Hover" },
              ["ghs"] = { function() require("hover").hover_select() end, desc = "Hover Select" },
              ["ghp"] = { function() require("hover").hover_switch "previous" end, desc = "Hover Previous" },
              ["ghn"] = { function() require("hover").hover_switch "next" end, desc = "Hover Next" },
              ["<MouseMove>"] = { function() require("hover").hover_mouse() end, desc = "Hover Mouse" },
            },
          },
        },
      },
    },
  },
  {
    "tzachar/highlight-undo.nvim",
  },
  {
    "tpope/vim-rhubarb",
    dependencies = {
      "tpope/vim-fugitive",
    },
  },
  {
    "mhinz/vim-grepper",
    lazy = true,
    cmd = "Grepper",
    -- "<plug>(GrepperOperator)" },
  },
  {
    "sphamba/smear-cursor.nvim",
    enabled = false,
    event = "VeryLazy",
    cond = vim.g.neovide == nil,
    opts = {
      hide_target_hack = true,
      cursor_color = "none",
      legacy_computing_symbols_support = true,
    },
    specs = {
      -- disable mini.animate cursor
      {
        "echasnovski/mini.animate",
        optional = true,
        opts = {
          cursor = { enable = false },
        },
      },
    },
  },
  {
    "Saghen/blink.cmp",
    -- dependencies = {
    --   {
    --     "giuxtaposition/blink-cmp-copilot",
    --   },
    -- },
    specs = {
      {
        "Saghen/blink.cmp",
        opts = {
          -- sources = {
          --   default = { "lsp", "path", "snippets", "buffer", "copilot" },
          --   providers = {
          --     copilot = {
          --       name = "copilot",
          --       module = "blink-cmp-copilot",
          --       score_offset = 100,
          --       async = true,
          --     },
          --   },
          -- },
          fuzzy = {
            implementation = "prefer_rust",
            prebuilt_binaries = { download = true, ignore_version_mismatch = false },
          },
        },
      },
    },
    -- opts = {
    --   fuzzy = {
    --     implementation = "prefer_rust",
    --     prebuilt_binaries = { download = true, ignore_version_mismatch = false },
    --   },
    -- },
  },
  {
    "nvim-tree/nvim-web-devicons",
    enabled = false,
  },
  {
    "folke/todo-comments.nvim",
    optional = true,
    keys = {
      { "<leader>st", function() Snacks.picker.todo_comments() end, desc = "Todo" },
      {
        "<leader>sT",
        function() Snacks.picker.todo_comments { keywords = { "TODO", "FIX", "FIXME" } } end,
        desc = "Todo/Fix/Fixme",
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
  },
  {
    "nvzone/typr",
    dependencies = "nvzone/volt",
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },
}
