return {
	"mattn/emmet-vim",
	ft = { "blade", "javascriptreact", "typescriptreact", "html" },
	config = function()
		vim.g.user_emmet_install_global = 0

		vim.g.user_emmet_settings = {
			php = {
				extends = "html",
				filters = "html,c",
			},
			blade = {
				extends = "html",
				filters = "html,c",
			},
		}

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "*.html", "*.css", "*.blade.php", "*.tsx", "*.jsx", "*.astro" },
			callback = "EmmetInstall",
		})
	end,
}
