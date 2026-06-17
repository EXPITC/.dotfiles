return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        "stylua",
        "selene",
        "luacheck",
        "shellcheck",
        "shfmt",
        "tailwindcss-language-server",
        "typescript-language-server",
        "prisma-language-server",
        "css-lsp",
        "phpcs",
        "php-cs-fixer",
        "eslint_d",
      })
    end,
  },
}
