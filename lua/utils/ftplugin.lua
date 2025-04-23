local M = {}

---@param tab_size number
---@param expandtab? boolean
M.setTabWidth = function(tab_size, expandtab)
	expandtab = expandtab == nil and true or expandtab

	local expand = ""

	if expandtab then
		expand = " expandtab"
	end

	vim.cmd("setlocal tabstop=" .. tab_size .. " shiftwidth=" .. tab_size .. expand)
end

return M
