local M = {}

local constants = require("constants.statuscolumn")

local number_mode = constants.number_mode
local colors = constants.colors

--- Define a Pipe on Status
--- @return string
M.pipe = function()
	return "│"
end

local config = {
	number_mode = number_mode.All,
	border = "",
	colors = colors.Grayscale,
	color_step = 1,
	git_enabled = true,
}

--- Define the Git Status on Status
--- @return string
M.gitStatus = function()
	if not config.git_enabled then
		return ""
	end
	return "%s"
end

--- Define the Colors on Status
--- Is based on the Relative Row Number
--- The function setHl need to execute before this
--- @see setHl
M.colors = function()
	local row_number = vim.v.relnum

	if #config.colors == 1 then
		return "%#Gradient_" .. #config.colors .. "#" .. config.border
	end

	local index = row_number + 1

	if config.color_step > 1 then
		index = math.ceil(index / config.color_step)
	end

	if index == 0 then
		index = 1
	end

	if index > #config.colors then
		index = #config.colors
	end

	return "%#Gradient_" .. index .. "#" .. config.border
end

--- Define a Space On Status
M.space = function()
	return " "
end

--- Set the Gradient Palette
--- @return nil
M.setHl = function()
	for i, color in ipairs(config.colors) do
		vim.api.nvim_set_hl(0, "Gradient_" .. i, { fg = color })
	end
end

--- Insert Number on Status
--- @param separator string | nil default space
--- @return string
--- If the config.number_mode is All the separator is used to separate the relative and absolute line
M.number = function(separator)
	if not separator then
		separator = M.space()
	end

	local text = ""

	if config.number_mode == number_mode.Normal then
		text = text .. vim.v.lnum
	elseif config.number_mode == number_mode.Relative then
		text = text .. vim.v.relnum
	elseif config.number_mode == number_mode.All then
		text = text .. vim.v.lnum .. separator .. vim.v.relnum
	elseif config.number_mode == number_mode.Hybrid then
		text = text .. (vim.v.relnum == 0 and vim.v.lnum or vim.v.relnum)
	end

	return text
end

--- Main Function
--- Define the custom string to statuscolumn var
--- @return string
M.status = function()
	local text = ""

	M.setHl()

	text = table.concat({
		M.gitStatus(),
		M.colors(),
		M.number(),
		M.space(),
	})

	return text
end

return M
