{
  plugins.nvim-tree = {
    enable = true;
    settings = {
      disable_netrw = true;
      hijack_netrw = true;

      # Minimalistic UI
      renderer = {
        root_folder_label = false; # Hide the root folder label
        highlight_git = false;
        highlight_opened_files = "none";
        indent_width = 2;
        indent_markers = {
          enable = true;
          inline_arrows = true;
          icons = {
            corner = "└";
            edge = "│";
            item = "│";
            bottom = "─";
            none = " ";
          };
        };
        icons = {
          show = {
            file = false; # Hide file icons
            folder = false; # Hide folder icons
            folder_arrow = false; # Hide folder arrows
            git = false; # Hide git icons
          };
        };
      };

      # Clean view
      view = {
        width = 30;
        side = "left";
        number = false;
        relativenumber = false;
        signcolumn = "no"; # Remove the sign column
      };

      # Remove the top git / filter status bar
      filters = {
        dotfiles = false;
      };

      git = {
        enable = false; # Disable git integration for cleaner look
      };
    };

    openOnSetup = true;
    openOnSetupFile = false;
    autoClose = true;
  };

  keymaps = [
    {
      mode = "n";
      key = "<C-n>";
      action = ":NvimTreeToggle<CR>";
      options = {
        silent = true;
        desc = "Toggle NvimTree";
      };
    }
    {
      mode = "n";
      key = "<leader>e";
      action = ":NvimTreeFocus<CR>";
      options = {
        silent = true;
        desc = "Focus NvimTree";
      };
    }
    {
      mode = "n";
      key = "<leader>nf";
      action = ":NvimTreeFindFile<CR>";
      options = {
        silent = true;
        desc = "Find current file in NvimTree";
      };
    }
  ];
}
