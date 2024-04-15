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
  --   "mrjones2014/smart-splits.nvim",
  --   lazy = false,
  -- },
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
  -- {
  --   "p00f/clangd_extensions.nvim",
  --   init = function()
  --     -- load clangd extensions when clangd attaches
  --     local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
  --     vim.api.nvim_create_autocmd("LspAttach", {
  --       group = augroup,
  --       desc = "Load clangd_extensions with clangd",
  --       callback = function(args)
  --         if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
  --           require "clangd_extensions"
  --           vim.api.nvim_del_augroup_by_id(augroup)
  --         end
  --       end,
  --     })
  --   end,
  -- },
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
}
