local utils = require("utils.nvim-web-devicons")

return {
	"nvim-tree/nvim-web-devicons",
	opts = {
		override = {
			[".env.example"] = utils.get_icon_by_filename(".env"),
			["docker-compose.production.yml"] = utils.get_icon_by_filename("docker-compose.yml"),
		},
	},
}
