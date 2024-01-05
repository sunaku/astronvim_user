-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

--------------------------------------------------------------------------
-- AstroNvim
--------------------------------------------------------------------------

-- vim.opt.winbar = "%=%m %f" -- show filename in each split window pane
-- vim.opt.textwidth = 78
vim.opt.clipboard:remove "unnamedplus" -- don't use system clipboard

--------------------------------------------------------------------------
-- NeoVim
--------------------------------------------------------------------------

-- reset AstroNvim shortcuts back to Vim defaults
-- vim.keymap.del("i", "jj") -- alias for Escape
-- vim.keymap.del("i", "jk") -- alias for Escape

-- reset LazyVim shortcuts back to Vim defaults
-- vim.keymap.del("n", "H") -- go to top of screen
-- vim.keymap.del("n", "L") -- go to bottom of screen
--vim.keymap.del("n", "gw") -- format while preserving cursor position

-- allow ESC to leave insert mode for terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", { noremap = true })

-- store relative line number jumps in jumplist
-- while treating wrapped lines like real lines
-- but don't do this if going up/down by 1 line
-- NOTE: m' stores current position in jumplist
-- NOTE: thanks to osse and bairui in #vim IRC!
vim.keymap.set("n", "k", "(v:count > 1 ? \"m'\" . v:count . 'k' : 'gk')", { expr = true })
vim.keymap.set("n", "j", "(v:count > 1 ? \"m'\" . v:count . 'j' : 'gj')", { expr = true })
vim.keymap.set("n", "<up>", "k")
vim.keymap.set("n", "<down>", "j")

-- " delegate colorscheme configuration to your recolor/<colorscheme>.vim files
-- autocmd ColorScheme * echomsg 'runtime recolor/'. expand('<amatch>') .'.vim'
vim.api.nvim_create_autocmd({ "ColorScheme", "VimEnter" }, {
  callback = function()
    -- override "folke/flash.nvim" highlighting
    vim.cmd [[
      highlight link FlashLabel   markdownH5
      highlight link FlashMatch   markdownH6
      highlight link FlashCurrent markdownH3
    ]]
  end,
})

--------------------------------------------------------------------------
-- sunaku
--------------------------------------------------------------------------

local leader = "<backspace>"

local wk = require "which-key"
wk.register {
  [leader] = { name = "+sunaku" },
  [leader .. "a"] = { name = "+Append" },
  [leader .. "A"] = { name = "+Append(EOL)" },
  [leader .. "o"] = { name = "+Open" },
  [leader .. "O"] = { name = "+Open(above)" },
  [leader .. "e"] = { name = "+Expose" },
  [leader .. "E"] = { name = "+Expose(force)" },
  [leader .. "u"] = { name = "+Undo" },
  [leader .. "g"] = { name = "+Git" },
  [leader .. "G"] = { name = "+Git(fugitive)" },
  [leader .. "i"] = { name = "+Insert" },
  [leader .. "I"] = { name = "+Insert(BOL)" },
  [leader .. "d"] = { name = "+Delete" },
  [leader .. "D"] = { name = "+Delete(force)" },
  [leader .. "h"] = { name = "+Diff(hunk)" },
  [leader .. "t"] = { name = "+Toggle" },
  [leader .. "n"] = { name = "+Next" },
  [leader .. "w"] = { name = "+Write" },
  [leader .. "W"] = { name = "+Write(force)" },
  [leader .. "v"] = { name = "+Visual" },
  [leader .. "z"] = { name = "+Fold" },
  [leader .. ","] = { name = "+Execute" },
  [leader .. "."] = { name = "+Repeat" },
  [leader .. "p"] = { name = "+Paste" },
  [leader .. "P"] = { name = "+Paste(before)" },
  [leader .. "y"] = { name = "+Yank" },
  [leader .. "Y"] = { name = "+Yank(extra)" },
  [leader .. "f"] = { name = "+Format" },
  [leader .. "c"] = { name = "+Change" },
  [leader .. "C"] = { name = "+Change(force)" },
  [leader .. "r"] = { name = "+Read" },
  [leader .. "R"] = { name = "+Read(force)" },
  [leader .. "*"] = { name = "+Search" },
}

