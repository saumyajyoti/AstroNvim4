-- https://github.com/crivotz/nv-ide/blob/master/lua/config/plugins/nvim-ufo.lua
local hlslens = require "hlslens"
local function nN(char)
  local ok, winid = hlslens.nNPeekWithUFO(char)
  if ok and winid then
    -- Safe to override buffer scope keymaps remapped by ufo,
    -- ufo will restore previous buffer keymaps before closing preview window
    -- Type <CR> will switch to preview window and fire `trace` action
    vim.keymap.set("n", "<CR>", function() return "<Tab><CR>" end, { buffer = true, remap = true, expr = true })
  end
end

return {
  "kevinhwang91/nvim-ufo",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  event = "BufRead",
  keys = {
    { "zR", function() require("ufo").openAllFolds() end, desc = "Open all folds" },
    { "zM", function() require("ufo").closeAllFolds() end, desc = "Close all folds" },
    { "zZ", function() require("ufo").peekFoldedLinesUnderCursor() end, desc = "Peek folded lines under cursor" },

    { "n", function() nN "n" end, mode = { "n", "x" }, desc = "UFO Next" },
    { "N", function() nN "N" end, mode = { "n", "x" }, desc = "UFO Prev" },
  },
  opts = {
    open_fold_hl_timeout = 0,
    fold_virt_text_handler = function(text, lnum, endLnum, width)
      local suffix = " ∙∙∙ "
      local lines = ("[%d lines] "):format(endLnum - lnum)

      local cur_width = 0
      for _, section in ipairs(text) do
        cur_width = cur_width + vim.fn.strdisplaywidth(section[1])
      end

      suffix = suffix .. (" "):rep(width - cur_width - vim.fn.strdisplaywidth(lines) - 3)

      table.insert(text, { suffix, "Comment" })
      table.insert(text, { lines, "Todo" })
      return text
    end,
    preview = {
      win_config = {
        border = { "┏", "━", "┓", "┃", "┛", "━", "┗", "┃" },
        winblend = 0,
        winhighlight = "Normal:LazyNormal",
      },
    },
  },
}
