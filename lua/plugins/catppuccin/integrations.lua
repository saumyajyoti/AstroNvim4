return {
  -- alpha = true,
  sandwich = false,
  noice = true,
  -- mini = true,
  leap = true,
  markdown = true,
  neotest = true,
  -- cmp = true,
  overseer = true,
  lsp_trouble = true,
  -- ts_rainbow2 = true,
  rainbow_delimiters = true,
  mason = true,
  -- neotree = true,
  notify = true,
  which_key = true,
  treesitter = true,
  flash = true,
  -- treesitter_context = true,
  aerial = true,
  semantic_tokens = true,
  -- symbols_outline = true,
  -- telescope = { enabled = true, style = "nvchad" },
  dap = { enabled = true, enable_ui = true },
  gitsigns = true,
  -- indent_blankline = {
  --   enabled = true,
  --   scope_color = "overlay1",
  --   colored_indent_levels = true,
  -- },
  snacks = {
    enabled = true,
    indent_scope_color = "overlay1", -- catppuccin color (eg. `lavender`) Default: text
  },
  mini = {
    enabled = true,
    indentscope_color = "overlay2", -- catppuccin color (eg. `lavender`) Default: text
  },
  native_lsp = {
    enabled = true,
    virtual_text = {
      errors = { "italic" },
      hints = { "italic" },
      warnings = {},
      information = {},
    },
    underlines = {
      errors = {},
      hints = {},
      warnings = {},
      information = {},
    },
    inlay_hints = {
      background = true,
    },
    blink_cmp = true,
  },
}
