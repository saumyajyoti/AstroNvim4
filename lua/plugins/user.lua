-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function() require("lsp_signature").setup() end,
  -- },

  -- == Examples of Overriding Plugins ==

  {
    "b0o/incline.nvim",
    config = function()
      require("incline").setup {
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
          local modified = vim.bo[props.buf].modified and "bold,italic" or "bold"

          local function get_git_diff()
            local icons = { removed = " ", changed = " ", added = " " }
            icons["changed"] = icons.modified
            local signs = vim.b[props.buf].gitsigns_status_dict
            local labels = {}
            if signs == nil then return labels end
            for name, icon in pairs(icons) do
              if tonumber(signs[name]) and signs[name] > 0 then
                table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
              end
            end
            if #labels > 0 then table.insert(labels, { "┊ " }) end
            return labels
          end
          local function get_diagnostic_label()
            local icons = { error = " ", warn = " ", info = " ", hint = "" }
            local label = {}

            for severity, icon in pairs(icons) do
              local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
              if n > 0 then table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity }) end
            end
            if #label > 0 then table.insert(label, { "┊ " }) end
            return label
          end

          local buffer = {
            { get_diagnostic_label() },
            { get_git_diff() },
            { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
            { filename .. " ", gui = modified },
            { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
          }
          return buffer
        end,
      }
    end,
    -- Optional: Lazy load Incline
    event = "VeryLazy",
  },
  -- You can disable default plugins as follows:

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
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
    "p00f/clangd_extensions.nvim",
    init = function()
      -- load clangd extensions when clangd attaches
      local augroup = vim.api.nvim_create_augroup("clangd_extensions", { clear = true })
      vim.api.nvim_create_autocmd("LspAttach", {
        group = augroup,
        desc = "Load clangd_extensions with clangd",
        callback = function(args)
          if assert(vim.lsp.get_client_by_id(args.data.client_id)).name == "clangd" then
            require "clangd_extensions"
            vim.api.nvim_del_augroup_by_id(augroup)
          end
        end,
      })
    end,
  },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = function(_, opts) opts.inlay_hints = { enabled = true } end,
  -- },
  -- noice
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
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.neovide,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      cmdline = { view = "cmdline_popup" },
      messages = {
        view_history = "messages", -- view for :messages
        view_search = false, -- view for search count messages. Set to `false` to disable
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = false,
        },
        progress = { enabled = false },
        hover = { enabled = false, silent = false },
        signature = { enabled = false },
      },
      routes = {
        -- { filter = { event = "msg_show", find = "%d+L,%s%d+B" }, opts = { skip = true } }, -- skip save notifications
        -- { filter = { event = "msg_show", find = "^%d+ more lines$" }, opts = { skip = true } }, -- skip paste notifications
        -- { filter = { event = "msg_show", find = "^%d+ fewer lines$" }, opts = { skip = true } }, -- skip delete notifications
        { filter = { event = "msg_show", find = "^%d+ lines yanked" }, opts = { skip = true } }, -- skip yank notifications
        { filter = { event = "msg_show", find = "deprecated" }, opts = { skip = true } }, -- skip nvim deperecated notifications
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "^%d+ changes?; after #%d+" },
              { find = "^%d+ changes?; before #%d+" },
              { find = "^Hunk %d+ of %d+$" },
              { find = "^%d+ fewer lines;?" },
              { find = "^%d+ more lines?;?" },
              { find = "^%d+ line less;?" },
              { find = "^Already at newest change" },
              { kind = "wmsg" },
              { kind = "emsg", find = "E486" },
              { kind = "quickfix" },
            },
          },
          view = "mini",
        },
        -- {
        --   filter = {
        --     event = "notify",
        --     find = "No information available",
        --   },
        --   opts = { skip = true },
        -- }, -- skip hoverdoc no info msgs
        {
          filter = {
            event = "notify",
            any = {
              { find = "^No code actions available$" },
              { find = "^No information available$" },
            },
          },
          view = "mini",
        },
      },
      commands = {
        all = {
          view = "split",
          opts = { enter = true, format = "details" },
          filter = {},
        },
      },
      presets = {
        long_message_to_split = true,
        command_palette = true,
        bottom_search = true, -- use a classic bottom cmdline for search
        lsp_doc_border = true,
        inc_rename = true,
      },
    },
    -- init = function() vim.g.lsp_handlers_enabled = false end,
    keys = {
      {
        "<S-Enter>",
        function() require("noice").redirect(vim.fn.getcmdline()) end,
        mode = "c",
        desc = "Redirect Cmdline",
      },
    },
  },
}
