{ pkgs, ... }:
{
  plugins.luasnip = {
    enable = true;
    fromLua = [ { paths = ./snippets/csharp.lua; } ];
    settings = {
      enable_autosnippets = true;
      store_selection_keys = "<Tab>";
      update_events = "TextChanged,TextChangedI";
    };
    fromVscode = [
      {
        include = [ "cs" ];
        lazyLoad = true;
        paths = "${pkgs.vimPlugins.friendly-snippets}";
      }
    ];
  };
}
