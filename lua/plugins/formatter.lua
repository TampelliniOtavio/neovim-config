return {
	-- Formatter
	"mhartington/formatter.nvim",
	opts = {
		-- Enable or disable logging
		logging = true,
		-- Set the log level
		log_level = vim.log.levels.WARN,
		-- All formatter configurations are opt-in
		filetype = {},
	},
	config = function(_, opts)
		opts.filetype.lua = {
			require("formatter.filetypes.lua").stylua,
		}

		require("formatter").setup(opts)
	end,
}
