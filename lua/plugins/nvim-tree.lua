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
		filters = {
			custom = {
				"^.git$",
			},
		},
		renderer = {
			full_name = true,
			group_empty = true,
			special_files = {},
			symlink_destination = false,
			indent_markers = {
				enable = true,
			},
			icons = {
				git_placement = "signcolumn",
				show = {
					file = true,
					folder = true,
					folder_arrow = false,
					git = true,
				},
			},
		},
		diagnostics = {
			enable = true,
			show_on_dirs = true,
		},
	},
	config = function(_, opts)
		local utils = require("utils.nvim-tree")

		opts.on_attach = utils.my_on_attach

		require("nvim-tree").setup(opts)
	end,
}
