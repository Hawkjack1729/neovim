local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.black.with({ extra_args = { "--fast" } }),
    formatting.stylua,
    -- diagnostics.flake8
  },
})

local group = vim.api.nvim_create_augroup("lsp_format_on_save", { clear = true })
local event = "BufWritePre" -- or "BufWritePost"
local async = event == "BufWritePost"

null_ls.setup({
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      local format_buffer = function()
        vim.lsp.buf.format({ bufnr = bufnr, async = async })
      end

      vim.keymap.set("n", "<Leader>f", format_buffer, { buffer = bufnr, desc = "[lsp] format" })

      -- format on save
      vim.api.nvim_create_autocmd(event, {
        buffer = bufnr,
        group = group,
        events = { event },
        action = format_buffer,
        desc = "[lsp] format on save",
      })
    end

    if client.supports_method("textDocument/rangeFormatting") then
      vim.keymap.set("x", "<Leader>f", function()
        vim.lsp.buf.format({ bufnr = vim.api.nvim_get_current_buf() })
      end, { buffer = bufnr, desc = "[lsp] format" })
    end
  end,
})

