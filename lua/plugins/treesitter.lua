-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/playground",
    {
      "andymass/vim-matchup",
      init = function()
        vim.g.matchup_matchparen_enabled = 0
        vim.g.matchup_matchparen_deferred = 1
        vim.g.matchup_matchparen_offscreen = { method = "popup" }
      end,
    },
  },
  opts = function(_, opts)
    opts.highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    }
    opts.matchup = { enable = true }
    opts.playground = {
      enable = true,
      disable = {},
      updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
      persist_queries = false, -- Whether the query persists across vim sessions
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    }
    if opts.ensure_installed ~= "all" then
      require("astrocore").list_insert_unique(opts.ensure_installed, {
        "bash",
        "markdown",
        "markdown_inline",
        "regex",
        "vim",
        "c",
        "cpp",
        "c_sharp",
        "css",
        "html",
        "lua",
        "diff",
        "git_config",
        "python",
        "toml",
        "yaml",
        "vim",
        "json",
        "javascript",
        "cmake",
        -- "powershell"
      })
    end
    opts.textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          aA = "@attribute.outer",
          iA = "@attribute.inner",
          aB = "@block.outer",
          iB = "@block.inner",
          aD = "@conditional.outer",
          iD = "@conditional.inner",
          aF = "@function.outer",
          iF = "@function.inner",
          aL = "@loop.outer",
          iL = "@loop.inner",
          aP = "@parameter.outer",
          iP = "@parameter.inner",
          aR = "@regex.outer",
          iR = "@regex.inner",
          aX = "@class.outer",
          iX = "@class.inner",

          aS = "@statement.outer",
          iS = "@statement.outer",
          aN = "@number.inner",
          iN = "@number.inner",
          aC = "@comment.outer",
          iC = "@comment.outer",
        },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          ["]b"] = { query = "@block.outer", desc = "Next block start" },
          ["]f"] = { query = "@function.outer", desc = "Next function start" },
          ["]p"] = { query = "@parameter.outer", desc = "Next parameter start" },
          ["]x"] = { query = "@class.outer", desc = "Next class start" },
          ["]c"] = { query = "@comment.outer", desc = "Next comment start" },
        },
        goto_next_end = {
          ["]B"] = { query = "@block.outer", desc = "Next block end" },
          ["]F"] = { query = "@function.outer", desc = "Next function end" },
          ["]P"] = { query = "@parameter.outer", desc = "Next parameter end" },
          ["]X"] = { query = "@class.outer", desc = "Next class end" },
          ["]C"] = { query = "@comment.outer", desc = "Next comment end" },
        },
        goto_previous_start = {
          ["[b"] = { query = "@block.outer", desc = "Previous block start" },
          ["[f"] = { query = "@function.outer", desc = "Previous function start" },
          ["[p"] = { query = "@parameter.outer", desc = "Previous parameter start" },
          ["[x"] = { query = "@class.outer", desc = "Previous class start" },
          ["[c"] = { query = "@comment.outer", desc = "Previous comment start" },
        },
        goto_previous_end = {
          ["[B"] = { query = "@block.outer", desc = "Previous block end" },
          ["[F"] = { query = "@function.outer", desc = "Previous function end" },
          ["[P"] = { query = "@parameter.outer", desc = "Previous parameter end" },
          ["[X"] = { query = "@class.outer", desc = "Previous class end" },
          ["[C"] = { query = "@comment.outer", desc = "Previous comment end" },
        },
      },
      swap = {
        enable = true,
        swap_next = {
          [">B"] = { query = "@block.outer", desc = "Swap next block" },
          [">F"] = { query = "@function.outer", desc = "Swap next function" },
          [">P"] = { query = "@parameter.inner", desc = "Swap next parameter" },
        },
        swap_previous = {
          ["<B"] = { query = "@block.outer", desc = "Swap previous block" },
          ["<F"] = { query = "@function.outer", desc = "Swap previous function" },
          ["<P"] = { query = "@parameter.inner", desc = "Swap previous parameter" },
        },
      },
      lsp_interop = {
        enable = true,
        border = "single",
        peek_definition_code = {
          ["<leader>lp"] = { query = "@function.outer", desc = "Peek function definition" },
          ["<leader>lP"] = { query = "@class.outer", desc = "Peek class definition" },
        },
      },
    }
    return opts
  end,
}
