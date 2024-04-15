local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "hawkjack.lsp.mason"
require("hawkjack.lsp.handlers").setup()
require "hawkjack.lsp.null-ls"
