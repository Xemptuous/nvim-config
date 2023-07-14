require("lint").linters_by_ft = {
	lua = { "luacheck" },
	python = { "ruff" },
	javascript = { "quick-lint-js" },
	sql = { "sqlfluff" },
	json = { "jsonlint" },
}
