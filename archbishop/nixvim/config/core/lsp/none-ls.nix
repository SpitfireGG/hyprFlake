{pkgs, ...}: {
  plugins.none-ls = {
    enable = true;
    enableLspFormat = true;
    settings.update_in_insert = true;
    settings.debug = true;
    sources = {
      code_actions = {
        gitsigns.enable = false;
        statix.enable = false;
      };
      diagnostics = {
        statix.enable = false;
        yamllint.enable = false;
        golangci_lint.enable = false;
        dotenv_linter.enable = true;
      };
      formatting = {
        qmlformat = {
          enable = true;
        };

        nixfmt = {
          enable = true;
          package = pkgs.nixfmt-rfc-style;
        };
        black = {
          enable = false;
        };
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        csharpier.enable = true;
        gofmt.enable = true;
        stylua.enable = true;
        clang_format.enable = true;
        yamlfmt.enable = false;
      };
    };
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>cf";
      action = "<cmd>lua vim.lsp.buf.format()<cr>";
      options = {
        silent = true;
        desc = "Format";
      };
    }
  ];
}
