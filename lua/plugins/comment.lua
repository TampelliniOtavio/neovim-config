return {
	{
		"JoosepAlviste/nvim-ts-context-commentstring",
		event = "VeryLazy",
		opts = {
			enable_autocmd = false,
		},
	},
	{
		"numToStr/Comment.nvim",
		event = "VeryLazy",
		opts = {
			-- Add a space b/w comment and the line
			padding = true,
			-- Whether the cursor should stay at its position
			sticky = true,
			-- Lines to be ignored while (un)comment
			ignore = nil,
			-- LHS of toggle mappings in NORMAL mode
			toggler = {
				-- Line-comment toggle keymap
				line = "<leader>/",
				-- Block-comment toggle keymap
				block = "<leader>\\",
			},
			---Enable ke---LHS of operator-pending mappings in NORMAL and VISUAL mode
			opleader = {
				-- Line-comment keymap
				line = "<leader>/",
				-- Block-comment keymap
				block = "<leader>\\",
			},
			-- NOTE: If given `false` then the plugin won't create any mappings
			mappings = {
				-- Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
				basic = true,
				-- Extra mapping; `gco`, `gcO`, `gcA`
				extra = false,
			},
			-- Function to call before (un)comment
			pre_hook = nil,
			---Function to call after (un)comment
			post_hook = nil,
		},
    config = function (_, opts)
      opts.pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
      require("Comment").setup(opts)
    end
	},
}
