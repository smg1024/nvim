return function(capabilities)
	vim.lsp.config('ts_ls', {
		capabilities = capabilities,
		filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
		settings = {
			typescript = {
				indentStyle = "space",
				indentSize = 2,
			},
		},
	})
end
