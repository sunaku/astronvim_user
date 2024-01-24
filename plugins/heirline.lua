-- https://code.mehalter.com/AstroNvim_user/~files/master/plugins/heirline.lua
-- https://discord.com/channels/939594913560031363/939857762043695165/1096393767780618240
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"

    -- winbar: always show filename
    opts.winbar[2] = {
      status.component.file_info { -- add file_info to breadcrumbs
        file_icon = { hl = status.hl.filetype_color, padding = { left = 1 } },
        file_modified = false,
        file_read_only = false,
        hl = status.hl.get_attributes("winbar", true),
        surround = false,
        update = "BufEnter",
      },
      status.component.breadcrumbs {
        icon = { hl = true },
        hl = status.hl.get_attributes("winbar", true),
        prefix = true,
        padding = { left = 0 },
      },
    }

    -- tabline: swap tablist and buflist (placing tablist on left, buflist on right)
    local buflist_index, tablist_index = 2, 4
    opts.tabline[buflist_index], opts.tabline[tablist_index] = opts.tabline[tablist_index], opts.tabline[buflist_index]

    return opts
  end,
}
