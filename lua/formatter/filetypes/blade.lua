local M = {}

function M.default()
	return {
		exe = "blade-formatter",
		args = { "--stdin" },
		stdin = true,
	}
end

return M
