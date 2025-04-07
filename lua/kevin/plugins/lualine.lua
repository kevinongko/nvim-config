return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count
		lualine.setup({
			options = {
				theme = "tokyonight",
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
				lualine_b = { "filename", "branch" },
				lualine_c = {
					{
						function()
							local clients = vim.lsp.get_clients({ bufnr = 0 })
							if #clients == 0 then
								return ""
							end
							local clients_str = "󰒍 "
							for _, client in ipairs(clients) do
								clients_str = clients_str .. client.name .. ", "
							end
							return clients_str:sub(1, -3) -- Remove trailing comma
						end,
					},
					{
						function()
							-- For nvim-lint linters
							local ok, lint = pcall(require, "lint")
							if not ok then
								return ""
							end

							local ft = vim.bo.filetype
							local linters = lint.linters_by_ft[ft]
							if not linters or #linters == 0 then
								return ""
							end

							local linters_str = "󰁯 " -- Linter icon
							for _, linter in ipairs(linters) do
								linters_str = linters_str .. linter .. ", "
							end
							return linters_str:sub(1, -3) -- Remove trailing comma
						end,
					},
					{
						function()
							-- For conform.nvim formatters
							local ok, conform = pcall(require, "conform")
							if not ok then
								return ""
							end

							local formatters = conform.list_formatters_to_run(0)
							if #formatters == 0 then
								return ""
							end

							local formatters_str = "󰉶 "
							for _, formatter in ipairs(formatters) do
								formatters_str = formatters_str .. formatter.name .. ", "
							end
							return formatters_str:sub(1, -3) -- Remove trailing comma
						end,
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = "#ff9e64" },
					},
					{ "encoding" },
					{ "fileformat" },
				},
				lualine_y = { "filetype", "progress" },
				lualine_z = {
					{ "location", separator = { right = "" }, left_padding = 2 },
				},
			},
			inactive_sections = {
				lualine_a = { "filename" },
				lualine_b = {},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = { "location" },
			},
			tabline = {},
			extensions = {},
		})
	end,
}
