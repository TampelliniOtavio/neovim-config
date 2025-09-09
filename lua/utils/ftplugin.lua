local M = {}

M.TAB = ""

M.SPACE = "expandtab"

---@param tab_size number
---@param expandtab? boolean
M.setTabWidth = function(tab_size, expandtab)
	expandtab = expandtab == nil and true or expandtab

	local expand = M.TAB

	if expandtab then
		expand = " " .. M.SPACE
	end

	vim.cmd("setlocal tabstop=" .. tab_size .. " shiftwidth=" .. tab_size .. expand)
end

---@param folder_path string must start with /
---@param exclude? table
M.loadFolder = function(folder_path, exclude)
	local config_path = vim.fn.stdpath("config")

  exclude = exclude or {}

  local full_path = config_path .. folder_path

	for _, file in ipairs(vim.fn.readdir(full_path, [[v:val =~ '\.lua$']])) do
    local must_skip = false
    for _, str in ipairs(exclude) do
      if string.match(file, str) then
        must_skip = true
        break
      end
    end

    if not must_skip then
      dofile(full_path .. '/' .. file)
    end
	end
end

return M
