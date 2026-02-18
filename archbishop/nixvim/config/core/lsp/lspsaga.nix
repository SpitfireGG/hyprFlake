{
  plugins.lspsaga = {
    enable = true;
    settings = {
      beacon = {
        enable = true;
        frequency = 7;
      };
      ui = {
        border = "rounded";
        code_action = "💡";
      };

      hover = {
        open_cmd = "!floorp";
        open_link = "gx";
      };

      diagnostic = {
        border_follow = true;
        diagnostic_only_current = false;
        show_code_action = true;
        jump_num_shortcut = true;
      };

      symbol_in_winbar = {
        enable = true;
        separator = " › ";
      };

      lightbulb = {
        enable = false;
        sign = false;
        virtual_text = false;
      };
      rename = {
        auto_save = true;
        keys = {
          exec = "<CR>";
          quit = [
            "<C-k>"
            "<Esc>"
          ];
          select = "x";
        };
      };
      outline = {
        auto_close = true;
        auto_preview = true;
        close_after_jump = true;
        layout = "normal";
        win_position = "right";
        keys = {
          jump = "e";
          quit = "q";
          toggle_or_jump = "o";
        };
      };
      scroll_preview = {
        scroll_down = "<C-f>";
        scroll_up = "<C-b>";
      };
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "gd";

      action = "<cmd>Lspsaga finder<CR>";
      options = {
        desc = "Find Definition & Refs";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gp";

      action = "<cmd>Lspsaga peek_definition<CR>";
      options = {
        desc = "Peek Definition";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "gT";
      action = "<cmd>Lspsaga goto_type_definition<CR>";
      options = {
        desc = "Go to Type Definition";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "K";
      action = "<cmd>Lspsaga hover_doc<CR>";
      options = {
        desc = "Hover Documentation";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cw";
      action = "<cmd>Lspsaga outline<CR>";
      options = {
        desc = "Outline Structure";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>cd";

      action = "<cmd>Lspsaga show_line_diagnostics<CR>";
      options = {
        desc = "Line Diagnostics";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "]d";
      action = "<cmd>Lspsaga diagnostic_jump_next<CR>";
      options = {
        desc = "Next Diagnostic";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "[d";
      action = "<cmd>Lspsaga diagnostic_jump_prev<CR>";
      options = {
        desc = "Previous Diagnostic";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>cr";
      action = "<cmd>Lspsaga rename<CR>";
      options = {
        desc = "Smart Rename";
        silent = true;
      };
    }
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>ca";
      action = "<cmd>Lspsaga code_action<CR>";
      options = {
        desc = "Code Action";
        silent = true;
      };
    }

    {
      mode = "n";
      key = "<leader>ci";

      action = "<cmd>Lspsaga incoming_calls<CR>";
      options = {
        desc = "Incoming Calls";
        silent = true;
      };
    }
    {
      mode = "n";
      key = "<leader>co";

      action = "<cmd>Lspsaga outgoing_calls<CR>";
      options = {
        desc = "Outgoing Calls";
        silent = true;
      };
    }

    {
      mode = [
        "n"
        "t"
      ];
      key = "<A-d>";
      action = "<cmd>Lspsaga term_toggle<CR>";
      options = {
        desc = "Toggle Floating Terminal";
        silent = true;
      };
    }
  ];
}
