return function(capabilities)
	-- Lua linters and formatters
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- Python linters and formatters
	local ruff_lint = require("efmls-configs.linters.ruff")
	local ruff_format = require("efmls-configs.formatters.ruff")

	-- Typescript linters and formatters
	local eslint_d = require("efmls-configs.linters.eslint_d")
	local prettier = require("efmls-configs.formatters.prettier")

	-- JSON formatter
	local fixjson = require("efmls-configs.formatters.fixjson")

	-- Bash linters and formatters
	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	-- Docker linters
	local hadolint = require("efmls-configs.linters.hadolint")

	-- C, C++ linters and formatters
	local cpplint = require("efmls-configs.linters.cpplint")
	local clang_format = require("efmls-configs.formatters.clang_format")

	vim.lsp.config('efm', {
		capabilities = capabilities,
		filetypes = {
			"c",
			"cpp",
			"css",
			"docker",
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"python",
			"sh",
			"typescript",
			"typescriptreact",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				c = { cpplint, clang_format },
				cpp = { cpplint, clang_format },
				css = { prettier },
				docker = { hadolint, prettier },
				html = { prettier },
				javascript = { eslint_d, prettier },
				javascriptreact = { eslint_d, prettier },
				json = { eslint_d, fixjson },
				jsonc = { eslint_d, fixjson },
				lua = { luacheck, stylua },
				markdown = { prettier },
				python = { ruff_lint, ruff_format },
				sh = { shellcheck, shfmt },
				typescript = { eslint_d, prettier },
				typescriptreact = { eslint_d, prettier },
			},
		},
	})
end
