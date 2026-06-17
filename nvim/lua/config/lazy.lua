local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- bootstrap lazy.nvim
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    {
      "LazyVim/LazyVim",
      import = "lazyvim.plugins",
      opts = {
        -- colorscheme = "solarized-osaka",
        colorscheme = "tokyonight",
      },
    },
    -- import any extras modules here
    { import = "lazyvim.plugins.extras.linting.eslint" },
    { import = "lazyvim.plugins.extras.formatting.prettier" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.php" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    -- { import = "lazyvim.plugins.extras.coding.copilot" },
    { import = "lazyvim.plugins.extras.util.mini-hipatterns" },
    -- { import = "lazyvim.plugins.extras.ui.alpa" },
    { import = "lazyvim.plugins.extras.ui.mini-animate" },
    -- navigation & git
    { import = "lazyvim.plugins.extras.editor.harpoon2" },
    { import = "lazyvim.plugins.extras.editor.aerial" },
    -- import/override with your plugins
    { import = "plugins" },
    -- php
    { import = "lazyvim.plugins.extras.lang.php" },
    -- {
    --   "phpactor/phpactor",
    --   build = "composer install --no-dev --optimize-autoloader",
    --   ft = "php",
    --   cmd = "Phpactor",
    --   dependencies = { "nvim-lua/plenary.nvim" },
    --   opts = {
    --     lsp = {
    --       capabilities = {
    --         textDocument = {
    --           publishDiagnostics = {
    --             relatedInformation = false,
    --           },
    --         },
    --       },
    --     },
    --   },
    -- },
    -- {
    --   "stephpy/vim-php-cs-fixer",
    --   ft = "php",
    --   cmd = "PhpCsFixerFix",
    -- },
    {
      "mfussenegger/nvim-lint",
      optional = true,
      opts = {
        linters_by_ft = {
          php = { "phpcs" },
        },
        linters = {
          phpcs = {
            cmd = "phpcs", -- Specify the linter command
            args = {
              "--standard=PEAR", -- Use PEAR coding standard
              "--ignore=PEAR.Commenting.FunctionComment.Missing", -- Ignore the specific missing doc comment rule
              vim.fn.expand("%:p"), -- Use the full path of the current file
            },
            stdin = false,
          },
        },
      },
    },
    {
      "mfussenegger/nvim-dap",
      optional = true,
      opts = function()
        local dap = require("dap")
        local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()
        dap.adapters.php = {
          type = "executable",
          command = "node",
          args = { path .. "/extension/out/phpDebug.js" },
        }
      end,
    },
    {
      "stevearc/conform.nvim",
      optional = true,
      opts = {
        formatters_by_ft = {
          php = { "php_cs_fixer" },
          javascript = { "eslint_d" },
          typescript = { "eslint_d" },
          javascriptreact = { "eslint_d" },
          typescriptreact = { "eslint_d" },
        },
        notify_on_error = true,
        formatters = {
          eslint_d = {
            condition = function(self, ctx)
              -- use project config if found, otherwise walk up to home dir config
              return vim.fs.find(
                { ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml", "eslint.config.js", "eslint.config.mjs" },
                { path = ctx.filename, upward = true }
              )[1] ~= nil
                or vim.fs.find(
                  { ".eslintrc", ".eslintrc.js", ".eslintrc.cjs", ".eslintrc.json", ".eslintrc.yaml", ".eslintrc.yml" },
                  { path = vim.fn.expand("~"), upward = false }
                )[1] ~= nil
            end,
          },
          ["php_cs_fixer"] = {
            command = "php-cs-fixer",
            args = {
              "fix",
              "$FILENAME",
              "--config=/Users/expitc/.config/nvim/formatter/.php-cs-fixer.php", -- Ensure correct config path
              "--allow-risky=yes",
            },
            stdin = false,
          },
        },
      },
    },
  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    -- lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    -- version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
