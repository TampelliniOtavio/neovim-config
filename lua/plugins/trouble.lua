return {
	"folke/trouble.nvim",
	-- for default options, refer to the configuration section for custom setup.
	opts = {
		modes = {
			test = {
				mode = "diagnostics",
				preview = {
					type = "split",
					relative = "win",
					position = "right",
					size = 0.3,
					border = "rounded",
				},
			},
		},
	},
	cmd = "Trouble",
}
