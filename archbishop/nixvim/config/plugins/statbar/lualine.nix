{
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
              bg = "none";
              fg = "#d4be98";
            };
            b = {
              bg = "none";
              fg = "#a89984";
            };
            c = {
              bg = "none";
              fg = "#665c54";
            };
          };
          insert = {
            a = {
              bg = "none";
              fg = "#a9b665";
            };
          };
          visual = {
            a = {
              bg = "none";
              fg = "#d3869b";
            };
          };
          replace = {
            a = {
              bg = "none";
              fg = "#ea6962";
            };
          };
          command = {
            a = {
              bg = "none";
              fg = "#89b482";
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
              added = " ";
              modified = " ";
              removed = " ";
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
              error = " ";
              warn = " ";
              info = " ";
              hint = " ";
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
