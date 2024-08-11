-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  --
  -- Files
  --
  { import = "astrocommunity.file-explorer.oil-nvim" },
  { import = "astrocommunity.file-explorer.mini-files" },
  { import = "astrocommunity.search.nvim-spectre" },
  { import = "astrocommunity.search.grug-far-nvim" },
  { import = "astrocommunity.quickfix.nvim-bqf" },
  { import = "astrocommunity.test.neotest" },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "alfaix/neotest-gtest",
      -- your other adapters here
    },
    opts = {
      adapters = {
        "neotest-gtest",
      },
    },
  },
  --
  -- MD
  --
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.markdown-preview-nvim" },
  { import = "astrocommunity.markdown-and-latex.peek-nvim" },
  { import = "astrocommunity.markdown-and-latex.markmap-nvim" },
  --
  -- Packs
  --
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.ps1" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.cmake" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.cs" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.go" },
  -- { import = "astrocommunity.icon.mini-icons" },
  { import = "astrocommunity.pack.chezmoi" },

  --
  -- editing
  --
  { import = "astrocommunity.editing-support.treesj" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.text-case-nvim" },
  -- { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.dial-nvim" },
  { import = "astrocommunity.editing-support.comment-box-nvim" },
  { import = "astrocommunity.editing-support.nvim-devdocs" },

  -- { import = "astrocommunity.search.sad-nvim" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.terminal-integration.flatten-nvim" },
  { import = "astrocommunity.completion.cmp-cmdline" },
  { import = "astrocommunity.completion.cmp-git" },
  { import = "astrocommunity.completion.cmp-nerdfont" },

  { import = "astrocommunity.search.nvim-hlslens" },
  {
    "kevinhwang91/nvim-hlslens",
    opts = function(_, opts) opts.calm_down = true end,
  },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.fuzzy-finder.telescope-zoxide" },
  { import = "astrocommunity.file-explorer.telescope-file-browser-nvim" },
  { import = "astrocommunity.utility.telescope-live-grep-args-nvim" },
  { import = "astrocommunity.utility.telescope-lazy-nvim" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.lsp.lspsaga-nvim" },
  { import = "astrocommunity.utility.nvim-toggler" },
  {
    "nguyenvukhang/nvim-toggler",
    opts = function(_, opts)
      opts.inverses = {
        ["TRUE"] = "FALSE",
      }
    end,
  },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  {
    "karb94/neoscroll.nvim",
    opts = function(_, opts) opts.easing = "quadratic" end,
  },
  -- { import = "astrocommunity.scrolling.vim-smoothie" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.git.fugit2-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.openingh-nvim" },
  { import = "astrocommunity.git.octo-nvim" },
  { import = "astrocommunity.git.gitlinker-nvim" },

  -- { import = "astrocommunity.git.neogit" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.cutlass-nvim" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.editing-support.bigfile-nvim" },
  { import = "astrocommunity.neovim-lua-development.lazydev-nvim" },
  {
    "folke/lazydev.nvim",
    dependencies = {
      { "justinsgithub/wezterm-types", lazy = true },
    },
    opts = function(_, opts)
      require("astrocore").list_insert_unique(opts.library, {
        -- Load the wezterm types when the `wezterm` module is required
        -- Needs `justinsgithub/wezterm-types` to be installed
        { path = "wezterm-types", mods = { "wezterm" } },
      })
    end,
  },
  { import = "astrocommunity.editing-support.conform-nvim" },
  -- { import = "astrocommunity.color.modes-nvim" },
  { import = "astrocommunity.color.nvim-highlight-colors" },
  -- { import = "astrocommunity.recipes.auto-session-restore" },
  { import = "astrocommunity.motion.grapple-nvim" },
}
