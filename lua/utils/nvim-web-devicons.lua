local M = {}

---Query the config icon for the filename
---@param filename string
---@return table
M.get_icon_by_filename = function (filename)
  local filenames = require("nvim-web-devicons").get_icons_by_filename()

  return filenames[filename]
end

---Query the config icon for the filetype
---@param filetype string
---@return table
M.get_icon_by_filetype = function (filetype)
  local filetypes = require("nvim-web-devicons").get_icons_by_filetype()

  return filetypes[filetype]
end

return M
