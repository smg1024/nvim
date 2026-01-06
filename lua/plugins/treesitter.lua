-- treesitter configurations : https://github.com/nvim-treesitter/nvim-treesitter

return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	event = { "BufReadPost", "BufNewFile" },
	config = function()
		require("nvim-treesitter").setup({
			ensure_installed = {
				"lua",
				"python",
				"bash",
				"typescript",
				"javascript",
				"html",
				"css",
				"json",
				"yaml",
				"markdown",
				"dockerfile",
				"markdown_inline",
				"c",
				"cpp",
			},
			auto_install = true,
			sync_install = true,
			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
			indent = { enable = true },
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "<CR>",
					scope_incremental = "<TAB>",
					node_incremental = "<S-TAB>",
				},
			},
		})
	end,
}
