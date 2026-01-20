-- treesitter for nvim : https://github.com/nvim-treesitter/nvim-treesitter
return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	branch = "main",
	build = function()
		local parser_installed = {
			"bash",
			"c",
			"cpp",
			"css",
			"csv",
			"dockerfile",
			"groovy",
			"html",
			"html",
			"java",
			"javadoc",
			"javascript",
			"json",
			"jsonc",
			"jsx",
			"kotlin",
			"lua",
			"markdown",
			"markdown_inline",
			"mermaid",
			"nginx",
			"python",
			"regex",
			"requirements",
			"sql",
			"ssh_config",
			"toml",
			"tsx",
			"typescript",
			"vim",
			"vimdoc",
			"yaml",
		}
		require("nvim-treesitter").install(parser_installed)
		require("nvim-treesitter").update()
	end,
	init = function()
		local treesitter_hightlight_group = vim.api.nvim_create_augroup("TreesitterHighlightGroup", {})
		vim.api.nvim_create_autocmd("FileType", {
			group = treesitter_hightlight_group,
			callback = function(args)
				local filetype = args.match
				local lang = vim.treesitter.language.get_lang(filetype)
				if vim.treesitter.language.add(lang) then
					vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
					vim.wo.foldmethod = "expr"
					vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					vim.treesitter.start()
				end
			end,
		})
	end,
}
