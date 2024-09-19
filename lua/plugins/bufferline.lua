return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	opts = {
		options = {
			diagnostics = "nvim_lsp",
			themable = true,
			offsets = {
				{
					filetype = "NvimTree",
				},
			},
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local s = " "
				for e, n in pairs(diagnostics_dict) do
					local sym = ""
					if e == "error" then
						sym = " "
					elseif e == "warning" then
						sym = " "
					end
					s = s .. n .. sym
				end
				return s
			end,
		},
	},
}
