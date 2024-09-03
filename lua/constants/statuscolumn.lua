local M = {}

M.number_mode = {
	All = "all",
	Hybrid = "hybrid",
	Normal = "normal",
	Relative = "relative",
}

-- Create more on https://colordesigner.io/gradient-generator
M.colors = {
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

return M
