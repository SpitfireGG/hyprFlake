{
  plugins.nvim-tree = {
    enable = true;

    # Disable netrw (vim's default file explorer) - recommended for nvim-tree
    disableNetrw = true;
    hijackNetrw = true;

    # Open tree when starting nvim on a directory
    openOnSetup = true;
    openOnSetupFile = false;

    # Auto close when it's the last window
    autoClose = true;

    # Main settings
  };

  # Global keymappings to toggle nvim-tree
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
