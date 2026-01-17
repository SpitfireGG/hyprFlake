{
  config,
  lib,
  inputs,
  ...
}: let
  getAllNixFiles = dir: let
    entries = builtins.readDir dir;

    processEntry = name: type: let
      path = dir + "/${name}";
    in
      if type == "directory" && name != "colors" && name != "specific"
      then getAllNixFiles path
      else if type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix"
      then [path]
      else [];

    allEntries = lib.mapAttrsToList processEntry entries;
  in
    lib.flatten allEntries;

  nixFiles = getAllNixFiles ./.;
in {
  imports = nixFiles;

  options = {
    theme = lib.mkOption {
      default = "paradise";
      type = lib.types.enum [
        "paradise"
        "decay"
        "mountain"
        "tokyonight"
        "everforest"
        "everblush"
        "jellybeans"
        "radium"
        "aquarium"
        "gruvbox"
        "gruvbox_mt_hard"
        "kanagawa-waves"
        "nord-chime"
      ];
    };
  };

  config = {
    theme = "kanagawa-waves";
    extraConfigLua = ''
      _G.theme = "${config.theme}"

    '';
  };
}
