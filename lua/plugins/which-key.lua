return {
	-- Keymaps
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		delay = function(ctx)
			return ctx.plugin and 0 or 700
		end,
    preset = "helix",
    disable = {
    ft = { "TelescopePrompt" },
  },
	},
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer Local Keymaps (which-key)",
		},
	},
}
