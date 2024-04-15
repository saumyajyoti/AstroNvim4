vim.api.nvim_create_user_command("Insp", function() require("noice").redirect "Inspect!" end, { nargs = 0 })
vim.cmd "aunmenu PopUp.How-to\\ disable\\ mouse"
vim.cmd "aunmenu PopUp.-1-"

if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
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
