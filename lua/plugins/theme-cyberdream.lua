return {
	"scottmckendry/cyberdream.nvim",
	depedencies = { "xiyaowong/transparent.nvim" },
	lazy = false,
	priority = 1000,
	opts = {
		-- Enable transparent background
		transparent = true,

		-- Enable italics comments
		italic_comments = true,

		-- Modern borderless telescope theme - also applies to fzf-lua
		borderless_telescope = true,

		-- Set terminal colors used in `:terminal`
		terminal_colors = true,

		theme = {
			variant = "default", -- use "light" for the light variant. Also accepts "auto" to set dark or light colors based on the current value of `vim.o.background`
		},
	},
	config = function(_, opts)
		if opts.transparent then
      require("transparent").setup()
			vim.g.transparent_groups = vim.list_extend(
				vim.g.transparent_groups or {},
				vim.tbl_map(function(v)
					return v.hl_group
				end, vim.tbl_values(require("bufferline.config").highlights))
			)
		end
		require("cyberdream").setup(opts)
	end,
}
