{
  plugins.copilot-cmp = {
    enable = false;
  };
  plugins.copilot-lua = {
    enable = false;
    settings = {
      event = [
        "InsertEnter"
        "LspAttach"
      ];
      fix_pairs = false;

      suggestion = {
        enabled = false;
      };
      panel = {
        enabled = false;
      };
    };
  };

  /*
    extraConfigLua = ''
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    '';
  */
}
