{
  config,
  lib,
  ...
}: let
  lua = x: {__raw = x;};
in {
  colorschemes = {
    base16 = {
      enable = false;
      setUpBar = false;
      colorscheme = "gruvbox-dark-hard";
    };

    gruvbox-material-nvim = {
      enable = true;
      settings = {
        background = {
          transparent = true;
        };
        comments = {
          italics = true;
        };
        italics = true;
        contrast = "medium";
        customize = lib.nixvim.mkRaw ''
          function(g, o)
            local colors = require("gruvbox-material.colors").get(vim.o.background, "medium")
            if g == "CursorLineNr" then
              o.link = nil
              o.fg = colors.orange
              o.bold = true
            end
            return o
          end
        '';
        float = {
          force_background = false;
        };
        signs = {
          force_background = false;
        };
      };
    };

    ayu = {
      enable = false;
      settings.mirage = false;

      settings.overrides = {
        Normal = {
          bg = "None";
        };
        NormalFloat = {
          bg = "none";
        };
        ColorColumn = {
          bg = "None";
        };
        SignColumn = {
          bg = "None";
        };
        Folded = {
          bg = "None";
        };
        FoldColumn = {
          bg = "None";
        };
        CursorLine = {
          bg = "None";
        };
        CursorColumn = {
          bg = "None";
        };
        VertSplit = {
          bg = "None";
        };
      };
    };
    tokyonight = {
      enable = false;
      settings = {
        style = "night";
        transparent = true;
        onHighlights = ''
          function(hl, c)
              local prompt = "#272B33"
              hl.TelescopeNormal = {
                  bg = c.bg_dark,
                  fg = c.fg_dark,
              }
              hl.TelescopeBorder = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
              }
              hl.TelescopePromptNormal = {
                  bg = prompt,
              }
              hl.TelescopePromptBorder = {
                  bg = prompt,
                  fg = prompt,
              }
              hl.TelescopePromptTitle = {
                  bg = prompt,
                  fg = prompt,
              }
              hl.TelescopePreviewTitle = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
              }
              hl.TelescopeResultsTitle = {
                  bg = c.bg_dark,
                  fg = c.bg_dark,
              }
              end
        '';
      };
    };
    oxocarbon.enable = false;
    rose-pine = {
      enable = false;
      settings = {
        style = "moon"; # "main", "moon", "dawn" or raw lua code
        styles = {
          bold = true;
          italic = false;
          transparency = true;
          dark_variant = "main";
        };
        transparentBackground = true;
        highlightGroups = {
          TelescopeNormal = {
            bg = lua "require('rose-pine.palette').base";
            fg = lua "require('rose-pine.palette').surface";
          };
          TelescopeBorder = {
            bg = lua "require('rose-pine.palette').base";
            fg = lua "require('rose-pine.palette').surface";
          };
          TelescopePreviewTitle = {
            bg = lua "require('rose-pine.palette').base";
            fg = lua "require('rose-pine.palette').surface";
          };
        };
      };
    };

    monokai-pro = {
      enable = false;
      settings = {
        transparent_background = true;
        devicons = true;
        filter = "spectrum";
        terminal_colors = true;
        background-clear = [
          "toggleterm"
          "telescope"
          "renamer"
          "notify"
          "cmp"
        ];
        inc_search = "background";
        annotation = {
          italic = false;
        };
        comment = {
          italic = true;
        };
        keyword = {
          italic = false;
        };
        parameter = {
          italic = false;
        };
        storageclass = {
          italic = false;
        };
        structure = {
          italic = false;
        };
        tag_attribute = {
          italic = false;
        };
        type = {
          italic = false;
        };
      };
    };

    catppuccin = {
      enable = false;
      settings = {
        background = {
          dark = "mocha";
        };

        color_overrides.mocha = {
          base = "#282c34";
          mantle = "#353b45";
          surface0 = "#3e4451";
          surface1 = "#545862";
          surface2 = "#565c64";
          text = "#abb2bf";
          rosewater = "#b6bdca";
          lavender = "#c8ccd4";
          red = "#e06c75";
          peach = "#d19a66";
          yellow = "#e5c07b";
          green = "#98c379";
          teal = "#56b6c2";
          blue = "#61afef";
          mauve = "#c678dd";
          flamingo = "#be5046";
          maroon = "#e06c75";
          sky = "#d19a66";
          pink = "#F5C2E7";
          sapphire = "#74C7EC";
          subtext1 = "#BAC2DE";
          subtext0 = "#A6ADC8";
          overlay2 = "#9399B2";
          overlay1 = "#7F849C";
          overlay0 = "#6C7086";
          crust = "#11111B";
        };

        flavour = "mocha";
        disable_bold = false;
        disable_italic = false;
        disable_underline = false;
        transparent_background = true;
        integrations = {
          cmp = true;
          noice = true;
          notify = true;
          gitsigns = true;
          which_key = true;
          illuminate = {
            enabled = true;
          };
          treesitter = true;
          treesitter_context = true;
          telescope.enabled = true;
          indent_blankline.enabled = true;
          mini.enabled = true;
          native_lsp = {
            enabled = true;
            inlay_hints = {
              background = true;
            };
            underlines = {
              errors = ["underline"];
              hints = ["underline"];
              information = ["underline"];
              warnings = ["underline"];
            };
          };
        };
      };
    };
  };
}
