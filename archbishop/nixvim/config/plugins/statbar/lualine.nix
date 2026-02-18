{config, ...}: let
  colors = import ../../colors/${config.theme}.nix {};
in {
  plugins.lualine = {
    enable = true;
    lazyLoad.settings.event = "BufEnter";
    settings = {
      options = {
        icons_enabled = true;
        component_separators = {
          left = "";
          right = "";
        };
        section_separators = {
          left = "";
          right = "";
        };
        theme = {
          normal = {
            a = {
              bg = "${colors.base0D}";
              fg = "${colors.base00}";
              gui = "bold";
            };
            b = {
              bg = "${colors.base01}";
              fg = "${colors.base0D}";
            };
            c = {
              bg = "${colors.base00}";
              fg = "${colors.base05}";
            };
          };
          insert = {
            a = {
              bg = "${colors.base0B}";
              fg = "${colors.base00}";
              gui = "bold";
            };
            b = {
              bg = "${colors.base01}";
              fg = "${colors.base0B}";
            };
          };
          visual = {
            a = {
              bg = "${colors.base0E}";
              fg = "${colors.base00}";
              gui = "bold";
            };
            b = {
              bg = "${colors.base01}";
              fg = "${colors.base0E}";
            };
          };
          replace = {
            a = {
              bg = "${colors.base08}";
              fg = "${colors.base00}";
              gui = "bold";
            };
            b = {
              bg = "${colors.base01}";
              fg = "${colors.base08}";
            };
          };
          command = {
            a = {
              bg = "${colors.base0A}";
              fg = "${colors.base00}";
              gui = "bold";
            };
            b = {
              bg = "${colors.base01}";
              fg = "${colors.base0A}";
            };
          };
          inactive = {
            a = {
              bg = "${colors.base01}";
              fg = "${colors.base03}";
            };
            b = {
              bg = "${colors.base00}";
              fg = "${colors.base03}";
            };
            c = {
              bg = "${colors.base00}";
              fg = "${colors.base03}";
            };
          };
        };
        globalstatus = true;
        disabled_filetypes = {
          statusline = [
            "dashboard"
            "alpha"
            "starter"
            "neo-tree"
          ];
        };
      };

      sections = {
        lualine_a = [
          {
            __unkeyed = "mode";
            fmt.__raw = ''
              function(str)
                return str:sub(1,1)
              end
            '';
            padding = {
              left = 1;
              right = 1;
            };
          }
        ];

        lualine_b = [
          {
            __unkeyed = "branch";
            icon = "";
            padding = {
              left = 1;
              right = 1;
            };
          }
          {
            __unkeyed = "diff";
            symbols = {
              added = "♯ ";
              modified = "◆ ";
              removed = "◈ ";
            };
            diff_color = {
              added = {
                fg = "${colors.base0B}";
              };
              modified = {
                fg = "${colors.base0A}";
              };
              removed = {
                fg = "${colors.base08}";
              };
            };
            padding = {
              left = 1;
              right = 1;
            };
          }
        ];

        lualine_c = [
          {
            __unkeyed = "filename";
            path = 1;
            symbols = {
              modified = "●";
              readonly = "";
              unnamed = "[No Name]";
            };
          }
        ];

        lualine_x = [
          {
            __unkeyed = "diagnostics";
            sources = ["nvim_diagnostic"];
            symbols = {
              error = "♯";
              warn = "◆";
              info = "◈";
              hint = "◇";
            };
            diagnostics_color = {
              error = {
                fg = "${colors.base08}";
              };
              warn = {
                fg = "${colors.base0A}";
              };
              info = {
                fg = "${colors.base0D}";
              };
              hint = {
                fg = "${colors.base0C}";
              };
            };
            colored = true;
          }
        ];

        lualine_y = [
          {
            __unkeyed.__raw = ''
              function()
                local msg = vim.bo.filetype
                if msg == "" then return "" end
                return msg
              end
            '';
          }
        ];

        lualine_z = [
          {
            __unkeyed = "location";
            padding = {
              left = 1;
              right = 1;
            };
          }
        ];
      };

      inactive_sections = {
        lualine_a = [""];
        lualine_b = [""];
        lualine_c = ["filename"];
        lualine_x = ["location"];
        lualine_y = [""];
        lualine_z = [""];
      };
    };
  };
}
