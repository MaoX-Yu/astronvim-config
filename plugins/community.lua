return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  { import = "astrocommunity.bars-and-lines.heirline-vscode-winbar" },
  { import = "astrocommunity.bars-and-lines.vim-illuminate" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    optional = true,
    opts = function(_, opts)
      opts.integrations.noice = true
      return opts
    end,
  },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.diagnostics.trouble-nvim" },
  { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.neogen" },
  { import = "astrocommunity.editing-support.rainbow-delimiters-nvim" },
  { import = "astrocommunity.editing-support.refactoring-nvim" },
  { import = "astrocommunity.editing-support.suda-vim" },
  { import = "astrocommunity.editing-support.telescope-undo-nvim" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.yanky-nvim" },
  {
    "gbprod/yanky.nvim",
    optional = true,
    keys = function(_, keys)
      keys = vim.list_extend(keys, {
        {
          "<leader>P",
          function() require("telescope").extensions.yank_history.yank_history {} end,
          desc = "Open Yank History",
        },
      })
    end,
  },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.motion.mini-move" },
  { import = "astrocommunity.motion.mini-surround" },
  { import = "astrocommunity.motion.nvim-spider" },
  {
    "chrisgrieser/nvim-spider",
    optional = true,
    opts = function(_, opts)
      opts.skipInsignificantPunctuation = false
      return opts
    end,
  },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.python-ruff" },
  {
    "mfussenegger/nvim-dap-python",
    optional = true,
    config = function(_, opts)
      local path = require("mason-registry").get_package("debugpy"):get_install_path()
      if require("user.utils").is_win() then
        path = path .. "\\venv\\Scripts\\python.exe"
      else
        path = path .. "/venv/bin/python"
      end
      require("dap-python").setup(path, opts)
    end,
  },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.project.project-nvim" },
  { import = "astrocommunity.scrolling.cinnamon-nvim" },
  { import = "astrocommunity.split-and-window.edgy-nvim" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.utility.noice-nvim" },
  {
    "folke/noice.nvim",
    optional = true,
    opts = function(_, opts)
      opts.lsp.progress = { enabled = false }
      opts.presets.lsp_doc_border = true
      opts.routes = opts.routes ~= nil and opts.routes or {} -- check routes is nil or not
      opts.routes = vim.list_extend(opts.routes, {
        {
          filter = {
            event = "msg_show",
            kind = "search_count",
          },
          opts = { skip = true },
        },
      })
      return opts
    end,
  },
}
