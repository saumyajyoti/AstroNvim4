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
  { import = "astrocommunity.project.nvim-spectre" },
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.test.neotest" },
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
  { import = "astrocommunity.search.nvim-hlslens" },
  {
    "kevinhwang91/nvim-hlslens",
    opts = function(_, opts) opts.calm_down = true end,
  },
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.code-runner.overseer-nvim" },
  { import = "astrocommunity.lsp.inc-rename-nvim" },
  { import = "astrocommunity.utility.nvim-toggler" },
  {
    "nguyenvukhang/nvim-toggler",
    opts = function(_, opts)
      opts.inverses = {
        ["TRUE"] = "FALSE",
      }
    end,
  },
  { import = "astrocommunity.completion.copilot-lua" },
  { import = "astrocommunity.completion.copilot-lua-cmp" },
  { import = "astrocommunity.lsp.lsp-signature-nvim" },
  { import = "astrocommunity.scrolling.mini-animate" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.editing-support.vim-visual-multi" },
  { import = "astrocommunity.color.tint-nvim" },
  { import = "astrocommunity.git.fugit2-nvim" },
  { import = "astrocommunity.editing-support.nvim-context-vt" },
  { import = "astrocommunity.editing-support.cutlass-nvim" },
}
