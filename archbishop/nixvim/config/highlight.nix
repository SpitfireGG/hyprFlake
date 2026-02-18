{
  config,
  lib,
  ...
}: let
  colors = import ../config/colors/${config.theme}.nix {};
in {
  config = {
    highlight = {
      TablineFill = {
        bg = colors.base0E;
      };
      TabLine = {
        bg = "none";
      };

      CursorLine = {
        fg = "none";
        bg = "none";
      };
      CursorLineNr = {
        fg = "none";
        bg = "none";
      };
      AlphaHeader = {
        fg = colors.base0E;
        bg = "none";
      };
      StatusNormal = {
        bg = "none";
        fg = "none";
      };

      TelescopePromptBorder = {
        fg = colors.base01;
        bg = "none";
      };
      TelescopePromptNormal = {
        fg = "none";
        bg = "none";
      };
      TelescopePromptPrefix = {
        fg = colors.base08;
        bg = "none";
      };
      TelescopeSelection = {
        fg = "none";
        bg = "none";
      };

      Pmenu = {
        fg = "none";
        bg = "none";
      };
      Pumblend = {
        fg = "none";
        bg = "none";
      };
      pumblend = {
        fg = "none";
        bg = "none";
      };
      PmenuSbar = {
        fg = "none";
        bg = "none";
      };
      PmenuThumb = {
        fg = "none";
        bg = "none";
      };
      PmenuSel = {
        fg = "none";
        bg = "none";
      };

      VertSplit = {
        fg = "none";
        bg = "none";
      };
      FloatBorder = {
        fg = "none";
        bg = "none";
      };
      NormalFloat = {
        fg = "none";
        bg = "none";
      };
      LineNr = {
        fg = "none";
        bg = "none";
      };

      NoiceCmdlinePopup = {
        fg = colors.base04;
        bg = "none";
      };
      NoiceCmdlinePopupBorder = {
        fg = colors.base01;
        bg = "none";
      };
      NoiceCmdlinePopupBorderSearch = {
        fg = colors.base01;
        bg = "none";
      };

      WinSeparator = {
        fg = "none";
        bg = "none";
      };

      DiagnosticFloatingError = {
        fg = colors.base08;
        bg = "none";
      };
      DiagnosticFloatingWarn = {
        fg = colors.base09;
        bg = "none";
      };
      DiagnosticFloatingInfo = {
        fg = colors.base0C;
        bg = "none";
      };
      DiagnosticFloatingHint = {
        fg = colors.base0D;
        bg = "none";
      };

      GitSignsAdd = {
        fg = colors.base0B;
      };

      LspInfoBorder = {
        fg = colors.base02;
        bg = "none";
      };
    };
    extraConfigLua = ''
      vim.api.nvim_set_hl(0, "TabLineFill", { bg = "none" })
      vim.api.nvim_set_hl(0, "TabLine", { bg = "none" })
      vim.api.nvim_set_hl(0, "TabLineSel", { bg = "none" })
    '';
  };
}
