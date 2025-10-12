{
  lib,
  pkgs,
  ...
}:
{
  plugins = {
    dap = {
      enable = false;
    };
    dap-ui = {
      enable = false;
      # DAP UI configuration
      settings = {
        icons = {
          expanded = "▾";
          collapsed = "▸";
          current_frame = "▸";
        };
        mappings = {
          # Use a table to describe mappings
          expand = [
            "<CR>"
            "<2-LeftMouse>"
          ];
          open = "o";
          remove = "d";
          edit = "e";
          repl = "r";
          toggle = "t";
        };
        controls = {
          enabled = true;
          element = "repl";
          icons = {
            pause = "⏸";
            play = "▶";
            step_into = "⏎";
            step_over = "⏭";
            step_out = "⏮";
            step_back = "b";
            run_last = "▶▶";
            terminate = "⏹";
            disconnect = "⏏";
          };
        };
        floating = {
          border = "single";
          mappings = {
            close = [
              "q"
              "<Esc>"
            ];
          };
        };
      };
    };

    # Virtual text for debugging
    dap-virtual-text = {
      enable = true;
      settings = {
        enabled = true;
        enabled_commands = true;
        highlight_changed_variables = true;
        highlight_new_as_changed = false;
        show_stop_reason = true;
        commented = false;
        only_first_definition = true;
        all_references = false;
      };
    };
  };
  keymaps = [
    # DAP debugging keymaps
    {
      mode = "n";
      key = "<leader>db";
      action = "<cmd>lua require'dap'.toggle_breakpoint()<CR>";
      options.desc = "Toggle breakpoint";
    }
    {
      mode = "n";
      key = "<leader>dc";
      action = "<cmd>lua require'dap'.continue()<CR>";
      options.desc = "Continue debugging";
    }
    {
      mode = "n";
      key = "<leader>dr";
      action = "<cmd>lua require'dap'.repl.open()<CR>";
      options.desc = "Open debug REPL";
    }
    {
      mode = "n";
      key = "<leader>dt";
      action = "<cmd>lua require'dapui'.toggle()<CR>";
      options.desc = "Toggle debug UI";
    }
    {
      mode = "n";
      key = "<leader>ds";
      action = "<cmd>lua require'dap'.step_over()<CR>";
      options.desc = "Step over";
    }
    {
      mode = "n";
      key = "<leader>di";
      action = "<cmd>lua require'dap'.step_into()<CR>";
      options.desc = "Step into";
    }
    {
      mode = "n";
      key = "<leader>do";
      action = "<cmd>lua require'dap'.step_out()<CR>";
      options.desc = "Step out";
    }
  ];
}
