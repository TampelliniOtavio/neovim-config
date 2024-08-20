return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		hijack_cursor = true,
		sync_root_with_cwd = true,
		filters = { custom = { "^.git$" } },
	},
	config = function(_, opts)
		local utils = require("utils.nvim-tree")

		opts.on_attach = utils.my_on_attach

		require("nvim-tree").setup(opts)
	end,
}
