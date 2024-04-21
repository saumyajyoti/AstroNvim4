-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

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
    "mrjones2014/smart-splits.nvim",
    lazy = false,
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = {

              ["<A-h>"] = {
                function() require("smart-splits").resize_left() end,
                desc = "Smart Resize Left",
              },
              ["<A-j>"] = { function() require("smart-splits").resize_down() end, desc = "Smart Resize Down" },
              ["<A-k>"] = { function() require("smart-splits").resize_up() end, desc = "Smart Resize Up" },
              ["<A-l>"] = { function() require("smart-splits").resize_right() end, desc = "Smart Resize Right" },
              -- moving between splits
              ["<C-h>"] = {
                function() require("smart-splits").move_cursor_left() end,
                desc = "Smart Move Cursor Left",
              },
              ["<C-j>"] = {
                function() require("smart-splits").move_cursor_down() end,
                desc = "Smart Move Cursor Down",
              },
              ["<C-k>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Smart Move Cursor Up" },
              ["<C-l>"] = {
                function() require("smart-splits").move_cursor_right() end,
                desc = "Smart Move Cursor Right",
              },
              ["<C-\\>"] = {
                function() require("smart-splits").move_cursor_previous() end,
                desc = "Smart Move Cursor Previous",
              },
              -- swapping buffers between windows
              ["<leader><leader>h"] = {
                function() require("smart-splits").swap_buf_left() end,
                desc = "Smart Swap Buffer Left",
              },
              ["<leader><leader>j"] = {
                function() require("smart-splits").swap_buf_down() end,
                desc = "Smart Swap Buffer Down",
              },
              ["<leader><leader>k"] = {
                function() require("smart-splits").swap_buf_up() end,
                desc = "Smart Swap Buffer Up",
              },
              ["<leader><leader>l"] = {
                function() require("smart-splits").swap_buf_right() end,
                desc = "Smart Swap Buffer Right",
              },
              ["<leader><leader>\\"] = {
                function() require("smart-splits").swap_buf_previous() end,
                desc = "Smart Swap Buffer Previous",
              },

              -- resizing splits
              ["<leader>R"] = { function() require("smart-splits").start_resize_mode() end, desc = "Smart Resize Mode" }, -- end_resize_mode()
            },
          },
        },
      },
    },
  },
  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
      -- load snippets paths
      require("luasnip.loaders.from_vscode").lazy_load {
        paths = { "U:/nvim/snippets" },
      }
    end,
  },

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
    "folke/which-key.nvim",
    opts = {
      icons = {
        separator = " ", -- "➜ ",
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    -- init = false,
    -- config = true,
    keys = {
      {
        "<leader>ux",
        function() require("notify").dismiss { silent = true, pending = true } end,
        desc = "Dismiss all Notifications",
      },
    },
    opts = function(_, opts)
      -- local nonicons_extention = require("nvim-nonicons.extentions.nvim-notify")

      opts.stages = "fade" -- fade_in_slide_out",
      opts.timeout = 3000
      -- opts.icons = nonicons_extention.icons
    end,
  },

  {
    "chrisgrieser/nvim-scissors",
    dependencies = "nvim-telescope/telescope.nvim", -- optional
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
  --   "rebelot/heirline.nvim",
  --   opts = function(_, opts)
  --     local status = require "astroui.status"
  --
  --     opts.statusline[1] = status.component.mode { mode_text = { padding = { left = 1, right = 1 } } } -- add the mode text
  --     opts.statusline[3] = status.component.file_info {
  --       -- enable the file_icon and disable the highlighting based on filetype
  --       filename = { fallback = "Empty" },
  --       -- disable some of the info
  --       filetype = false,
  --       file_read_only = false,
  --       -- add padding
  --       padding = { right = 1 },
  --       -- define the section separator
  --       surround = { separator = "left", condition = false },
  --     }
  --     opts.statusline = nil
  --   end,
  -- },
}
