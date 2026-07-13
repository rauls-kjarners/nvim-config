return {
  {
    "AstroNvim/astrolsp",
    opts = function(_, opts)
      local has_phplsp = vim.fn.exepath("php-lsp") ~= ""
      opts.config = opts.config or {}
      opts.servers = opts.servers or {}
      
      -- Disable phpactor LSP as it's used purely as a global CLI tool
      opts.config.phpactor = { autostart = false }
      opts.servers = vim.tbl_filter(function(server)
        return server ~= "phpactor"
      end, opts.servers)

      if has_phplsp then
        -- Configure php-lsp
        opts.config["php-lsp"] = {
          cmd = { "php-lsp" },
          filetypes = { "php" },
          root_dir = require("lspconfig.util").root_pattern("composer.json", ".git"),
          autostart = true,
        }
        table.insert(opts.servers, "php-lsp")
        -- Disable intelephense from community pack
        opts.config.intelephense = { autostart = false }
      else
        -- fallback to intelephense
        opts.config.intelephense = opts.config.intelephense or {}
        opts.config.intelephense.settings = {
          intelephense = {
            environment = {
              phpVersion = "8.4",
              includePaths = {
                "vendor/rector/rector/vendor/rector",
                "var/cache/dev/Symfony/Config",
              },
            },
            files = {
              exclude = {
                "**/.git",
                "**/node_modules",
                "**/vendor/**/{Tests,tests}",
                "**/.history",
                "**/vendor/**/vendor",
                "**/var",
                "**/build",
                "**/public/bundles",
              },
            },
          },
        }
      end
    end,
  },
  {
    "AstroNvim/astrolsp",
    opts = {
      autocmds = {
        php_lsp_tweaks = {
          {
            event = "LspAttach",
            desc = "Disable pull diagnostics for php-lsp",
            callback = function(args)
              local client = vim.lsp.get_client_by_id(args.data.client_id)
              if client and client.name == "php-lsp" then
                client.server_capabilities.diagnosticProvider = false
              end
            end,
          },
        },
      },
    },
  },
  {
    "williamboman/mason-lspconfig.nvim",
    opts = function(_, opts)
      local has_phplsp = vim.fn.exepath("php-lsp") ~= ""
      opts.ensure_installed = opts.ensure_installed or {}
      if has_phplsp then
        opts.ensure_installed = vim.tbl_filter(function(name)
          return name ~= "intelephense" and name ~= "phpactor"
        end, opts.ensure_installed)
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      opts.ensure_installed = vim.tbl_filter(function(name)
        return name ~= "phpactor" and name ~= "phpcs" and name ~= "php-cs-fixer" and name ~= "phpcbf"
      end, opts.ensure_installed)
      vim.list_extend(opts.ensure_installed, { "php-debug-adapter" })
    end,
  },
  {
    "mfussenegger/nvim-dap",
    optional = true,
    config = function()
      local dap = require("dap")
      dap.adapters.php = {
        type = "executable",
        command = "node",
        args = {
          vim.fn.stdpath("data") .. "/mason/packages/php-debug-adapter/extension/out/phpDebug.js",
        },
      }
      dap.configurations.php = {
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (Docker: /var/www)",
          port = 9003,
          pathMappings = {
            ["/var/www"] = "${workspaceFolder}",
          },
        },
        {
          type = "php",
          request = "launch",
          name = "Listen for Xdebug (local)",
          port = 9003,
        },
      }
    end,
  },
  {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = lint.linters_by_ft or {}
      lint.linters_by_ft.php = {}
    end,
  },
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      opts.formatters_by_ft = opts.formatters_by_ft or {}
      opts.formatters_by_ft.php = {}
      return opts
    end,
  },
}