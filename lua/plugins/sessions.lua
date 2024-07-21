if true then return {} end
-- return {
--   "rmagatti/auto-session", -- auto save session
--   config = function()

--     require("auto-session").setup {
--       log_level = "error",
--       auto_session_suppress_dirs = {
--         "~/",
--         "~/Downloads",
--         "~/Documents",
--       },
--       auto_session_use_git_branch = true,
--       auto_save_enabled = true,
--     }
--   end,
-- }
--

return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    autocmds = {
      -- disable alpha autostart
      alpha_autostart = false,
      restore_session = {
        {
          event = "VimEnter",
          desc = "Restore previous directory session if neovim opened with no arguments",
          nested = true, -- trigger other autocommands as buffers open
          callback = function()
            -- Only load the session if nvim was started with no args
            if vim.fn.argc(-1) == 0 then
              -- try to load a directory session using the current working directory
              require("resession").load(vim.fn.getcwd(), { dir = "dirsession", silence_errors = true })
            end
          end,
        },
      },
    },
  },
}
