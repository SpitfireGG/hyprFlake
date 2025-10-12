{
  plugins.tiny-inline-diagnostic = {
    enable = true;

    settings = {
      multilines = {
        enabled = true;
      };
      options = {
        use_icons_from_diagnostic = false;
      };
      preset = "modern";
      virt_texts = {
        priority = 2048;
      };
    };
  };
  extraConfigLua = ''
        signs = {
        left = "",
        right = "",
        arrow = "●",
        diag = "    ",
        up_arrow = "    ",
        vertical = " │",
        vertical_end = " └",
    }
  '';
}
