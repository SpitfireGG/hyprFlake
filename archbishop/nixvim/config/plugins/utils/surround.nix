{
  plugins.nvim-surround = {
    enable = true;
  };
}
/*
{pkgs, ...}: {
  extraPlugins = with pkgs.vimPlugins; [
    nvim-surround
  ];

  extraConfigLua = ''
    require("nvim-surround").setup({
      keymaps = {
        normal = "gs",
        normal_cur = "gss",
        normal_line = "gS",
        normal_cur_line = "gSS",
        visual = "S",
        visual_line = "gS",  -- Still has conflict!
        delete = "ds",
        change = "cs",
        change_line = "cS",
      },
    })
  '';
}
*/

