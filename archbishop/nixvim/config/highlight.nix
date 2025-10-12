{
  config,
  lib,
  ...
}:
let
  colors = import ../config/colors/${config.theme}.nix { };
in
{
  config = {
    highlight = {
      TablineFill = {
        bg = "none";
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

      # Telescope - Made transparent
      TelescopePromptBorder = {
        fg = colors.base01;
        bg = "none"; # Transparent background
      };
      TelescopePromptNormal = {
        fg = "none";
        bg = "none"; # Transparent background
      };
      TelescopePromptPrefix = {
        fg = colors.base08;
        bg = "none"; # Transparent background
      };
      TelescopeSelection = {
        fg = "none";
        bg = "none"; # Transparent selection
      };

      # Completion Menu - Made fully transparent
      Pmenu = {
        fg = "none";
        bg = "none"; # Transparent popup menu
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
        bg = "none"; # Transparent scrollbar
      };
      PmenuThumb = {
        fg = "none";
        bg = "none"; # Transparent scrollbar thumb
      };
      PmenuSel = {
        fg = "none";
        bg = "none";
      };

      # Window borders and floats - Made transparent
      VertSplit = {
        fg = "none";
        bg = "none";
      };
      FloatBorder = {
        fg = "none";
        bg = "none"; # Transparent float border
      };
      NormalFloat = {
        fg = "none";
        bg = "none"; # Transparent float window
      };
      LineNr = {
        fg = "none";
        bg = "none";
      };

      # Noice popups - Made transparent
      NoiceCmdlinePopup = {
        fg = colors.base04;
        bg = "none"; # Transparent command popup
      };
      NoiceCmdlinePopupBorder = {
        fg = colors.base01;
        bg = "none"; # Transparent popup border
      };
      NoiceCmdlinePopupBorderSearch = {
        fg = colors.base01;
        bg = "none"; # Transparent search popup border
      };

      # Additional transparent highlights for better integration
      WinSeparator = {
        fg = "none";
        bg = "none";
      };

      # Make LSP diagnostic floats transparent
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

      # Make hover documentation transparent
      LspInfoBorder = {
        fg = colors.base01;
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
