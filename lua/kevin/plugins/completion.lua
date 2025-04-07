return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer",              -- source from text in buffer
    "hrsh7th/cmp-path",                -- source from file system paths
    "onsails/lspkind.nvim",            -- pictograms
    "nvim-treesitter/nvim-treesitter", -- needed for the tag detection
  },
  config = function()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    -- Helper function to check if cursor is in a Vue start tag or directive
    local function is_in_start_tag()
      local has_ts, ts_utils = pcall(require, 'nvim-treesitter.ts_utils')
      if not has_ts then return false end

      local node = ts_utils.get_node_at_cursor()
      if not node then return false end

      local node_to_check = { 'start_tag', 'self_closing_tag', 'directive_attribute' }
      return vim.tbl_contains(node_to_check, node:type())
    end

    cmp.setup({
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          -- Filter LSP completions for Vue template attributes
          entry_filter = function(entry, ctx)
            -- Only apply filtering for Vue files
            if ctx.filetype ~= 'vue' then
              return true
            end

            -- Skip filtering if not in start tag (only filter in templates)
            if not is_in_start_tag() then
              return true
            end

            local cursor_before_line = ctx.cursor_before_line

            -- For events (starting with @)
            if cursor_before_line:sub(-1) == '@' then
              return entry.completion_item.label:match('^@')
              -- For props (starting with :) - exclude events with `:on-` prefix
            elseif cursor_before_line:sub(-1) == ':' then
              return entry.completion_item.label:match('^:') and not entry.completion_item.label:match('^:on%-')
            else
              return true
            end
          end
        },
        { name = "buffer" },
        { name = "path" }
      }),
      mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = "..."
        })
      }
    })
  end
}
