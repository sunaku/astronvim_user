return {
  -- Add the community repository of plugin specifications
  "AstroNvim/astrocommunity",
  -- example of importing a plugin, comment out to use it or add your own
  -- available plugins can be found at https://github.com/AstroNvim/astrocommunity

  -- { import = "astrocommunity.colorscheme.catppuccin" },
  -- { import = "astrocommunity.completion.copilot-lua-cmp" },

  { import = "astrocommunity.color.modes-nvim" },
  -- { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.debugging.nvim-bqf" },
  { import = "astrocommunity.editing-support.comment-box-nvim" }, -- :CB
  -- { import = "astrocommunity.editing-support.dial-nvim" }, -- <C-A>/<C-X> with optional g prefix
  -- { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  -- { import = "astrocommunity.editing-support.refactoring-nvim" }, -- needs NeoVim nightly!
  { import = "astrocommunity.editing-support.text-case-nvim" }, -- ga
  { import = "astrocommunity.editing-support.todo-comments-nvim" }, -- <leader>z
  { import = "astrocommunity.editing-support.treesj" }, -- <leader>m
  -- { import = "astrocommunity.editing-support.true-zen-nvim" }, -- TODO: this doesn't restore tab & window focus
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.git-blame-nvim" }, -- FIXME: don't need this because gitsigns already does it???
  { import = "astrocommunity.motion.flash-nvim" }, -- s/S
  -- { import = "astrocommunity.motion.nvim-surround" }, -- ys/cs/ds
  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.ruby" },
  { import = "astrocommunity.pack.rust" },
  -- { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.toml" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.programming-language-support.csv-vim" },
  { import = "astrocommunity.syntax.vim-easy-align" },
  -- { import = "astrocommunity.syntax.vim-sandwich" },
  { import = "astrocommunity.test.neotest" },
  { import = "astrocommunity.test.nvim-coverage" },

  -- { -- further customize the options set by the community
  --   "f-person/git-blame.nvim",
  --   opts = {
  --     init = function()
  --       vim.g.gitblame_highlight_group = "SpecialKey"
  --       vim.g.gitblame_date_format = "%r"
  --     end,
  --   },
  -- },
}
