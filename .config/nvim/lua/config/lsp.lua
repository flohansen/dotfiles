-- Configure keymaps
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    local map = function(keys, func, desc)
      vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
    end

    map("gd",         vim.lsp.buf.definition,     "Go to Definition")
    map("gD",         vim.lsp.buf.declaration,    "Go to Declaration")
    map("gr",         vim.lsp.buf.references,     "Go to References")
    map("gi",         vim.lsp.buf.implementation, "Go to Implementation")
    map("K",          vim.lsp.buf.hover,          "Hover Docs")
    map("<leader>rn", vim.lsp.buf.rename,         "Rename")
    map("<leader>ca", vim.lsp.buf.code_action,    "Code Action")
    map("<leader>f",  vim.lsp.buf.format,         "Format")
    map("[d",         vim.diagnostic.goto_prev,   "Prev Diagnostic")
    map("]d",         vim.diagnostic.goto_next,   "Next Diagnostic")
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    vim.lsp.buf.code_action({
      context = { only = { "source.organizeImports" } },
      apply = true,
    })
    vim.lsp.buf.format()
  end,
})

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
})

-- Configure servers using the new API
vim.lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
})

vim.lsp.config("lua_ls", {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})

vim.lsp.config("ts_ls", {
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = { "typescript", "javascript", "typescriptreact", "javascriptreact" },
  root_markers = { "tsconfig.json", "package.json", ".git" },
})

vim.lsp.config("pyright", {
  cmd = { "pyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = { "pyproject.toml", "setup.py", ".git" },
})

vim.lsp.config("rust_analyzer", {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "Cargo.toml" },
})

vim.lsp.config("gopls", {
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork" },
  root_markers = { "go.mod", "go.work", ".git" },
  settings = {
    gopls = {
      usePlaceholders = true,   -- fills in function argument placeholders
      analyses = {
        unusedparams = true,
        shadow = true,
      },
      staticcheck = true,
    },
  },
})

vim.lsp.config("protols", {
  cmd = { "protols" },
  filetypes = { "proto" },
  root_markers = { "protols.toml", "buf.yaml", "buf.yml" },
})

-- Enable the servers
vim.lsp.enable({ "lua_ls", "ts_ls", "pyright", "rust_analyzer", "gopls", "protols" })
