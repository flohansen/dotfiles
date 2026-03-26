return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({ "lua", "go", "typescript", "javascript", "python", "rust", "proto" }):wait()

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "lua", "go", "typescript", "javascript", "python", "rust", "proto" },
        callback = function()
          vim.treesitter.start()
        end,
      })
    end,
  },
}
