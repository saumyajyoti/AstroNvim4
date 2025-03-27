vim.api.nvim_create_user_command("Insp", function() require("noice").redirect "Inspect!" end, { nargs = 0 })
vim.cmd "aunmenu PopUp.How-to\\ disable\\ mouse"
vim.cmd "aunmenu PopUp.-1-"
-- local function custom_attach(client, bufnr)
--   require("lsp_signature").on_attach {
--     bind = true,
--     use_lspsaga = false,
--     floating_window = true,
--     fix_pos = true,
--     hint_enable = true,
--     hi_parameter = "Search",
--     handler_opts = { "double" },
--   }
-- end
-- local capabilities = {
--   offsetEncoding = "utf-8",
-- }
-- local ahk2_configs = {
--   autostart = true,
--   cmd = {
--     "node",
--     vim.fn.expand "$HOME/vscode-autohotkey2-lsp/server/dist/server.js",
--     "--stdio",
--   },
--   filetypes = { "ahk", "autohotkey", "ah2" },
--   init_options = {
--     locale = "en-us",
--     InterpreterPath = "C:/Program Files/AutoHotkey/v2/AutoHotkey.exe",
--     -- Same as initializationOptions for Sublime Text4, convert json literal to lua dictionary literal
--   },
--   single_file_support = true,
--   flags = { debounce_text_changes = 500 },
--   capabilities = capabilities,
--   on_attach = custom_attach,
-- }
-- local configs = require "lspconfig.configs"
-- configs["ahk2"] = { default_config = ahk2_configs }
--
-- local nvim_lsp = require "lspconfig"
-- nvim_lsp.ahk2.setup {}
if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}
