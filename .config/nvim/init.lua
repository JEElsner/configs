-- print("Hello from init.lua!")

------ Plugin setup -----

require("config.lazy")

------ Settings ------

-- load basic settings shared with vim
vim.cmd("source ~/.vimrc")

-- Color theme
vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

-- LSP stuff
-- from here: https://lsp-zero.netlify.app/docs/tutorial.html

vim.opt.signcolumn = 'yes'

local lsp_config_defaults = require('lspconfig').util.default_config
lsp_config_defaults.capabilities = vim.tbl_deep_extend(
	'force',
	lsp_config_defaults.capabilities,
	require('cmp_nvim_lsp').default_capabilities()
)

vim.api.nvim_create_autocmd('LspAttach', {
	desc = 'LSP actions',
	callback = function(event)
		local opts = {buffer = event.buf}

		vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
		vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
		vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
		vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
		vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
		vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
		vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
		vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
		vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
		vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
	end,
})

-- https://ast-grep.github.io/guide/tools/editors.html#neovim
require('lspconfig').ast_grep.setup({
	cmd = {"ast-grep", "lsp"},
	filetypes = { "c", "cpp", "rust", "go", "java", "python", "javascript", "typescript", "html", "css", "kotlin", "dart", "lua" },
	root_dir = require('lspconfig.util').root_pattern('sgconfig.yaml', 'sgconfig.yml')
})

require('mason').setup({})
require('mason-lspconfig').setup({
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
})

-- Autocompletion
-- Still from https://lsp-zero.netlify.app/docs/tutorial.html
local cmp = require('cmp')

cmp.setup({
	sources = {
		{name = 'nvim_lsp'},
		{name = 'ast_grep'},
	},
	mapping = cmp.mapping.preset.insert({
		-- Navigate between completion items
		['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
		['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
		-- `Enter` key to confirm completion
		['<CR>'] = cmp.mapping.confirm({select = false}),
		
		-- Ctrl+Space to trigger completion menu
		['<C-Space>'] = cmp.mapping.complete(),
		
		-- Scroll up and down in the completion documentation
		['<C-u>'] = cmp.mapping.scroll_docs(-4),
		['<C-d>'] = cmp.mapping.scroll_docs(4),
	}),
	snippet = {
		expand = function(args)
			vim.snippet.expand(args.body)
		end,
	},
})

require('which-key')