vim.keymap.set("n", leader .. "<leader>", "<leader>fk", { remap = true, desc = "shortcut menu" })

--------------------------------------------------------------------------
-- file
--------------------------------------------------------------------------

vim.keymap.set(
  "n",
  leader .. "Ef",
  ":call feedkeys(':edit '.expand('%'), 't')<CR>",
  { desc = "edit file as...", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "yf",
  ":call feedkeys(':saveas '.expand('%'), 't')<CR>",
  { desc = "save file as...", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "Yf",
  ":call feedkeys(':write '.expand('%'), 't')<CR>",
  { desc = "save copy of file as...", silent = true }
)

--------------------------------------------------------------------------
-- visual
--------------------------------------------------------------------------

vim.keymap.set("n", "gV", "`[v`]", { desc = "visually select pasted text" })

vim.keymap.set("n", leader .. "vv", "m'ggVG", { desc = "visually select entire buffer" })

--------------------------------------------------------------------------
-- yank
--------------------------------------------------------------------------

vim.keymap.set("n", leader .. "yy", "m'ggyG`'", { desc = "yank the entire buffer" })

--------------------------------------------------------------------------
-- paste
--------------------------------------------------------------------------

vim.keymap.set("n", leader .. "PP", "O<Esc>P", { desc = "paste before cursor, adding a newline" })

vim.keymap.set("n", leader .. "pp", "o<Esc>p", { desc = "paste after cursor, adding a newline" })

vim.keymap.set("n", leader .. "Pp", "O<Esc>O<Esc>p", { desc = "paste before cursor, surrounding newlines" })

vim.keymap.set("n", leader .. "pP", "o<Esc>o<Esc>P", { desc = "paste after cursor, surrounding newlines" })

vim.keymap.set("n", leader .. "P", "i <Esc>P", { desc = "paste before cursor, adding a space" })

vim.keymap.set("n", leader .. "p", "a <Esc>p", { desc = "paste after cursor, adding a space" })

--------------------------------------------------------------------------
-- tab
--------------------------------------------------------------------------

vim.keymap.set("n", leader .. "dt", ":tabclose<CR>", { desc = "close tab", silent = true })

vim.keymap.set("n", leader .. "Dt", ":tabonly<CR>", { desc = "close other tabs", silent = true })

vim.keymap.set("n", "<C-Home>", ":tabfirst<CR>", { desc = "expose first tab", silent = true })

vim.keymap.set("n", "<C-PageUp>", ":tabprevious<CR>", { desc = "expose previous tab", silent = true })

vim.keymap.set("n", "<C-PageDown>", ":tabnext<CR>", { desc = "expose next tab", silent = true })

vim.keymap.set("n", "<C-End>", ":tablast<CR>", { desc = "expose last tab", silent = true })

vim.keymap.set("n", "<M-Home>", ":tabmove 0<CR>", { desc = "move tab to first place", silent = true })

vim.keymap.set("n", "<M-PageUp>", ":tabmove -1<CR>", { desc = "move tab left", silent = true })

vim.keymap.set("n", "<M-PageDown>", ":tabmove +1<CR>", { desc = "move tab right", silent = true })

vim.keymap.set("n", "<M-End>", ":tabmove $<CR>", { desc = "move tab to last place", silent = true })

vim.keymap.set("n", leader .. "It", ":0tabnew<CR>", { desc = "insert new tab in first place", silent = true })

vim.keymap.set("n", leader .. "it", ":-tabnew<CR>", { desc = "insert new tab", silent = true })

vim.keymap.set("n", leader .. "at", ":tabnew<CR>", { desc = "append new tab", silent = true })

vim.keymap.set("n", leader .. "At", ":$tabnew<CR>", { desc = "append new tab in last place", silent = true })

--------------------------------------------------------------------------
-- window
--------------------------------------------------------------------------

vim.keymap.set("n", leader .. "On", ":aboveleft new<CR>", { desc = "split new buffer above", silent = true })

vim.keymap.set("n", leader .. "on", ":belowright new<CR>", { desc = "split new buffer below", silent = true })

vim.keymap.set("n", leader .. "in", ":aboveleft vnew<CR>", { desc = "split new buffer left", silent = true })

vim.keymap.set("n", leader .. "an", ":belowright vnew<CR>", { desc = "split new buffer right", silent = true })

vim.keymap.set("n", leader .. "Ow", ":aboveleft split<CR>", { desc = "split window above", silent = true })

vim.keymap.set("n", leader .. "ow", ":belowright split<CR>", { desc = "split window below", silent = true })

vim.keymap.set("n", leader .. "iw", ":aboveleft vsplit<CR>", { desc = "split window left", silent = true })

vim.keymap.set("n", leader .. "aw", ":belowright vsplit<CR>", { desc = "split window right", silent = true })

vim.keymap.set("n", leader .. "dw", ":close<CR>", { desc = "close window", silent = true })

vim.keymap.set("n", leader .. "Dw", ":only<CR>", { desc = "close other windows", silent = true })

vim.keymap.set(
  "n",
  leader .. "0w",
  ":resize 1<Bar>vertical resize 1<CR>",
  { desc = "minimum window size", silent = true }
)

vim.keymap.set("n", leader .. "1w", ":resize<Bar>vertical resize<CR>", {
  desc = "maximum window size",
  silent = true,
})

-- max out before equalizing to accomodate changes in screen resolution
vim.keymap.set(
  "n",
  leader .. "=w",
  ":resize<Bar>vertical resize<Bar>wincmd =<CR>",
  { desc = "equal window sizes", silent = true }
)

vim.keymap.set("n", leader .. "<S-Down>", ":resize 1<CR>", { desc = "minimum window height", silent = true })

vim.keymap.set("n", leader .. "<S-Left>", ":vertical resize 1<CR>", {
  desc = "minimum window width",
  silent = true,
})

vim.keymap.set(
  "n",
  leader .. "-w",
  ":<C-U>execute join(repeat(['resize -1', 'vertical resize -1'], v:count1), '<Bar>')<CR>",
  { desc = "decrease window size", silent = true }
)

vim.keymap.set("n", "<S-Down>", ":resize -1<CR>", { desc = "decrease window height", silent = true })

vim.keymap.set("n", "<S-Left>", ":vertical resize -1<CR>", { desc = "decrease window width", silent = true })

vim.keymap.set(
  "n",
  leader .. "+w",
  ":<C-U>execute join(repeat(['resize +1', 'vertical resize +1'], v:count1), '<Bar>')<CR>",
  { desc = "increase window size", silent = true }
)

vim.keymap.set("n", "<S-Up>", ":resize +1<CR>", { desc = "increase window height", silent = true })

vim.keymap.set("n", "<S-Right>", ":vertical resize +1<CR>", { desc = "increase window width", silent = true })

vim.keymap.set("n", leader .. "<S-Up>", ":resize<CR>", { desc = "maximum window height", silent = true })

vim.keymap.set("n", leader .. "<S-Right>", ":vertical resize<CR>", {
  desc = "maximum window width",
  silent = true,
})

--------------------------------------------------------------------------
-- buffer
--------------------------------------------------------------------------

vim.keymap.set("n", leader .. "rb", ":confirm edit<CR>", { desc = "reload buffer from file" })

vim.keymap.set("n", leader .. "Rb", ":edit!<CR>", { desc = "reload buffer from file forcefully" })

vim.keymap.set("n", leader .. "wb", ":write<CR>", { desc = "write buffer to file" })

vim.keymap.set("n", leader .. "Wb", ":write!<CR>", { desc = "write buffer to file forcefully" })

vim.keymap.set("n", leader .. "Db", ":1,999bdelete<CR>", { desc = "close all buffers" })

--------------------------------------------------------------------------
-- fold
--------------------------------------------------------------------------

vim.keymap.set(
  "n",
  "<C-Up>",
  ":call sunaku#GotoAdjacentFold('zk', '[z')<CR>",
  { desc = "go to previous adjacent fold" }
)

vim.keymap.set("n", "<C-Down>", ":call sunaku#GotoAdjacentFold('zj', ']z')<CR>", { desc = "go to next adjacent fold" })

vim.keymap.set("n", "<C-Left>", "[[", { desc = "go to start of fold" })

vim.keymap.set("n", "<C-Right>", "]]", { desc = "go to end of fold" })

vim.keymap.set("n", "<A-Up>", "zc", { desc = "close current fold" })

vim.keymap.set("n", "<A-Down>", "zo", { desc = "open current fold" })

vim.keymap.set("n", leader .. "Dz", "zMzv", { desc = "close other folds" })

vim.keymap.set("n", "<A-Left>", "zm", { desc = "decrease fold level" })

vim.keymap.set("n", "<A-Right>", "zr", { desc = "increate fold level" })

for i = 1, 10, 1 do
  vim.keymap.set("n", "z" .. i, i .. "zM" .. i .. "zr", { desc = "fold to level " .. i })
end

--------------------------------------------------------------------------
-- diff
--------------------------------------------------------------------------

vim.keymap.set(
  "n",
  leader .. "h,",
  ":diffget //2<bar>diffupdate<CR>",
  { desc = "diff obtain hunk from left window", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "h.",
  ":diffget //3<bar>diffupdate<CR>",
  { desc = "diff obtain hunk from right window", silent = true }
)

vim.keymap.set("n", leader .. "hb", ":DiffOrig<CR>", {
  desc = "diff buffer against original version",
  silent = true,
})

vim.keymap.set(
  "n",
  leader .. "h<",
  ":diffput //2<bar>diffupdate<CR>",
  { desc = "diff put hunk into left window", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "h>",
  ":diffput //3<bar>diffupdate<CR>",
  { desc = "diff put hunk into right window", silent = true }
)

--------------------------------------------------------------------------
-- format
--------------------------------------------------------------------------

vim.keymap.set(
  "n",
  leader .. "f<Tab>",
  ":call sunaku#Format_tabs_indentation()<CR>",
  { desc = "indent with tabs in buffer", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f<leader>",
  ":call sunaku#Format_spaces_indentation()<CR>",
  { desc = "indent with spaces in buffer", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f1",
  ":call sunaku#Format_markdown_title()<CR>",
  { desc = "format as markdown title heading <h1>", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f2",
  ":call sunaku#Format_markdown_section()<CR>",
  { desc = "format as markdown section heading <h2>", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "ft",
  ":call sunaku#Format_markdown_table_header()<CR>",
  { desc = "format as markdown table heading <th>", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "fc",
  ":<C-U>call sunaku#Format_markdown_fenced_code()<CR>",
  { desc = "format as markdown fenced code block", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "fH",
  ":call sunaku#Format_section_comment_slope()<CR>",
  { desc = "format line as comment section, surrounding with blank comment lines", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "fh",
  ":call sunaku#Format_section_comment_minus()<CR>",
  { desc = "format line as comment section, surrounding with minus sign separators", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f=",
  ":call sunaku#Format_separator_equal_sign()<CR>",
  { desc = "format as separator, appending equal signs to end of line", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f-",
  ":call sunaku#Format_separator_minus_sign()<CR>",
  { desc = "format as separator, appending minus signs to end of line", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f_",
  ":call sunaku#Format_separator_repeat_eol()<CR>",
  { desc = "format as separator, repeating last character to end of line", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f)",
  ":<C-U>call sunaku#Format_funcall_add_parens(1)<CR>",
  { desc = "format function call, adding parentheses", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f(",
  ":call sunaku#Format_funcall_drop_parens()<CR>",
  { desc = "format function call, removing parentheses", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f'",
  ":call sunaku#Format_quotes_singularize()<CR>",
  { desc = "convert double to single quotes at cursor", silent = true }
)

vim.keymap.set(
  "n",
  '<leader>f"',
  ":call sunaku#Format_quotes_pluralize()<CR>",
  { desc = "convert single to double quotes at cursor", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f:",
  ":call sunaku#Format_ruby_quotes_to_symbol()<CR>",
  { desc = "format ruby quotes to symbol at cursor", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "f;",
  ":call sunaku#Format_ruby_symbol_to_quotes()<CR>",
  { desc = "format ruby symbol to quotes at cursor", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "fP",
  ":call sunaku#Format_elixir_funcall_to_pipeline()<CR>",
  { desc = "format elixir function call to pipeline at cursor", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "fp",
  ":call sunaku#Format_elixir_pipeline_to_funcall()<CR>",
  { desc = "format elixir pipeline to function call at cursor", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "fJ",
  ":<C-U>call sunaku#Format_elixir_join_pipeline(1)<CR>",
  { desc = "format elixir pipeline at cursor: join into a single line", silent = true }
)

vim.keymap.set(
  "n",
  leader .. "fK",
  ":<C-U>call sunaku#Format_elixir_split_pipeline(1)<CR>",
  { desc = "format elixir pipeline at cursor: split into multiple lines", silent = true }
)

--------------------------------------------------------------------------
-- finder
--------------------------------------------------------------------------

-- from pack/menu/start/fzf-fzf.vim

-- [leader.."ob"] = { ":Buffers<CR>", "(fzf) open buffer" },
--
-- [leader.."ec"] = { ":Colors<CR>", "(fzf) apply colorscheme" },
--
-- [leader.."et"] = { ":Tags<CR>", "(fzf) expose tag in any buffer" },
--
-- [leader.."eT"] = { ":BTags<CR>", "(fzf) expose tag in buffer" },
--
-- [leader.."of"] = { ":Files<CR>", "(fzf) open file under working directory" },
--
-- [leader.."Of"] = { ":execute 'Files' expand('%:h')<CR>", "(fzf) open file under buffer's directory" },
--
-- [leader.."og"] = { ":GFiles<CR>", "(fzf) open git file (tracked by git)" },
--
-- [leader.."Og"] = { ":execute 'GFiles' expand('%:h')<CR>", "(fzf) open git file under buffer's directory" },
--
-- [leader.."oG"] = { ":GFiles?<CR>", "(fzf) open git file that has changes" },
--
-- [leader.."el"] = { ":Lines<CR>", "(fzf) expose line in any buffer" },
--
-- [leader.."eL"] = { ":BLines<CR>", "(fzf) expose line in buffer" },
--
-- [leader.."em"] = { ":Marks<CR>", "(fzf) expose mark in buffer" },
--
-- [leader.."ew"] = { ":Windows<CR>", "(fzf) expose window in any tab" },
--
-- [leader.."o."] = { ":History<CR>", "(fzf) reopen file from history" },
--
-- [leader.."e;"] = { ":History<CR>", "(fzf) repeat command from history" },
--
-- [leader.."e/"] = { ":Hist/<CR>", "(fzf) repeat search from history" },
--
-- [leader.."qg"] = { ":Commits<CR>", "(fzf) browse git log" },
--
-- [leader.."qG"] = { ":BCommits<CR>", "(fzf) browse git log for buffer" },
--
-- [leader.."e:"] = { ":Commands<CR>", "(fzf) run command from menu" },
--
-- [leader.."e<leader>"] = { ":Maps<CR>", "(fzf) trigger mapping / keybinding / shortcut" },
--
-- [leader.."oh"] = { ":Helptags<CR>", "(fzf) open help topic" },
--
-- [leader.."eB"] = { ":Filetypes<CR>", "(fzf) apply filetype" },

--------------------------------------------------------------------------
-- substitute
--------------------------------------------------------------------------

vim.keymap.set("n", leader .. "s", ":%s/", { desc = "Search and replace buffer", nowait = true })

vim.keymap.set("n", leader .. "S", ":%Subvert/", {
  desc = "(subvert) Search and replace buffer",
  nowait = true,
})

--------------------------------------------------------------------------
-- substitute
--------------------------------------------------------------------------

vim.keymap.set("v", "s", ":s/", { desc = "Search and replace", nowait = true })

vim.keymap.set("v", "S", ":Subvert/", { desc = "(subvert) Search and replace", nowait = true })

-- c = {
--   -- enable EMACS-style cursor movement inside command mode
--   -- https://statico.github.io/vim.html#rudimentary-essentials
--   ["<C-A>"] = {"<Home>", "go to start of line"},
--   -- cnoremap <C-B> <Left>
--   -- cnoremap <C-F> <Right>
--   -- ["<C-D>"] = {"<Delete>", "go to "},
--   ["<A-b>"] = {"<S-Left>", "go to "},
--   ["<A-f>"] = {"<S-Right>", "go to "},
--   ["<A-d>"] = {"<S-Right><Delete>", "go to "},
--   ["<C-G>"] = {"<C-C>", "go to "},
-- }
