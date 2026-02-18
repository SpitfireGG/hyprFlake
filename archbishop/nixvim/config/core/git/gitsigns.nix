{
  plugins.gitsigns = {
    enable = true;
    settings = {
      current_line_blame = true;
      watch_gitdir = {
        follow_files = true;
      };
      auto_attach = true;
      attach_to_untracked = false;
      current_line_blame_opts = {
        virt_text = true;
        virt_text_pos = "right_align";
        delay = 1000;
        ignore_whitespace = true;
        virt_text_priority = 100;
        use_focus = true;
      };
      current_line_blame_formatter = "<author>; <author_time:%R> - <summary>";
      sign_priority = 6;
      update_debounce = 100;
      max_file_length = 40000;
      preview_config = {
        style = "minimal";
        relative = "cursor";
        row = 0;
        col = 1;
      };
      signs = {
        add = {
          text = "┃";
        };
        change = {
          text = "▊";
        };
        untracked = {
          text = "┃";
        };
        topdelete = {
          text = "┃";
        };
        changedelete = {
          text = "▋";
        };
        delete = {
          text = "▌";
        };
      };
    };
  };
  keymaps = [
    {
      mode = [
        "n"
        "v"
      ];
      key = "<leader>gh";
      action = "gitsigns";
      options = {
        silent = true;
        desc = "+hunks";
      };
    }
    {
      mode = "n";
      key = "<leader>ghb";
      action = ":Gitsigns blame_line<CR>";
      options = {
        silent = true;
        desc = "Blame line";
      };
    }
    {
      mode = "n";
      key = "<leader>ghd";
      action = ":Gitsigns diffthis<CR>";
      options = {
        silent = true;
        desc = "Diff This";
      };
    }
    {
      mode = "n";
      key = "<leader>ghR";
      action = ":Gitsigns reset_buffer<CR>";
      options = {
        silent = true;
        desc = "Reset Buffer";
      };
    }
    {
      mode = "n";
      key = "<leader>ghS";
      action = ":Gitsigns stage_buffer<CR>";
      options = {
        silent = true;
        desc = "Stage Buffer";
      };
    }
  ];
}
