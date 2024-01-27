-- Copied from @mehalter on AstroNvim forums:
-- https://code.mehalter.com/AstroNvim_user/~files/master/plugins/heirline.lua
-- https://discord.com/channels/939594913560031363/939857762043695165/1096393767780618240
return {
  "rebelot/heirline.nvim",
  opts = function(_, opts)
    local status = require "astronvim.utils.status"
    opts.statusline[3] = status.component.file_info { filetype = {}, filename = false }

    local path_func = status.provider.filename { modify = ":.:h", fallback = "" }
    opts.winbar[1][1] = status.component.separated_path { path_func = path_func }
    opts.winbar[2] = {
      status.component.separated_path { path_func = path_func },
      status.component.file_info { -- add file_info to breadcrumbs
        file_icon = { hl = status.hl.filetype_color, padding = { left = 0 } },
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
    return opts
  end,
}
