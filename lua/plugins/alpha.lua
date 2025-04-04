local footer = {
  type = "text",
  val = "Saumya",
  opts = {
    position = "center",
    hl = "Number",
  },
}
local header1 = {
  "   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ",
  "    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ",
  "          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ",
  "           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ",
  "          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ",
  "   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ",
  "  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ",
  " ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ",
  " ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ",
  "      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ",
  "       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣟⣀⣀⣤⣾⡿⠃     ",

  -- "                                                                       ",
  -- "🮝▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒🮟   ",
  -- " 🮝▒▒▒▒▒▒██████🮝███████╗██🮍▒▒▒██╗▒▒▒▒▒███████╗███🮝▒▒██╗██🮍▒▒▒██╗▒▒▒🮟  ",
  -- "  🮝▒▒▒▒▒██╔══██╗██╔════╝██🮍▒▒▒██║▒▒▒▒▒██╔════╝████🮝▒██║██🮍▒▒▒██║▒▒▒▒🮟 ",
  -- "   🮝▒▒▒▒██║▒▒██║█████╗▒ ██🮍▒▒🮜██║▒▒█▒▒█████╗▒▒██╔█▒██║██🮍▒▒🮜██║▒▒▒▒▒🮟",
  -- "   🮞▒▒▒▒██║▒▒██║██╔══╝▒🮟█🮝🮜█🮞▒▒▒▒▒██╔══╝▒▒██║🮟███║█🮝🮜█🮞▒▒▒▒▒🮜",
  -- "  🮞▒▒▒▒▒██████╝███████╗🮟████🮞▒▒▒▒▒▒███████╗██║▒🮟███║🮟████🮞▒▒▒▒▒🮜 ",
  -- " 🮞▒▒▒▒▒▒╚═════╝▒╚══════╝▒🮟╚═══🮞▒▒▒▒▒▒▒╚══════╝╚═╝▒▒🮟═══╝▒🮟╚═══🮞▒▒▒▒▒🮜  ",
  -- "🮞▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒🮜   ",
  -- "                                                                       ",
}

local header2 = {
  "█████ 🭅█████ ████████ ██████🭌 ██████",
  "██   ██ ██         ██    ██   ██ ██    ██",
  "███████ █████    ██    ██████ ██    ██",
  "██   ██      ██    ██    ██   ██ ██    ██",
  "██   ██ 🭅█████    ██    ██   ██ ██████",
}

return {
  "goolord/alpha-nvim",
  enabled = false,
  optional = false,
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = function()
    local startify = require "alpha.themes.startify"

    -- local cfgpath = vim.fn.stdpath "config" .. "/lua/lazy_setup.lua"
    startify.section.header.val = header1
    startify.section.header.opts.hl = "Function"
    startify.section.bottom_buttons.val = {
      -- { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
      { type = "padding", val = 1 },
      -- startify.button("e", "  New file", "<cmd>ene<CR>"),
      startify.button("f", "󰈞  Find Files", "<cmd>Telescope find_files<CR>"),
      startify.button("w", "󱩾  Live Grep", "<cmd>Telescope live_grep<CR>"),
      -- startify.button("c", "  Configuration", "<cmd>e " .. cfgpath .. "|Neotree show<CR>"),
      startify.button("u", "󱧘  Update Plugins", "<cmd>AstroUpdate<CR>"),
      startify.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
      -- startify.button("Q", "󰅚  Quit without saving", "<cmd>qa!<CR>"),
      startify.button("R", "  Reload", "<cmd>source $MYVIMRC<CR>"),
      startify.button("LDR Sl", "  Reload Last Session"),

      -- startify.button("S", "󰅚  Save", "<cmd>wa<CR>"),
      -- startify.button("W", "󰅚  Save All", "<cmd>wa<CR>"),
      -- startify.button("E", "󰅚  Exit", "<cmd>qa<CR>"),
      startify.button("H", "󰭎 󰋗  Help", "<cmd>Telescope help_tags<CR>"),
      startify.button("P", "󰭎   Projects", "<cmd>Telescope projects<CR>"),
      startify.button("T", "󰭎   Todo", "<cmd>Telescope todo<CR>"),
      startify.button(
        "c",
        "󰭎   Config",
        "<cmd>Telescope find_files cwd=" .. vim.fn.stdpath "config" .. "/lua<CR>"
      ),

      -- startify.button("V", "  Vimrc", "<cmd>Telescope find_files cwd=" .. vim.fn.stdpath "config" .. "<CR>"),
    }
    startify.section.footer.val = { footer }
    -- startify.config.layout = {
    --   { type = "padding", val = 1 },
    --   startify.section.header,
    --   { type = "padding", val = 2 },
    --   startify.section.top_buttons,
    --   startify.section.mru_cwd,
    --   startify.section.mru,
    --   { type = "padding", val = 1 },
    --   startify.section.bottom_buttons,
    --   footer,
    --   }

    return startify
  end,
  config = function(_, opts)
    require("alpha").setup(opts.config)

    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyVimStarted",
      desc = "Add Alpha dashboard footer",
      once = true,
      callback = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
        footer.val = { " ", " ", " ", "AstroNvim loaded " .. stats.count .. " plugins   in " .. ms .. "ms" }

        opts.section.footer.val = { footer }
        -- { " ", " ", " ", "AstroNvim loaded " .. stats.count .. " plugins  in " .. ms .. "ms" }
        -- opts.config.layout.footer.opts.hl = "DashboardFooter"
        pcall(vim.cmd.AlphaRedraw)
      end,
    })
  end,
}
