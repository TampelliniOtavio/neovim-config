local M = {}

local number_mode = {
  All = "all",
  Hybrid = "hybrid",
  Normal = "normal",
  Relative = "relative"
}

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
}

M.pipe = function ()
  return "│"
end

local config = {
	number_mode = number_mode.All,
	border = "",
	colors = colors.Grayscale,
	color_step = 1,
	git_enabled = true,
	filetype_disabled = {
		"NvimTree",
		"TelescopePrompt",
	},
}

M.gitStatus = function()
	if not config.git_enabled then
		return ""
	end
	return "%s"
end

M.border = function()
	-- See how the characters is larger then the rest? That's how we make the border look like a single line
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

M.space = function()
	return " "
end

M.setHl = function()
	for i, color in ipairs(config.colors) do
		vim.api.nvim_set_hl(0, "Gradient_" .. i, { fg = color })
	end
end

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

M.status = function()
	local text = ""
	local curr_filetype = vim.bo.filetype

	for _, filetype in pairs(config.filetype_disabled) do
		if curr_filetype == filetype then
			return text
		end
	end

	M.setHl()

	text = table.concat({
		M.gitStatus(),
		M.border(),
    M.number(M.space()),
		M.space(),
	})

	return text
end

return M
