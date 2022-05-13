local M = {}

function M.config()
  local present, alpha = pcall(require, "alpha")
  if present then
    local utils = require "core.utils"
    alpha.setup(utils.user_plugin_opts("plugins.alpha", {
      layout = {
        { type = "padding", val = 2 },
        {
          type = "text",
          val = utils.user_plugin_opts("header", {
            " ",
            " ",
            " ",
            " ",
            " ",
"  ___ __ _  __ _  __| |___| | _(_)",
" / __/ _` |/ _` |/ _` / __| |/ / |",
"| (_| (_| | (_| | (_| \\__ \\   <| |",
" \\___\\__, |\\__,_|\\__,_|___/_|\\_\\_|",
"     |___/                        ",
            " ",
            " ",
            " ",
            " ",
          }, false),
          opts = {
            position = "center",
            hl = "DashboardHeader",
          },
        },
        { type = "padding", val = 2 },
        {
          type = "group",
          val = {
            utils.alpha_button("LDR f f", "  Find File  "),
            utils.alpha_button("LDR f o", "  Recents  "),
            utils.alpha_button("LDR f m", "  Bookmarks  "),
          },
          opts = {
            spacing = 1,
          },
        }
      },
      opts = {},
    }))
  end
end

return M
