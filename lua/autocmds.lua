-- Remove StatusColumn from NvimTree
vim.api.nvim_create_autocmd("BufEnter", {
	callback = function()
		if vim.bo.filetype == "NvimTree" then
			vim.wo.statuscolumn = ""
		end
	end,
})
