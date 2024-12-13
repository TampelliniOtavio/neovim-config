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

		opts.filetype.typescriptreact = {
			require("formatter.filetypes.typescriptreact").prettierd,
		}

		opts.filetype.typescript = {
			require("formatter.filetypes.typescript").prettierd,
		}

    opts.filetype.go = {
      require("formatter.filetypes.go").gofmt,
    }

		require("formatter").setup(opts)
	end,
}
