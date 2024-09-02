require("which-key").add({
	{ "<c-h>", "<c-w><left>", desc = "Left Window", hidden = true },
	{ "<c-l>", "<c-w><right>", desc = "Right Window", hidden = true },
	{ "<c-k>", "<c-w><up>", desc = "Up Window", hidden = true },
	{ "<c-j>", "<c-w><down>", desc = "Down Window", hidden = true },
	{ "<leader>q", ":quit<cr>", desc = "Quit", hidden = true },
	{ "<leader>w", ":write<cr>", desc = "Write", hidden = true },
	{ "<leader>h", ":nohlsearch<cr>", desc = "No Highlight" },
	{ "<leader>l", group = "LSP" },
	{ "<leader>lf", ":Format<cr>", desc = "Format", mode = "n" },
	{ "<leader>lF", ":FormatWrite<cr>", desc = "Format and Write", mode = "n" },
	{
		"<leader>?",
		function()
			require("which-key").show({ global = false })
		end,
		desc = "buffer local keymaps (which-key)",
		hidden = true,
	},
	{ "<leader>e", ":NvimTreeToggle<cr>", desc = "Open Tree" },
	{ "<leader>c", ":bdelete<cr>", desc = "Close Tab" },
	{ "<leader>b", group = "Buffer" },
	{ "<leader>bc", ":bdelete<cr>", desc = "close tab" },
	{ "<leader>bh", ":BufferLineCloseLeft<cr>", desc = "close all to de left" },
	{ "<leader>bl", ":BufferLineCloseRight<cr>", desc = "close all to de right" },
	{ "<leader>bn", ":BufferLineCycleNext<cr>", desc = "go to next" },
	{ "<leader>bb", ":BufferLineCyclePrev<cr>", desc = "go to previous" },
	{ "<leader>bj", ":BufferLinePick<cr>", desc = "jump to" },
	{ "<leader>/", desc = "toggle line comment", mode = { "n", "v" } }, -- configure in plugins-configuration/comment.lua
	{ "<leader>\\", desc = "toggle block comment", mode = { "n", "v" } }, -- configure in plugins-configuration/comment.lua
	{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "lazygit" },
	{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
	{ "<leader>s", group = "Search" },
	{ "<leader>sf", "<cmd>Telescope find_files<cr>", desc = "Search Files" },
	{ "<leader>st", "<cmd>Telescope live_grep<cr>", desc = "Search Text" },
  { "<leader>d", group = "Generate Docs" },
  { "<leader>dl", "<cmd>Neogen<cr>", desc = "Lua" },
  { "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "Go to Definition" },
  { "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "Go to Declaration" }
})
