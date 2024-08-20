local M = {}

---@param tab_size number
M.setTabWidth = function(tab_size)
	vim.cmd("setlocal tabstop=" .. tab_size .. " shiftwidth=" .. tab_size .. " expandtab")
end

return M
