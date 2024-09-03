local M = {}

local number_mode = {
	All = "all",
	Hybrid = "hybrid",
	Normal = "normal",
	Relative = "relative",
}

-- Create more on https://colordesigner.io/gradient-generator
local colors = {
	Grayscale = {
		"#ffffff",
		"#ededed",
		"#dbdbdb",
		"#cacaca",
		"#b8b8b8",
		"#a7a7a7",
		"#979797",
		"#878787",
		"#777777",
		"#676767",
	},
	Rainbow = {
		"#ff0000",
		"#ff8e00",
		"#e3ff00",
		"#55ff00",
		"#00ff39",
		"#00ffc6",
		"#00aaff",
		"#001cff",
		"#7100ff",
		"#ff00ff",
	},
	RainbowReverse = {
		"#ff00ff",
		"#7100ff",
		"#001cff",
		"#00aaff",
		"#00ffc6",
		"#00ff39",
		"#55ff00",
		"#e3ff00",
		"#ff8e00",
		"#ff0000",
	},
	Blue = {
		"#75caff",
		"#6fbcff",
		"#69acff",
		"#639cff",
		"#5d8aff",
		"#5678ff",
		"#5065ff",
		"#4a50ff",
		"#4e44ff",
		"#583eff",
	},
}

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
