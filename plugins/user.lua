local leader = "<backspace>"
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },

  ----------------------------------------------------------------------------
  -- colorscheme
  ----------------------------------------------------------------------------

  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup {
        contrast = "soft",
      }
    end,
  },

  {
    "sainnhe/gruvbox-material",
    config = function() vim.g.gruvbox_material_background = "soft" end,
  },

  {
    "sainnhe/everforest",
    config = function() vim.g.everforest_background = "soft" end,
  },

  {
    "sainnhe/edge",
    config = function() vim.g.edge_background = "soft" end,
  },

  { "EdenEast/nightfox.nvim" },

  ----------------------------------------------------------------------------
  -- navigation
  ----------------------------------------------------------------------------

  {
    "sunaku/tmux-navigate",
    lazy = false,
  },

  {
    "bkad/CamelCaseMotion",
    lazy = false,
    config = function() vim.cmd "call camelcasemotion#CreateMotionMappings('-')" end,
  },

  {
    "tpope/vim-projectionist",
    cmd = {
      "A",
      "AD",
      "Pcd",
      "Plcd",
    },
    keys = {
      {
        leader .. "ea",
        "<cmd>A<cr>",
        desc = "(projectionist) expose alternate file",
      },

      {
        leader .. "if",
        "<cmd>call feedkeys(':A ', 't')<CR>",
        desc = "(projectionist) create file relative to innermost root",
      },

      {
        leader .. "rB",
        "<cmd>AD<cr>",
        desc = "(projectionist) replace buffer with 'new file' template",
      },

      {
        leader .. "id",
        "<cmd>Pcd<cr>",
        desc = "(projectionist) change working directory to innermost root",
      },

      {
        leader .. "iD",
        "<cmd>Plcd<cr>",
        desc = "(projectionist) change buffer's working directory to innermost root",
      },

      {
        leader .. "eA",
        "<cmd>call feedkeys(\":Commands\n open_projections\\<C-A>\", 'n')<cr>",
        desc = "(projectionist) expose available projections",
      },
    },
    config = function()
      -- TODO: port heuristics folder
      vim.cmd [[
        " load heuristics (which also specify projections) from relative directory
        let files = glob(expand('<sfile>:r').'.heuristics/*.json', v:false, v:true)
        let jsons = map(files, 'json_decode(join(readfile(v:val)))')
        let merged = {} | call map(jsons, 'extend(merged, v:val)')
        silent! unlet merged['_'] " strip makeshift 'comment' keys
        let g:projectionist_heuristics = merged
      ]]
    end,
  },

  ----------------------------------------------------------------------------
  -- editing
  ----------------------------------------------------------------------------

  {
    "mbbill/undotree",
    cmd = { "UndotreeToggle" },
    keys = {
      {
        leader .. "tu",
        "<cmd>UndotreeToggle<cr>",
        desc = "(undotree) toggle sidebar",
      },
    },
    config = function()
      vim.g.undotree_SetFocusWhenToggle = 1
      vim.cmd [[
        augroup undotree_my_settings
          autocmd!
          autocmd FileType undotree setlocal number relativenumber
          autocmd FileType undotree vertical resize +4
        augroup END
      ]]
    end,
  },

  {
    "lag13/ReplaceWithRegister",
    keys = { "gr", "grr" },
  },

  {
    "machakann/vim-sandwich",
    lazy = false,
    init = function()
      vim.g.sandwich_no_default_key_mappings = 1
      vim.g.operator_sandwich_no_default_key_mappings = 1
      vim.g.textobj_sandwich_no_default_key_mappings = 1
    end,
    keys = {
      -- The following shortcuts are based on "macros/sandwich/keymap/surround.vim";
      -- the main difference here is that I use "S" instead of "ss" for auto-detect,
      -- and "gs" instead of "s" for surround, and "." for the sentence text-object.
      --
      -- https://github.com/machakann/vim-sandwich/wiki/Introduce-vim-surround-keymappings
      --
      -- Shortcut! gs  (sandwich) surround selection or specified motion with specified delimiters
      -- Shortcut! gS  (sandwich) surround inside automatic delimiters with specified delimiters
      -- Shortcut! ds  (sandwich) delete specified delimiters surrounding specified motion
      -- Shortcut! dS  (sandwich) delete automatic delimiters surrounding specified motion
      -- Shortcut! cs  (sandwich) change specified delimiters surrounding specified motion
      -- Shortcut! cS  (sandwich) change automatic delimiters surrounding specified motion
      -- Shortcut! vaS (textobj) select around text surrounded by automatic delimiters
      -- Shortcut! viS (textobj) select inside text surrounded by automatic delimiters
      -- Shortcut! vas (textobj) select around text surrounded by specified delimiters
      -- Shortcut! vis (textobj) select inside text surrounded by specified delimiters
      -- Shortcut! vaP (textobj) select around sentence
      -- Shortcut! viP (textobj) select inside sentence

      {
        "gs",
        "<Plug>(operator-sandwich-add)",
        mode = { "n", "x" },
        desc = "(sandwich) add surround",
      },

      {
        "gS",
        "<Plug>(operator-sandwich-add)" .. "<Plug>(textobj-sandwich-auto-i)",
        desc = "(sandwich) add to nearest surround",
      },

      {
        "ds",
        "<Plug>(operator-sandwich-delete)"
          .. "<Plug>(operator-sandwich-release-count)"
          .. "<Plug>(textobj-sandwich-query-a)",
        desc = "(sandwich) delete surround",
      },

      {
        "dS",
        "<Plug>(operator-sandwich-delete)"
          .. "<Plug>(operator-sandwich-release-count)"
          .. "<Plug>(textobj-sandwich-auto-a)",
        desc = "(sandwich) delete nearest surround",
      },

      {
        "cs",
        "<Plug>(operator-sandwich-replace)"
          .. "<Plug>(operator-sandwich-release-count)"
          .. "<Plug>(textobj-sandwich-query-a)",
        desc = "(sandwich) change surround",
      },

      {
        "cS",
        "<Plug>(operator-sandwich-replace)"
          .. "<Plug>(operator-sandwich-release-count)"
          .. "<Plug>(textobj-sandwich-auto-a)",
        desc = "(sandwich) change nearest surround",
      },

      {
        ".",
        "<Plug>(operator-sandwich-dot)",
        desc = "(sandwich) repeat surround",
      },

      {
        "is",
        "<Plug>(textobj-sandwich-literal-query-i)",
        desc = "(sandwich) select inside surround",
        mode = "x",
      },

      {
        "iS",
        "<Plug>(textobj-sandwich-auto-i)",
        desc = "(sandwich) select inside nearest surround",
        mode = "x",
      },

      {
        "as",
        "<Plug>(textobj-sandwich-literal-query-a)",
        desc = "(sandwich) select inside surround",
        mode = "x",
      },

      {
        "aS",
        "<Plug>(textobj-sandwich-auto-a)",
        desc = "(sandwich) select inside nearest surround",
        mode = "x",
      },

      -- provide an alternative "P" alias to Vim's default "s" sentence textobj
      -- which is overridden by sandwich plugin to represent a surround textobj
      {
        "iP",
        "is",
        desc = "select inside sentence",
        noremap = true,
        mode = { "x", "o" },
      },

      {
        "aP",
        "as",
        desc = "select around sentence",
        noremap = true,
        mode = { "x", "o" },
      },
    },
    config = function()
      -- More distinguishable highlighting for surrounding delimiters.
      vim.cmd [[
        highlight! link OperatorSandwichBuns   lualine_a_command
        highlight! link OperatorSandwichChange lualine_a_replace
        highlight! link OperatorSandwichDelete lualine_a_terminal
        highlight! link OperatorSandwichAdd    lualine_a_insert
      ]]

      -- Restore cursor position after performing surround operations.
      vim.cmd "call operator#sandwich#set('all', 'all', 'cursor', 'keep')"
    end,
  },

  {
    "machakann/vim-swap",
    lazy = false,
    init = function() vim.g.swap_no_default_key_mappings = 1 end,
    keys = {
      -- this is changed from the default "gs" because I use that for machakann/vim-sandwich
      { "g=", "<Plug>(swap-interactive)", desc = "(swap) interactive mode", mode = { "n", "x" } },
      -- these are the default mappings for this plugin:
      { "g<", "<Plug>(swap-prev)", desc = "(swap) move item to left" },
      { "g>", "<Plug>(swap-next)", desc = "(swap) move item to right" },
    },
  },

  {
    "FooSoft/vim-argwrap",
    cmd = { "ArgWrap" },
    keys = {
      {
        leader .. "fa",
        "<cmd>ArgWrap<cr>",
        desc = "(argwrap) toggle multi-line syntax at cursor",
      },
    },
  },

  {
    "AndrewRadev/splitjoin.vim",
    lazy = false,
    keys = {
      -- FIXME: these descriptions only apply to whichkey if lazy=false, but
      -- setting that also prevents this plugin from being loaded
      { "-K", nil, desc = "(splitjoin) split into multiple lines" },
      { "-J", nil, desc = "(splitjoin) collapse into single line" },
    },
    init = function()
      -- NOTE: gK is already used by LazyVim so use -K instead
      vim.g.splitjoin_split_mapping = "-K"
      vim.g.splitjoin_join_mapping = "-J"
    end,
    config = function() end,
  },

  {
    "tommcdo/vim-lion",
    lazy = false,
    config = function() vim.g.lion_squeeze_spaces = 1 end,
  },

  {
    "scrooloose/nerdcommenter",
    -- lazy = false,
    init = function()
      vim.g.NERDCreateDefaultMappings = 0
      vim.g.NERDSpaceDelims = 1
      vim.g.NERDDefaultAlign = "left"
      vim.g.NERDCommentEmptyLines = 1
    end,
    keys = {
      {
        leader .. "~c",
        "<plug>NERDCommenterAltDelims",
        desc = "(NERDCommenter) toggle alternate comment delimiters",
        mode = { "n", "x" },
      },

      {
        leader .. "dc",
        "<plug>NERDCommenterUncomment",
        desc = "(NERDCommenter) uncomment, deleting comment delimiters",
        mode = { "n", "x" },
      },

      {
        leader .. "=c",
        "<plug>NERDCommenterAlignBoth",
        desc = "(NERDCommenter) comment, aligning both delimiters",
        mode = { "n", "x" },
      },

      {
        leader .. "Ic",
        "<plug>NERDCommenterAlignLeft",
        desc = "(NERDCommenter) comment, aligning left delimiter",
        mode = { "n", "x" },
      },

      {
        leader .. "ac",
        "<plug>NERDCommenterAppend",
        desc = "(NERDCommenter) append comment at end of line",
        mode = { "n", "x" },
      },

      {
        leader .. "yc",
        "<plug>NERDCommenterYank",
        desc = "(NERDCommenter) yank then comment",
        mode = { "n", "x" },
      },

      {
        leader .. "IC",
        "<plug>NERDCommenterSexy",
        desc = "(NERDCommenter) comment, sexily",
        mode = { "n", "x" },
      },

      {
        leader .. "tc",
        "<plug>NERDCommenterInvert",
        desc = "(NERDCommenter) invert comment markers",
        mode = { "n", "x" },
      },

      {
        leader .. "Ac",
        "<plug>NERDCommenterToEOL",
        desc = "(NERDCommenter) comment from cursor to end of line",
        mode = { "n", "x" },
      },

      {
        leader .. "aC",
        "<plug>NERDCommenterNested",
        desc = "(NERDCommenter) comment, nesting",
        mode = { "n", "x" },
      },

      {
        leader .. "iC",
        "<plug>NERDCommenterMinimal",
        desc = "(NERDCommenter) comment, minimally",
        mode = { "n", "x" },
      },

      {
        leader .. "tC",
        "<plug>NERDCommenterToggle",
        desc = "(NERDCommenter) toggle comment markers",
        mode = { "n", "x" },
      },

      {
        leader .. "ic",
        "<plug>NERDCommenterComment",
        desc = "(NERDCommenter) comment, inserting comment delimiters",
        mode = { "n", "x" },
      },

      {
        leader .. "Pc",
        "<plug>NERDCommenterYank`[P",
        desc = "(NERDCommenter) duplicate above cursor and comment",
        mode = { "n", "x" },
      },

      {
        leader .. "pc",
        "<plug>NERDCommenterYank`]p",
        desc = "(NERDCommenter) duplicate below cursor and comment",
        mode = { "n", "x" },
      },
    },
  },

  ----------------------------------------------------------------------------
  -- documentation
  ----------------------------------------------------------------------------

  {
    "sunaku/vim-dasht",
    cmd = { "Dasht" },
    keys = {
      {
        leader .. "k",
        ":Dasht ",
        desc = "(dasht) search related docsets at command prompt",
        nowait = true,
      },

      {
        leader .. leader .. "k",
        ":Dasht! ",
        desc = "(dasht) search ALL the docsets at command prompt",
        nowait = true,
      },

      {
        leader .. "K",
        ":call Dasht(dasht#cursor_search_terms())<CR>",
        desc = "(dasht) search related docsets for cursor word or selected text",
        silent = true,
      },

      {
        leader .. leader .. "K",
        ":call Dasht(dasht#cursor_search_terms(), '!')<CR>",
        desc = "(dasht) search ALL the docsets for cursor word or selected text",
        silent = true,
      },

      {
        leader .. "K",
        "y:<C-U>call Dasht(getreg(0))<CR>",
        desc = "(dasht) search related docsets for cursor word or selected text",
        mode = "v",
        silent = true,
      },

      {
        leader .. leader .. "K",
        "y:<C-U>call Dasht(getreg(0), '!')<CR>",
        desc = "(dasht) search ALL the docsets for cursor word or selected text",
        mode = "v",
        silent = true,
      },
    },
    config = function()
      -- Define docsets to consider as related:
      -- filetype => list of docset name regexp
      vim.g.dasht_filetype_docsets = {
        elixir = { "elixir", "erlang" },
        html = { "html", "css", "js" },
        eruby = { "ruby" },
      }
    end,
  },

  {
    "sunaku/vim-hicterm",
    cmd = {
      "HiCterm",
      "HiCtermFg",
      "HiCtermBg",
      "HiCtermOff",
    },
  },

  ----------------------------------------------------------------------------
  -- git
  ----------------------------------------------------------------------------

  -- FIXME: don't need this because gitsigns already does it???
  {
    "f-person/git-blame.nvim",
    init = function()
      vim.g.gitblame_highlight_group = "SpecialKey"
      vim.g.gitblame_date_format = "%r"
    end,
  },

  {
    "akinsho/git-conflict.nvim",
    version = "*", -- only upgrade when a new tag is released
    cmd = {
      "GitConflictChooseOurs", -- Select the current changes.
      "GitConflictChooseTheirs", -- Select the incoming changes.
      "GitConflictChooseBoth", -- Select both changes.
      "GitConflictChooseNone", -- Select none of the changes.
      "GitConflictNextConflict", -- Move to the next conflict.
      "GitConflictPrevConflict", -- Move to the previous conflict.
      "GitConflictListQf", -- Get all conflict to quickfix
    },
    keys = {
      {
        leader .. "ho",
        "<cmd>GitConflictChooseOurs<cr>",
        desc = "(git-conflict) choose our version",
      },

      {
        leader .. "ht",
        "<cmd>GitConflictChooseTheirs<cr>",
        desc = "(git-conflict) choose their version",
      },

      {
        leader .. "ha",
        "<cmd>GitConflictChooseBoth<cr>",
        desc = "(git-conflict) choose both versions",
      },

      {
        leader .. "hn",
        "<cmd>GitConflictChooseNone<cr>",
        desc = "(git-conflict) delete both versions",
      },

      { "]c", "<cmd>GitConflictNextConflict<cr>", desc = "(git-conflict) go to next conflict" },

      { "[c", "<cmd>GitConflictPrevConflict<cr>", desc = "(git-conflict) go to prev conflict" },

      {
        leader .. "hq",
        "<cmd>GitConflictListQf<cr>",
        desc = "(git-conflict) populate quickfix",
      },
    },
    config = function()
      require("git-conflict").setup {
        default_mappings = false,
      }
    end,
    -- lazy = false,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
    -- TODO: config fugitive
    keys = {
      {
        leader .. "/G",
        "<cmd><C-U>call Fugitive_grep_prompt('-Pi')<cr>",
        desc = "(fugitive) git grep: search repository",
      },

      {
        leader .. "/g",
        "<cmd><C-U>call Fugitive_grep_prompt('-P')<cr>",
        desc = "(fugitive) git grep: search repository",
      },

      {
        leader .. "?G",
        "<cmd><C-U>call Fugitive_grep_register('-Pi')<cr>",
        desc = "(fugitive) git grep: search repository for Vim search pattern",
      },

      {
        leader .. "?g",
        "<cmd><C-U>call Fugitive_grep_register('-P')<cr>",
        desc = "(fugitive) git grep: search repository for Vim search pattern",
      },

      {
        leader .. "*G",
        "<cmd><C-U>call Fugitive_grep_cursor('-Pi')<cr>",
        desc = "(fugitive) git grep: search repository for word under cursor",
      },

      {
        leader .. "*g",
        "<cmd><C-U>call Fugitive_grep_cursor('-P')<cr>",
        desc = "(fugitive) git grep: search repository for word under cursor",
      },

      {
        leader .. "cg",
        "<cmd>call feedkeys(':GMove '.expand('%'), 't')<cr>",
        desc = "(fugitive) git mv: rename file",
      },

      {
        leader .. "Cg",
        "<cmd>call feedkeys(':GMove! '.expand('%'), 't')<cr>",
        desc = "(fugitive) git mv -f: rename file forcefully",
      },

      {
        leader .. "GG",
        "<cmd>Git blame<cr>",
        desc = "(fugitive) git blame: who changed which line",
      },

      {
        leader .. "ig",
        "<cmd>Git commit<cr>",
        desc = "(fugitive) git commit: record new commit",
      },

      {
        leader .. "ag",
        "<cmd>Git commit --amend<cr>",
        desc = "(fugitive) git commit --amend",
      },

      {
        leader .. "Ag",
        "<cmd>Git commit --amend --reuse-message=HEAD<cr>",
        desc = "(fugitive) git commit --amend --reuse-message=HEAD",
      },

      {
        leader .. "hg",
        "<cmd>Gdiffsplit<cr>",
        desc = "(fugitive) git diff: show changes against repository",
      },

      {
        leader .. "eG",
        "<cmd>Gedit<cr>",
        desc = "(fugitive) return to editing git buffer",
      },

      {
        leader .. "rg",
        "<cmd>Gread<cr>",
        desc = "(fugitive) git checkout: revert buffer to repository",
      },

      {
        leader .. "Rg",
        "<cmd>Gread!<cr>",
        desc = "(fugitive) git checkout -f: revert buffer to repository forcefully",
      },

      {
        leader .. "gg",
        "<cmd>Gstatus<cr>",
        desc = "(fugitive) open git status window",
      },

      {
        leader .. "wg",
        "<cmd>Gwrite<cr>",
        desc = "(fugitive) git add: stage all changes in buffer",
      },

      {
        leader .. "Wg",
        "<cmd>Gwrite!<cr>",
        "(fugitive) git add -f: stage all changes in buffer forcefully",
      },

      {
        leader .. "dg",
        "<cmd>GRemove<Bar>bdelete<cr>",
        desc = "(fugitive) git rm: delete file from repository",
      },

      {
        leader .. "Dg",
        "<cmd>GRemove!<Bar>bdelete<cr>",
        desc = "(fugitive) git rm -f: delete file from repository forcefully",
      },
    },
  },

  ----------------------------------------------------------------------------
  -- textobj
  ----------------------------------------------------------------------------

  {
    "michaeljsmith/vim-indent-object",
    lazy = false,
    --Shortcut! vai (textobj) select around indentation level and line above
    --Shortcut! vii (textobj) select inside indentation level; no line above
    --Shortcut! vaI (textobj) select around indentation level and lines above/below
    --Shortcut! viI (textobj) select inside indentation level; no lines above/below
  },

  ----------------------------------------------------------------------------
  -- telescope
  ----------------------------------------------------------------------------

  {
    "kyoh86/telescope-windows.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
    },
    keys = {
      { "<backspace>ew", "<cmd>Telescope windows<cr>", desc = "(telescope) Windows - find window on any tab" },
    },
    -- config = function()
    --   local telescope = require "telescope"
    --   local actions = require "telescope.actions"
    --   telescope.setup {
    --     defaults = {
    --       -- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
    --       mappings = {
    --         i = {
    --           -- Mapping <Esc> to quit in insert mode
    --           ["<esc>"] = actions.close,
    --           -- Mapping <C-u> to clear prompt
    --           ["<C-u>"] = false,
    --           -- Mapping <C-d> to delete buffer
    --           ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
    --         },
    --       },
    --     },
    --   }
    --   telescope.load_extension "windows"
    -- end,
  },

  ----------------------------------------------------------------------------
  -- system
  ----------------------------------------------------------------------------

  {
    "tpope/vim-eunuch",
    lazy = false,
    keys = {
      {
        leader .. "cf",
        "<cmd>call feedkeys(':Rename '.expand('%:t'), 't')<cr>",
        desc = "(eunuch) rename file",
        nowait = true,
      },
      {
        leader .. "df",
        -- TODO: convert to lua
        [[<cmd>if confirm("Delete file?", "&Yes\n&No", 2) == 1 <bar>
            Remove <bar>
          endif<cr>]],
        desc = "(eunuch) prompt to delete file",
      },
    },
  },
}
