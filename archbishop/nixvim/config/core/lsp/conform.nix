{
  lib,
  pkgs,
  ...
}: {
  plugins.conform-nvim = {
    enable = true;
    settings = {
      notify_on_error = true;
      notify_no_formatters = true;
      default_format_opts = {
        lsp_format = "fallback";
      };

      formatters_by_ft = {
        # Web languages
        html = [
          "prettierd"
          "prettier"
        ];
        css = [
          "prettierd"
          "prettier"
        ];
        javascript = [
          "prettierd"
          "prettier"
        ];
        javascriptreact = [
          "prettierd"
          "prettier"
        ];
        typescript = [
          "prettierd"
          "prettier"
        ];
        typescriptreact = [
          "prettierd"
          "prettier"
        ];
        go = ["gofmt"];
        json = [
          "prettierd"
          "prettier"
        ];

        # System languages
        c = ["clang_format"];
        cpp = ["clang_format"];
        cs = ["csharpier"];

        # Scripting languages
        python = [
          "black"
          "isort"
        ];
        lua = ["stylua"];
        bash = ["shfmt"];
        sh = ["shfmt"];

        # Config/markup languages
        nix = ["alejandra"];
        markdown = [
          "prettierd"
          "prettier"
        ];
        yaml = ["prettier"];
        toml = ["taplo"];

        # Database
        sql = ["sqlfluff"];
        postgresql = ["pg_format"];

        # Assembly
        asm = ["asmfmt"];
      };

      formatters = {
        alejandra = {
          command = "${lib.getExe pkgs.alejandra}";
        };
        csharpier = {
          command = "${lib.getExe pkgs.csharpier}";
        };
        clang_format = {
          command = "${lib.getExe pkgs.clang-tools}";
        };
        sqlfluff = {
          command = "${lib.getExe pkgs.sqlfluff}";
          args = [
            "format"
            "--dialect=postgres"
            "-"
          ];
        };
        taplo = {
          command = "${lib.getExe pkgs.taplo}";
        };
      };
    };

    # Lua configuration for advanced formatting behavior
    luaConfig.pre = ''
      -- Table to track slow formatters
      local slow_format_filetypes = {}

      -- Function to toggle autoformatting
      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })

      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    '';
  };

  # Ensure required formatter packages are available
  extraPackages = with pkgs; [
    # Web/JS formatters
    prettierd
    nodePackages.prettier

    # System language formatters
    clang-tools # for clang-format
    csharpier

    # Scripting language formatters
    black
    isort
    stylua
    shfmt

    # Config formatters
    alejandra
    taplo # TOML formatter

    # Database formatters
    sqlfluff
    pgformatter # for pg_format

    # Assembly formatter
    asmfmt
  ];

  plugins.conform-nvim.settings = {
    format_on_save = {
      timeout_ms = 500;
      lsp_format = "fallback";
      stop_after_first = true;
    };
  };
}
