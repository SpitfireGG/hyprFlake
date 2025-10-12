{
  plugins.clangd-extensions = {
    enable = true;
    enableOffsetEncodingWorkaround = true;
    settings = {
      ast = {
        role_icons = {
          declaration = "";
          expression = "";
          specifier = "";
          statement = "";
          "template argument" = "";
          type = "";
        };
      };

      inlay_hints = {
        highlight = "Comment";
        show_parameter_hints = true;

        parameter_hints_prefix = "<- ";
        other_hints_prefix = "=> ";
        max_len_align = false;
        max_len_padding = 1;

        right_align = false;
        right_align_padding = 7;
      };
      memory_usage.border = null;
    };
  };
}
