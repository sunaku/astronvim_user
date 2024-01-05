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
  { import = "astrocommunity.editing-support.comment-box-nvim" }, -- :CB
  { import = "astrocommunity.editing-support.dial-nvim" }, -- <C-A>/<C-X> with optional g prefix
  -- { import = "astrocommunity.editing-support.mini-splitjoin" },
  { import = "astrocommunity.editing-support.nvim-treesitter-endwise" },
  -- { import = "astrocommunity.editing-support.refactoring-nvim" }, -- needs NeoVim nightly!
  { import = "astrocommunity.editing-support.text-case-nvim" }, -- ga
  { import = "astrocommunity.editing-support.todo-comments-nvim" }, -- <leader>z
  { import = "astrocommunity.editing-support.treesj" }, -- <leader>m
  -- { import = "astrocommunity.editing-support.true-zen-nvim" }, -- TODO: this doesn't restore tab & window focus
  { import = "astrocommunity.git.git-blame-nvim" }, -- FIXME: don't need this because gitsigns already does it???
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
