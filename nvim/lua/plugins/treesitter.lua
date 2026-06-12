return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "cmake",
        "cpp",
        "css",
        "fish",
        "gitignore",
        "go",
        "graphql",
        "http",
        "java",
        "scss",
        "prisma",
        "sql",
        -- language
        "javascript",
        "typescript",
        "php",
        "c",
        "cpp",
        "arduino",
        "lua",
        "json",
        "yaml",
      },
    },
    -- MDX: register before parsers load; LazyVim handles configs.setup()
    init = function()
      vim.filetype.add({ extension = { mdx = "mdx" } })
      vim.treesitter.language.register("markdown", "mdx")
    end,
  },
}
