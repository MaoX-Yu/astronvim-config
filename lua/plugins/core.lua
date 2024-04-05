return {
  -- customize alpha options
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        " _______",
        "|       \\",
        "| ███████\\ ______   ______  _______  __    __  ______",
        "| ██__/ ██/      \\ /      \\|       \\|  \\  |  \\|      \\",
        "| ██    ██  ██████\\  ██████\\ ███████\\ ██  | ██ \\██████\\",
        "| ███████\\ ██   \\██ ██  | ██ ██  | ██ ██  | ██/      ██",
        "| ██__/ ██ ██     | ██__/ ██ ██  | ██ ██__/ ██  ███████",
        "| ██    ██ ██      \\██    ██ ██  | ██\\██    ██\\██    ██",
        " \\███████ \\██       \\██████ \\██   \\██_\\███████ \\███████",
        "                                    |  \\__| ██",
        "                                     \\██    ██",
        "                                      \\██████",
      }
      return opts
    end,
  },
  {
    "max397574/better-escape.nvim",
    event = "VeryLazy",
    opts = {
      mapping = { "jj", "fd" },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-emoji",
    },
    ---@param opts cmp.ConfigSchema
    opts = function(_, opts)
      local luasnip = require "luasnip"
      local cmp = require "cmp"
      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match "%s" == nil
      end

      opts.sources = cmp.config.sources(vim.list_extend(opts.sources, { { name = "emoji" } }))
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<C-j>"] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select },
        ["<C-k>"] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select },
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true }
            -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
            -- this way you will only jump inside the snippet region
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = true }
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-o>"] = cmp.mapping(function(fallback)
          if has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),
      })
      return opts
    end,
  },
  {
    "mfussenegger/nvim-dap",
    enabled = true,
  },
  {
    "rafamadriz/friendly-snippets",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_vscode").lazy_load { paths = { "./snippets" } }
    end,
  },
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      key_labels = {
        ["<space>"] = "SPC",
        ["<cr>"] = "CR",
        ["<tab>"] = "TAB",
        ["<bs>"] = "BS",
        ["<esc>"] = "ESC",
        ["<leader>"] = "Leader",
      },
      window = {
        border = "single",
        position = "top",
      },
    },
  },
}
