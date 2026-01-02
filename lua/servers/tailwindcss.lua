return function(capabilities)
	vim.lsp.config('tailwindcss', {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"javascript",
			"javascriptreact",
			"typescript",
			"typescriptreact",
		},
	})
end
