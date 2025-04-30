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

return M
