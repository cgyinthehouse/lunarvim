-- VIM OPTIONS
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.scrolloff = 5
vim.opt.wrap = true
vim.opt.ignorecase = true
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

--------------------------------------------------------------------------
-- GENERAL
lvim.log.level = "info"
lvim.format_on_save = {
	enabled = true,
	pattern = { "*.lua", "*.py" },
	timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

--------------------------------------------------------------------------
-- KEYMAPPINGS <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.normal_mode["]b"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["[b"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<S-l>"] = false
lvim.keys.normal_mode["<S-h>"] = false
lvim.keys.normal_mode["<leader>bf"] = false

-- WHICH_KEY
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
lvim.builtin.which_key.mappings["bf"] = { "<cmd>Telescope buffers theme=dropdown previewer=false<cr>", "Find" }
lvim.builtin.which_key.mappings["Tm"] = { "<cmd>TSModuleInfo<cr>", "Module Info" }
lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["o"] = { "<cmd>NvimTreeFocus<CR>", "Focus NvimTree" }
lvim.builtin.which_key.mappings["gh"] = { "<cmd>Gitsigns toggle_linehl<cr>", "Toggle line highlight" }
lvim.builtin.which_key.mappings["s;"] = { "<cmd>Telescope command_history<cr>", "Command History" }
lvim.builtin.which_key.mappings["u"] = { "<cmd>Telescope undo<cr>", "Undo Tree" }
lvim.builtin.which_key.mappings["m"] = { "<cmd>SymbolsOutline<cr>", "Symbols Outline" }
lvim.builtin.which_key.mappings["z"] = { "<cmd>ZenMode<cr>", "Zen Mode" }
lvim.builtin.which_key.mappings["x"] = {
	name = "Trouble",
	r = { "<cmd>Trouble lsp_references<cr>", "References" },
	f = { "<cmd>Trouble lsp_definitions<cr>", "Definitions" },
	d = { "<cmd>Trouble lsp_document_diagnostics<cr>", "Document Diagnostics" },
	q = { "<cmd>Trouble quickfix<cr>", "QuickFix" },
	l = { "<cmd>Trouble loclist<cr>", "LocationList" },
	w = { "<cmd>Trouble lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
}
lvim.builtin.which_key.mappings["C"] = {
	name = "Color highlighter",
	c = { "<cmd>CccHighlighterToggle<cr>", "Toggle Highlighter" },
	p = { "<cmd>CccPick<cr>", "Color Picker" },
	v = { "<cmd>CccConvert<cr>", "Convert Expression" },
}

--------------------------------------------------------------------------
-- TELESCOPE
lvim.builtin.cmp.cmdline.enable = true
lvim.builtin.telescope.extensions.undo = {
	use_delta = true,
	side_by_side = true,
	scroll_strategy = "limit",
	layout_strategy = "vertical",
	layout_config = {
		width = 0.85,
		preview_height = 0.8,
	},
	-- mappings = {
	--   i = {
	--     ["<cr>"] = require("telescope-undo.actions").yank_additions,
	--     ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
	--     ["<C-cr>"] = require("telescope-undo.actions").restore,
	--   },
	-- },
}
lvim.builtin.telescope.theme = "center"
lvim.builtin.telescope.on_config_done = function(telescope)
	pcall(telescope.load_extension, "undo")
	-- any other extensions loading
end

--------------------------------------------------------------------------
-- THEME SETTINGS
lvim.colorscheme = "tokyonight-night"
-- lvim.transparent_window = true

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.lualine.sections.lualine_a = { { "mode", color = { gui = "bold" } } }
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup["modified"] = { enable = true }
lvim.builtin.nvimtree.setup.renderer.icons.show.git = true
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.arrow_open = ""
lvim.builtin.nvimtree.setup.renderer.icons.glyphs.folder.arrow_closed = ""
lvim.builtin.nvimtree.setup.renderer.icons.git_placement = "after"
lvim.builtin.nvimtree.setup.renderer.indent_markers.enable = true
lvim.builtin.nvimtree.setup.renderer.add_trailing = true

--------------------------------------------------------------------------
--TELESCOPE

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.telescope.defaults.layout_config = {
	horizontal = {
		prompt_position = "bottom",
		preview_width = 0.55,
	},
	vertical = {
		mirror = false,
	},
	width = 0.87,
}

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
lvim.builtin.treesitter.ensure_installed = {
	"comment",
	"regex",
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
	"markdown",
	"markdown_inline",
	"fish",
	"embedded_template",
	"toml",
	"dockerfile",
	"graphql",
}

--------------------------------------------------------------------------
-- LSP

-- -- generic LSP settings <https://www.lunarvim.org/docs/configuration/language-features/language-servers>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting>
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "stylua", filetypes = { "lua" } },
	{
		command = "prettier",
		extra_args = { "--print-width", "100" },
		filetypes = { "typescript", "typescriptreact" },
	},
	{ command = "black", filetypes = { "python" } },
})
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	-- { command = "flake8", filetypes = { "python" } },
	{
		command = "shellcheck",
		args = { "--severity", "warning" },
	},
})
local code_actions = require("lvim.lsp.null-ls.code_actions")
code_actions.setup({
	{
		exe = "eslint",
		filetypes = { "typescript", "typescriptreact" },
	},
})

--------------------------------------------------------------------------
-- PLUGINS

lvim.plugins = {
	{ "folke/trouble.nvim", cmd = "TroubleToggle" },
	{
		"folke/zen-mode.nvim",
		cmd = "ZenMode",
	},
	{ "mrjones2014/nvim-ts-rainbow" },
	{ "debugloop/telescope-undo.nvim" },
	{
		"kylechui/nvim-surround",
		version = "*",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function()
			require("lsp_signature").on_attach()
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	{
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({
				width = 120, -- Width of the floating window
				height = 25, -- Height of the floating window
				default_mappings = true, -- Bind default mappings
			})
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		config = function()
			require("ccc").setup()
		end,
	},

	-- colorscheme
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = { transparent = true },
		name = "tokyonight",
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				integrations = {
					sandwich = true,
					noice = true,
					mini = true,
					leap = true,
					markdown = true,
					mason = true,
					neotest = true,
					cmp = true,
					overseer = true,
					navic = true,
					lsp_trouble = true,
					ts_rainbow2 = true,
					which_key = true,
					gitsigns = true,
				},
			})
			vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		event = "VeryLazy",
		config = function()
			require("nightfox").setup({
				options = {
					transparent = false,
					styles = {
						comments = "italic",
						keywords = "italic",
					},
				},
			})
		end,
	},
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
