{
  lib,
  pkgs,
  config,
  ...
}:
{
  plugins = {
    lint = {
      enable = true;

      lazyLoad.settings.event = "DeferredUIEnter";

      lintersByFt = {
        bash = [ "shellcheck" ];
        fish = [ "fish" ];
        json = [ "jsonlint" ];
        lua = [ "luacheck" ];
        markdown = [ "markdownlint" ];
        nix = [
          "deadnix"
          "nix"
        ]
        ++ lib.optionals (!config.plugins.lsp.servers.statix.enable) [ "statix" ];
        sh = [ "shellcheck" ];
        yaml = [ "yamllint" ];
      };

      linters = {
        checkmake = {
          cmd = lib.getExe pkgs.checkmake;
        };
        deadnix = {
          cmd = lib.getExe pkgs.deadnix;
        };
        fish = {
          cmd = lib.getExe pkgs.fish;
        };
        golangcilint = {
          cmd = lib.getExe pkgs.golangci-lint;
        };
        luacheck = {
          cmd = lib.getExe pkgs.luaPackages.luacheck;
        };
        markdownlint = {
          cmd = lib.getExe pkgs.markdownlint-cli;
        };
        shellcheck = {
          cmd = lib.getExe pkgs.shellcheck;
        };
        sqlfluff = {
          cmd = lib.getExe pkgs.sqlfluff;
        };
        statix = {
          cmd = lib.getExe pkgs.statix;
        };
        yamllint = {
          cmd = lib.getExe pkgs.yamllint;
        };
      };
    };
  };
}
