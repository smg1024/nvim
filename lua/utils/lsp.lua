local M = {}

M.on_attach = function(event)
	local client = vim.lsp.get_client_by_id(event.data.client_id)
	if not client then
		return
	end
	local bufnr = event.buf
	local keymap = vim.keymap.set
	local opts = function(desc)
		return {
			noremap = true,
			silent = true,
			buffer = bufnr,
			desc = desc,
		}
	end

	-- native neovim keymaps
	keymap("n", "<leader>gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts("Go to definition"))
	keymap("n", "<leader>gS", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts("Go to definition in split"))
	keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts("Code actions"))
	keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename<CR>", opts("Rename symbol"))
	keymap("n", "<leader>D", "<cmd>lua vim.diagnostic.open_float({ scope = 'line' })<CR>", opts("Line diagnostics"))
	keymap("n", "<leader>d", "<cmd>lua vim.diagnostic.open_float()<CR>", opts("Cursor diagnostics"))
	keymap("n", "<leader>pd", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts("Previous diagnostic"))
	keymap("n", "<leader>nd", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts("Next diagnostic"))
	keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts("Hover documentation"))

	-- fzf-lua keymaps
	keymap("n", "<leader>fd", "<cmd>FzfLua lsp_finder<CR>", opts("LSP Finder"))
	keymap("n", "<leader>fr", "<cmd>FzfLua lsp_references<CR>", opts("Show all references"))
	keymap("n", "<leader>ft", "<cmd>FzfLua lsp_typedefs<CR>", opts("Jump to type definition"))
	keymap("n", "<leader>fs", "<cmd>FzfLua lsp_document_symbols<CR>", opts("List all symbols"))
	keymap("n", "<leader>fw", "<cmd>FzfLua lsp_workspace_symbols<CR>", opts("Search for symbol"))
	keymap("n", "<leader>fi", "<cmd>FzfLua lsp_implementations<CR>", opts("Go to implementation"))

	-- Organize Imports (if supported by the client LSP)
	if client:supports_method("textDocument/codeAction", bufnr) then
		keymap("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = {
					only = { "source.organizeImports" },
					diagnostics = {},
				},
				apply = true,
				bufnr = bufnr,
			})
			-- format after changing import order
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50) -- slight delay to allow for the import order to go first
		end, opts("Organize imports"))
	end
end

return M
