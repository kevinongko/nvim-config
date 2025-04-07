return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			rust = { "rustfmt" },
			css = { "prettierd" },
			html = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			vue = { "prettierd" },
			json = { "prettierd" },
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	},
}
