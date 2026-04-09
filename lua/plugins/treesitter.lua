return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "VeryLazy",
    ft = {
      "html",
      "javascriptreact",
      "typescriptreact",
      "vue",
      "svelte",
      "xml",
      "html",
      "blade",
    },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          -- Defaults
          enable_close = true, -- Auto close tags
          enable_rename = true, -- Auto rename pairs of tags
          enable_close_on_slash = false, -- Auto close on trailing </
        },
        filetypes = {
          "html",
          "javascriptreact",
          "typescriptreact",
          "vue",
          "svelte",
          "xml",
          "html",
          "blade",
        },
        per_filetype = {
          ["php"] = {
            enable_close = false,
            enable_rename = false,
            enable_close_on_slash = false,
          },
        },
        aliases = {
          ["blade"] = "html",
        },
      })
    end,
  },
}
