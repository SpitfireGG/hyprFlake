{
  config,
  lib,
  ...
}: let
  colors = import ../../colors/${config.theme}.nix {};
in {
  plugins = {
    bufferline = {
      enable = true;
      settings = {
        options = {
          separatorStyle = "slant"; # Sleek slant style
          show_buffer_close_icons = false;
          show_buffer_icons = true;
          show_tab_indicators = false;
          hover = {
            enabled = true;
            delay = 200;
            reveal = ["show_buffer_close_icons"];
          };

          offsets = [
            {
              filetype = "NvimTree";
              text = "󰔶 File Explorer ";
              text_align = "left";
              separator = true;
            }
          ];
          modified_icon = "󰊠";
          show_duplicate_paths = 2;

          diagnostics_indicator = ''
            function(count, level, diagnostics_dict, context)
              local s = " "
              for e, n in pairs(diagnostics_dict) do
                local sym = ""
                if e == "error" then sym = " "
                elseif e == "warn" then sym = " "
                elseif e == "info" then sym = " "
                elseif e == "hint" then sym = "󰏫 "
                end
                s = s .. sym .. n .. " "
              end
              return s
            end
          '';
          keymaps = [
            {
              mode = "n";
              key = "<Tab>";
              action = "<cmd>BufferLineCycleNext<cr>";
              options = {
                desc = "Cycle to next buffer";
              };
            }
            {
              mode = "n";
              key = "<S-Tab>";
              action = "<cmd>BufferLineCyclePrev<cr>";
              options = {
                desc = "Cycle to previous buffer";
              };
            }
            {
              mode = "n";
              key = "<S-l>";
              action = "<cmd>BufferLineCycleNext<cr>";
              options = {
                desc = "Cycle to next buffer";
              };
            }
            {
              mode = "n";
              key = "<S-h>";
              action = "<cmd>BufferLineCyclePrev<cr>";
              options = {
                desc = "Cycle to previous buffer";
              };
            }
            {
              mode = "n";
              key = "<leader>bd";
              action = "<cmd>bdelete<cr>";
              options = {
                desc = "Delete buffer";
              };
            }
            {
              mode = "n";
              key = "<leader>bb";
              action = "<cmd>e #<cr>";
              options = {
                desc = "Switch to Other Buffer";
              };
            }
            {
              mode = "n";
              key = "<leader>br";
              action = "<cmd>BufferLineCloseRight<cr>";
              options = {
                desc = "Delete buffers to the right";
              };
            }
            {
              mode = "n";
              key = "<leader>bl";
              action = "<cmd>BufferLineCloseLeft<cr>";
              options = {
                desc = "Delete buffers to the left";
              };
            }
            {
              mode = "n";
              key = "<leader>bo";
              action = "<cmd>BufferLineCloseOthers<cr>";
              options = {
                desc = "Delete other buffers";
              };
            }
            {
              mode = "n";
              key = "<leader>bp";
              action = "<cmd>BufferLineTogglePin<cr>";
              options = {
                desc = "Toggle pin";
              };
            }
            {
              mode = "n";
              key = "<leader>bP";
              action = "<Cmd>BufferLineGroupClose ungrouped<CR>";
              options = {
                desc = "Delete non-pinned buffers";
              };
            }
          ];
        };
      };
    };
  };
  highlight = with colors; {
    BufferLineBackground = {
      bg = "None";
    };
    BufferLineBuffer = {
      bg = base0C;
      fg = base04;
    };
    BufferLineBufferSelected = {
      bg = "None";
      fg = base04;
    };
    BufferLineBufferVisible = {
      bg = base01;
    };
    BufferLineCloseButton = {
      bg = base01;
    };
    BufferLinecloseButtonSelected = {
      bg = base0C;
      fg = base00;
    };
    BufferLineCloseButtonVisible = {
      bg = base01;
    };
    BufferLineDuplicate = {
      bg = base01;
    };
    BufferLineDuplicateSelected = {
      bg = base0C;
      fg = base00;
    };
    BufferLineDuplicateVisible = {
      bg = base01;
    };
    BufferLineFill = {
      bg = "None";
    };
    BufferLineIndicatorSelected = {
      bg = "None";
    };
    BufferLineIndicator = {
      bg = base01;
    };
    BufferLineIndicatorVisible = {
      bg = base01;
    };
    BufferLineModified = {};
    BufferLineModifiedSelected = {
      bg = base0C;
    };
    BufferLineModifiedVisible = {
      bg = base01;
    };
    BufferLineOffsetSeparator = {};
    BufferLinePick = {};
    BufferLinePickSelected = {
      bg = base0C;
    };
    BufferLinePickVisible = {};
    BufferLineSeparator = {
      bg = base01;
      fg = base01;
    };
    BufferLineSeparatorSelected = {
      bg = base0C;
    };
    BufferLineSeparatorVisible = {};
  };
}
