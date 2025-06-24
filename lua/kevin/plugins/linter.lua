return {
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" }, -- Optional: load only when needed
		config = function()
			-- Register oxlint, based on `lua/lint/linters/jshint.lua`
			require("lint").linters.oxlint = {
				name = "oxlint",
				-- cargo install --features allocator --git https://github.com/oxc-project/oxc oxc_cli
				cmd = "oxlint", -- NOTE: this is using oxlint bin from cargo
				stdin = false,
				args = { "--format", "unix" },
				stream = "stdout",
				ignore_exitcode = true,
				parser = require("lint.parser").from_errorformat("%f:%l:%c: %m", {
					source = "oxlint",
					severity = vim.diagnostic.severity.WARN,
				}),
			}

			-- Set up linters by filetype
			require("lint").linters_by_ft = {
				javascript = { "oxlint" },
				typescript = { "oxlint" },
			}

			-- Optional: create autocmd to run lint on specific events
			vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
}
