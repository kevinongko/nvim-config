return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-buffer", -- source from text in buffer
    "hrsh7th/cmp-path", -- source from file system paths
    "onsails/lspkind.nvim" -- pictograms
  },
  config = function ()
    local cmp = require("cmp")
    local lspkind = require("lspkind")

    cmp.setup({
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
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
