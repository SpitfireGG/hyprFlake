{
  config,
  pkgs,
  ...
}: let
  colors = import ../../colors/${config.theme}.nix {};
in {
  extraPlugins = with pkgs.vimPlugins; [
    blink-cmp-copilot
    blink-ripgrep-nvim
  ];

  plugins = {
    blink-cmp-copilot.enable = true;
    blink-cmp-dictionary.enable = true;
    blink-cmp-spell.enable = true;
    blink-copilot.enable = true;
    blink-emoji.enable = true;
    blink-ripgrep.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;

      settings = {
        keymap = {
          "<C-b>" = [
            "scroll_documentation_up"
            "fallback"
          ];
          "<C-e>" = ["hide"];
          "<C-f>" = [
            "scroll_documentation_down"
            "fallback"
          ];
          "<C-j>" = [
            "select_next"
            "fallback"
          ];
          "<C-k>" = [
            "select_prev"
            "fallback"
          ];
          "<C-space>" = [
            "show"
            "show_documentation"
            "hide_documentation"
          ];
          "<Enter>" = [
            "select_and_accept"
            "fallback"
          ];
          "<S-Tab>" = [
            "snippet_backward"
            "fallback"
          ];
          "<Tab>" = [
            "snippet_forward"
            "fallback"
          ];
        };

        signature = {
          enabled = true;
          window.border = "rounded";
        };

        sources = {
          default = [
            "lsp"
            "snippets"
            "buffer"
            "path"
          ];

          providers = {
            ripgrep = {
              name = "Ripgrep";
              module = "blink-ripgrep";
              score_offset = 1;
            };
            path = {
              min_keyword_length = 0; # Changed from 2 to 0
              max_items = 10;
            };

            buffer = {
              name = "Buffer";
              module = "blink.cmp.sources.buffer";
              min_keyword_length = 2;
            };

            dictionary = {
              name = "Dict";
              module = "blink-cmp-dictionary";
              min_keyword_length = 4;
            };

            emoji = {
              name = "Emoji";
              module = "blink-emoji";
              score_offset = 1;
              min_keyword_length = 2;
              max_items = 8;
            };

            spell = {
              name = "Spell";
              module = "blink-cmp-spell";
              score_offset = 1;
              min_keyword_length = 4;
              max_items = 5;
            };

            copilot = {
              name = "copilot";
              module = "blink-copilot";
              async = true;
              score_offset = 2;
              min_keyword_length = 0; # Changed from 3 to 0
              max_items = 3;
              timeout_ms = 1000;
            };
          };
        };

        appearance = {
          nerd_font_variant = "normal";
          kind_icons = {
            Text = "󰉿";
            Method = "";
            Function = "󰊕";
            Constructor = "󰒓";
            Field = "󰜢";
            Variable = "󰆦";
            Property = "󰖷";
            Class = "󱡠";
            Interface = "󱡠";
            Struct = "󱡠";
            Module = "󰅩";
            Unit = "󰪚";
            Value = "󰦨";
            Enum = "󰦨";
            EnumMember = "󰦨";
            Keyword = "󰻾";
            Constant = "󰏿";
            Snippet = "󱄽";
            Color = "󰏘";
            File = "󰈔";
            Reference = "󰬲";
            Folder = "󰉋";
            Event = "󱐋";
            Operator = "󰪚";
            TypeParameter = "󰬛";
            Emoji = "🤶";
          };
        };

        fuzzy = {
          frecency.enabled = true;
          use_proximity = true;
        };

        completion = {
          ghost_text.enabled = true;

          list = {
            selection = {
              auto_insert = false;
              preselect = false; # Changed to true for better UX
            };
            max_items = 25;
            # Add cycle configuration
            cycle = {
              from_bottom = true;
              from_top = true;
            };
          };

          menu = {
            auto_show = true;
            border = "rounded";

            draw = {
              gap = 1;
              treesitter = ["lsp"];
              # Fixed columns configuration
              columns = [
                {__unkeyed-1 = "kind_icon";}
                {__unkeyed-1 = "label";}
                {__unkeyed-1 = "source_name";}
              ];
            };
          };

          documentation = {
            auto_show = true;
            auto_show_delay_ms = 200; # Reduced delay
            update_delay_ms = 50;
            treesitter_highlighting = true; # Enable for better syntax highlighting
            window = {
              border = "rounded";
              scrollbar = true;
            };
          };

          accept = {
            auto_brackets = {
              enabled = true;
            };
          };
        };
      };
    };
  };

  highlight = with colors; {
    BlinkCmpMenu = {
      bg = "none";
      fg = "none";
    };
    BlinkCmpMenuSelection = {
      bg = base0E;
      fg = base00;
    };
    BlinkCmpDoc = {
      bg = "none";
      fg = "none";
    };
    BlinkCmpDocSeparator = {
      bg = "none";
      fg = "none";
    };
    BlinkCmpDocBorder = {
      bg = base01;
      fg = base01;
    };
  };
}
