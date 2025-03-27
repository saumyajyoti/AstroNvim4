-- if true then return {} end -- disable noice

return {
  {
    "folke/noice.nvim",
    enabled = true,
    event = "VeryLazy",
    cond = not vim.g.neovide,
    dependencies = {
      -- "MunifTanjim/nui.nvim",
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            c = {
              ["<C-Enter>"] = {
                function() require("noice").redirect(vim.fn.getcmdline()) end,
                desc = "Redirect Commandline",
              },
            },
          },
        },
      },
    },
    opts = {
      popupmenu = {
        -- cmp-cmdline has more sources and can be extended
        -- backend = "cmp", -- backend to use to show regular cmdline completions
      },
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
    config = function(_, opts)
      -- HACK: noice shows messages from before it was enabled,
      -- but this is not ideal when Lazy is installing plugins,
      -- so clear the messages in this case.
      if vim.o.filetype == "lazy" then vim.cmd [[messages clear]] end
      require("noice").setup(opts)
    end,
    specs = {
      {
        "nvim-treesitter/nvim-treesitter",
        opts = function(_, opts)
          if opts.ensure_installed ~= "all" then
            opts.ensure_installed = require("astrocore").list_insert_unique(
              opts.ensure_installed,
              { "bash", "markdown", "markdown_inline", "regex", "vim" }
            )
          end
        end,
      },
      -- {
      --   "AstroNvim/astrolsp",
      --   optional = true,
      --   ---@param opts AstroLSPOpts
      --   opts = function(_, opts)
      --     local noice_opts = require("astrocore").plugin_opts "noice.nvim"
      --     -- disable the necessary handlers in AstroLSP
      --     if not opts.defaults then opts.defaults = {} end
      --     -- TODO: remove lsp_handlers when dropping support for AstroNvim v4
      --     if not opts.lsp_handlers then opts.lsp_handlers = {} end
      --     if vim.tbl_get(noice_opts, "lsp", "hover", "enabled") ~= false then
      --       opts.defaults.hover = nil
      --       opts.lsp_handlers["textDocument/hover"] = false
      --     end
      --     if vim.tbl_get(noice_opts, "lsp", "signature", "enabled") ~= false then
      --       opts.defaults.signature_help = nil
      --       opts.lsp_handlers["textDocument/signatureHelp"] = false
      --       if not opts.features then opts.features = {} end
      --       opts.features.signature_help = true
      --     end
      --   end,
      -- },
    },
    -- init = function() vim.g.lsp_handlers_enabled = false end,
  },
}
