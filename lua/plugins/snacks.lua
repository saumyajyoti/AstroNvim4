local Snacks = require "snacks"

local pick_chezmoi = function()
  local results = require("chezmoi.commands").list {
    args = {
      "--path-style",
      "absolute",
      "--include",
      "files",
      "--exclude",
      "externals",
    },
  }
  local items = {}

  for _, czFile in ipairs(results) do
    table.insert(items, {
      text = czFile,
      file = czFile,
    })
  end

  ---@type snacks.picker.Config
  local opts = {
    items = items,
    confirm = function(picker, item)
      picker:close()
      require("chezmoi.commands").edit {
        targets = { item.text },
        args = { "--watch" },
      }
    end,
  }
  Snacks.picker.pick(opts)
end

return {
  {
    "folke/snacks.nvim",
    specs = {
      {
        "AstroNvim/astrocore",

        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>fL"] = { function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" }
          maps.n["<Leader>f."] = { pick_chezmoi, desc = "Find Dot Files (Chezmoi)" }
        end,
      },
      {
        "folke/snacks.nvim",
        optional = true,
        opts = function(_, opts)
          local chezmoi_entry = {
            icon = " ",
            key = ".",
            desc = "Chezmoi Config",
            action = pick_chezmoi,
          }
          local config_index
          for i = #opts.dashboard.preset.keys, 1, -1 do
            if opts.dashboard.preset.keys[i].key == "c" then
              -- table.remove(opts.dashboard.preset.keys, i)
              config_index = i
              break
            end
          end
          table.insert(opts.dashboard.preset.keys, config_index, chezmoi_entry)
        end,
      },
      {
        "folke/snacks.nvim",

        opts = {
          toggle = { enabled = true },
          indent = {
            enabled = true,
            indent = {
              priority = 1,
              enabled = true, -- enable indent guides
              char = "│",
              only_scope = true, -- only show indent guides of the scope
              only_current = true, -- only show indent guides in the current window
              hl = "SnacksIndent", ---@type string|string[] hl groups for indent guides
              -- can be a list of hl groups to cycle through
              -- hl = {
              --   "SnacksIndent1",
              --   "SnacksIndent2",
              --   "SnacksIndent3",
              --   "SnacksIndent4",
              --   "SnacksIndent5",
              --   "SnacksIndent6",
              --   "SnacksIndent7",
              --   "SnacksIndent8",
              -- },
            },
            animate = {
              enabled = vim.fn.has "nvim-0.10" == 1,
              style = "out",
              easing = "linear",
              duration = {
                step = 30, -- ms per step
                total = 1000, -- maximum duration
              },
            },
          },
          animate = {
            enabled = false,
            -- your animate configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          },
          scroll = {
            enabled = true,
            -- your scroll configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            animate = {
              duration = { step = 15, total = 250 },
              easing = "linear",
            },
            -- faster animation when repeating scroll after delay
            animate_repeat = {
              delay = 100, -- delay in ms before using the repeat animation
              duration = { step = 5, total = 50 },
              easing = "linear",
            },
            -- what buffers to animate
            filter = function(buf)
              return vim.g.snacks_scroll ~= false
                and vim.b[buf].snacks_scroll ~= false
                and vim.bo[buf].buftype ~= "terminal"
            end,
          },
          notifier = {
            -- your notifier configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            enabled = true,
          },
          explorer = {
            enabled = true,
            -- your explorer configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
          },
          ---@class snacks.picker.Config
          picker = {
            win = {
              preview = {
                wo = {
                  number = false,
                  relativenumber = false,
                  signcolumn = "no",
                  foldcolumn = "0",
                },
              },
            },
            sources = {
              explorer = {
                -- your explorer picker configuration comes here
                -- or leave it empty to use the default settings
              },
            },
          },
        },
      },
    },
  },
}
