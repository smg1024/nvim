return function(capabilities)
	vim.lsp.config('jsonls', {
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "json", "jsonc" },
	})
end
