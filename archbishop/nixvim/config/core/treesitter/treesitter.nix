{pkgs, ...}: {
  filetype.extension.liq = "liquidsoap";

  plugins.treesitter = {
    enable = true;
    nixGrammars = true;

    settings = {
      indent = {
        enable = true;
      };
      highlight = {
        enable = true;
      };
    };

    folding.enable = false;
    languageRegister.liq = "liquidsoap";
    nixvimInjections = true;
    grammarPackages = pkgs.vimPlugins.nvim-treesitter.allGrammars;
  };

  extraConfigLua = ''
    local parser_config = require("nvim-treesitter").get_available()

    parser_config.liquidsoap = {
      filetype = "liquidsoap",
    }
  '';
}
