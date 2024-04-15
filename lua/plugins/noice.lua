return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    cond = not vim.g.neovide,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {
      messages = {
        view_search = false, -- view for search count messages. Set to `false` to disable
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
        progress = { enabled = true },
        hover = { enabled = false, silent = false },
        signature = { enabled = false },
      },
      routes = {
        -- { filter = { event = "msg_show", find = "%d+L,%s%d+B" }, opts = { skip = true } }, -- skip save notifications
        -- { filter = { event = "msg_show", find = "^%d+ more lines$" }, opts = { skip = true } }, -- skip paste notifications
        -- { filter = { event = "msg_show", find = "^%d+ fewer lines$" }, opts = { skip = true } }, -- skip delete notifications
        { filter = { event = "msg_show", find = "^%d+ lines yanked" }, opts = { skip = true } }, -- skip yank notifications
        -- { filter = { event = "msg_show", find = "deprecated" }, opts = { skip = true } }, -- skip nvim deperecated notifications
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
              -- { kind = "wmsg" },
              { kind = "emsg", find = "E486" },
              -- { kind = "quickfix" },
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
      -- commands = {
      --   all = {
      --     view = "split",
      --     opts = { enter = true, format = "details" },
      --     filter = {},
      --   },
      -- },
      presets = {
        long_message_to_split = true,
        command_palette = true,
        bottom_search = true, -- use a classic bottom cmdline for search
        -- lsp_doc_border = true,
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
