vim.lsp.config('rust_analyzer', {
  cmd = { 'rust-analyzer' },
  filetypes = { 'rust' },
  root_markers = { 'Cargo.toml', 'rust-project.json', '.git' },
  settings = {
    ['rust-analyzer'] = {
      cargo = {
        allFeatures = true,
      },
      -- This turns the diagnostic engine on or off when saving files
      checkOnSave = true,
      -- This dictates what command the engine actually executes
      check = {
        command = 'clippy',
      },
    },
  },
})

vim.lsp.enable({"clangd", "gopls", "texlab", "rust_analyzer"})
