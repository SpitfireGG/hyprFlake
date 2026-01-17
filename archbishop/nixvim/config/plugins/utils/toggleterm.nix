{
  plugins.toggleterm = {
    enable = true;
    settings = {
      auto_scroll = true;
      autochdir = true;
      close_on_exit = false;
      shade_terminals = true;
      shading_factor = 2;
      start_in_insert = true;

      direction = "float";
      hide_numbers = true;
      highlights = {
        NormalFloat.link = "Normal";
        FloatBorder.link = "Normal";
        StatusLine.gui = "NONE";
        StatusLineNC = {
          cterm = "italic";
          gui = "NONE";
        };
      };
      open_mapping = "[[<c-t>]]";
      persist_mode = true;
      persist_size = true;
      insert_mappings = false;
      terminal_mappings = false;

      shell = "fish";
      size = 12;
      float_opts = {
        border = "single";
        winblend = 0;
      };
    };
  };
  keymaps = [
    {
      mode = "n";
      key = "<leader>tt";
      action = "<cmd>ToggleTerm<cr>";
      options = {
        desc = "Toggle Terminal Window";
      };
    }
    {
      mode = "n";
      key = "<m-3>";
      action = "<cmd>ToggleTerm direction=vertical<cr>";
      options = {
        desc = "Toggle Vertical Terminal Window";
      };
    }
    {
      mode = "n";
      key = "<m-2>";
      action = "<cmd>ToggleTerm direction=horizontal<cr>";
      options = {
        desc = "Toggle Horizontal Terminal Window";
      };
    }
    {
      mode = "n";
      key = "<m-1>";
      action = "<cmd>ToggleTerm direction=float<cr>";
      options = {
        desc = "Toggle Floating Terminal Window";
      };
    }
  ];
  extraConfigLua = ''
    vim.keymap.set('t', '<C-q>', '<C-\\><C-n>:ToggleTerm<CR>', { noremap = true, silent = true })
  '';
}
