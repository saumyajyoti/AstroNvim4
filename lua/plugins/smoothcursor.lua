return {
  {
    "gen740/SmoothCursor.nvim",
    -- cond = false,
    event = "CursorMoved",
    init = function()
      -- vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#a9b665", bg = nil })

      -- vim.api.nvim_create_autocmd({ "ColorScheme" }, {
      --   pattern = { "*" },
      --   callback = function() vim.api.nvim_set_hl(0, "SmoothCursor", { fg = "#a9b665", bg = "NONE" }) end,
      -- })
    end,
    -- opts = function(_, opts)
    --   opts.cursor = "►" -- ▹ ▷ ▻ ▸  ► ▶
    --   opts.fancy = {
    --     enable = true, -- enable fancy mode
    --     head = { cursor = "▻", texthl = "SmoothCursor", linehl = nil },
    --     body = {
    --       { cursor = "󰝥", texthl = "SmoothCursorRed" },
    --       { cursor = "󰝥", texthl = "SmoothCursorOrange" },
    --       { cursor = "●", texthl = "SmoothCursorYellow" },
    --       { cursor = "●", texthl = "SmoothCursorGreen" },
    --       { cursor = "•", texthl = "SmoothCursorAqua" },
    --       { cursor = ".", texthl = "SmoothCursorBlue" },
    --       { cursor = ".", texthl = "SmoothCursorPurple" },
    --     },
    --     tail = { cursor = nil, texthl = "SmoothCursor" }, -- false to disable fancy tail
    --   }
    --   opts.flyin_effect = top -- Choose "bottom" or "top" for flying effect
    --   opts.speed = 20 -- Max speed is 100 to stic"
    -- end,
    config = function()
      -- require("smoothcursor").setup()
      require("smoothcursor").setup {
        type = "default", -- Cursor movement calculation method, choose "default", "exp" (exponential) or "matrix".

        cursor = "", -- Cursor shape (requires Nerd Font). Disabled in fancy mode.
        texthl = "SmoothCursor", -- Highlight group. Default is { bg = nil, fg = "#FFD400" }. Disabled in fancy mode.
        linehl = nil, -- Highlights the line under the cursor, similar to 'cursorline'. "CursorLine" is recommended. Disabled in fancy mode.

        fancy = {
          enable = true, -- enable fancy mode
          head = { cursor = "▶", texthl = "SmoothCursor", linehl = nil }, -- false to disable fancy head
          body = {
            { cursor = "▷", texthl = "SmoothCursorRed" },
            { cursor = "▻", texthl = "SmoothCursorOrange" },
            { cursor = "▹", texthl = "SmoothCursorYellow" },
            { cursor = "▹", texthl = "SmoothCursorPurple" },

            -- { cursor = "󰝥", texthl = "SmoothCursorRed" },
            -- { cursor = "󰝥", texthl = "SmoothCursorOrange" },
            -- { cursor = "●", texthl = "SmoothCursorYellow" },
            -- { cursor = "●", texthl = "SmoothCursorGreen" },
            -- { cursor = "•", texthl = "SmoothCursorAqua" },
            -- { cursor = ".", texthl = "SmoothCursorBlue" },
            -- { cursor = ".", texthl = "SmoothCursorPurple" },
          },
          tail = { false }, -- false to disable fancy tail
        },

        autostart = true, -- Automatically start SmoothCursor
        always_redraw = false, -- Redraw the screen on each update
        flyin_effect = "top", -- Choose "bottom" or "top" for flying effect
        speed = 25, -- Max speed is 100 to stick with your current position
        intervals = 35, -- Update intervals in milliseconds
        priority = 10, -- Set marker priority
        timeout = 3000, -- Timeout for animations in milliseconds
        threshold = 5, -- Animate only if cursor moves more than this many lines
        max_threshold = 50, -- If you move more than this many lines, don't animate (iif `nil`, deactivate check)
        disable_float_win = false, -- Disable in floating windows
        enabled_filetypes = nil, -- Enable only for specific file types, e.g., { "lua", "vim" }
        disabled_filetypes = { "help", "TelescopePrompt", "man", "qf" }, -- nil, -- Disable for these file types, ignored if enabled_filetypes is set. e.g., { "TelescopePrompt", "NvimTree" }
        -- Show the position of the latest input mode positions.
        -- A value of "enter" means the position will be updated when entering the mode.
        -- A value of "leave" means the position will be updated when leaving the mode.
        -- `nil` = disabled
        show_last_positions = nil,
      }

      local function set_hl_smcr()
        local cursor = {
          n = { char = "▶", color = "#a9b665" },
          i = { char = "▷", color = "#7fb4ca" },
          v = { char = "", color = "#bf616a" },
          V = { char = "", color = "#bf616a" },
          [""] = { char = "", color = "#bf616a" },
          R = { char = "⟩", color = "#d79921" },
        }
        local m = cursor[vim.fn.mode()] or cursor.n
        vim.fn.sign_define("smoothcursor", { text = m.char })
        vim.api.nvim_set_hl(0, "SmoothCursor", { fg = m.color, bg = nil, nocombine = true, force = true })
        require("smoothcursor.utils").smoothcursor_redraw "%"
      end
      set_hl_smcr()
      local group = vim.api.nvim_create_augroup("smooth-cursor-autocmds", {})
      local autocmd = vim.api.nvim_create_autocmd

      autocmd({ "ModeChanged", "ColorScheme" }, {
        desc = "Change signs for SmoothCursor according to modes",
        group = group,
        callback = set_hl_smcr,
      })

      autocmd("User", {
        desc = "Disable SmoothCursor.nvim in large files",
        pattern = "BigfileBufReadPost",
        group = group,
        callback = function(args)
          vim.api.nvim_buf_call(args.buf, function() require("smoothcursor.utils").smoothcursor_stop() end)
        end,
      })
    end,
  },
}
