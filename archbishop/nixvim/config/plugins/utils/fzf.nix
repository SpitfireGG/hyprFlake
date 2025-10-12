{
  plugins.fzf-lua = {
    enable = false;
    keymaps = {
      "<C-p>" = {
        action = "git_files";
        options = {
          desc = "Fzf-Lua Git Files";
          silent = true;
        };
        settings = {
          previewers = {
            cat = {
              cmd = "/nix/store/9rprwmvl7bl7mk0v882gsx29mdnpx2p2-system-path/bin/cat";
            };
          };
          winopts = {
            height = 0.5;
          };
        };
      };
      "<leader>fa" = "live_grep";
    };
  };
}
