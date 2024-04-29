-- https://github.com/kabinspace/AstroNvim_user/blob/master/lua/plugins/clangd_extensions.lua
--

---@type LazySpec
return {
  "p00f/clangd_extensions.nvim",
  lazy = true,
  opts = function(_, opts)
    opts.inlay_hints = {
      parameter_hints_prefix = " ",
      other_hints_prefix = " ",
      highlight = "LspInlayHint",
    }
  end,
}
