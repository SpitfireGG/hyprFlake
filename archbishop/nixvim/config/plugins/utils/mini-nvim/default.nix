{
  plugins.mini = {
    enable = true;
    mockDevIcons = false;
    modules.icons = {};
  };
  imports = [
    ./pairs.nix
    ./surround.nix
    ./bracket.nix
    ./files.nix
  ];
}
