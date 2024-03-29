local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
	"cmake",
	"clangd",
	"jdtls",
	"texlab",
})

local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
	["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
	["<C-space>"] = cmp.mapping.confirm({ select = true }),
	["<Cr>"] = cmp.mapping.confirm({ select = false }),
})

lsp.set_preferences({
	sign_icons = {},
})

lsp.setup_nvim_cmp({
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
end)

lsp.setup()

vim.diagnostic.config({ virtual_text = false })
require("lsp_lines").setup()
vim.keymap.set("n", "<leader>ll", require("lsp_lines").toggle)
