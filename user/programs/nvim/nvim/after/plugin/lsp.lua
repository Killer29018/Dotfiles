local lsp = require("lsp-zero")

local cmp = require("cmp")
-- local cmp_action = require("cmp")
cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<CR>"] = cmp.mapping.confirm({ select = false }),
		["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
		["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
		["<C-space>"] = cmp.mapping.confirm({ select = true }),
	}),
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"cmake",
		"clangd",
		"jdtls",
		"texlab",
	},
	handlers = {
		lsp.default_setup
	}
})

lsp.setup()

vim.diagnostic.config({ virtual_text = false })
require("lsp_lines").setup()
vim.keymap.set("n", "<leader>ll", require("lsp_lines").toggle)
