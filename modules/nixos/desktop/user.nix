{pkgs, ...}: {
  users = {
    defaultUserShell = pkgs.fish;
    users.archbishop = {
      isNormalUser = true;
      home = "/home/archbishop";
      initialPassword = "archbishop";
      shell = pkgs.fish;
      description = "nixos";
      extraGroups = [
        "networkmanager"
        "wheel"
        "audio"
        "video"
      ];
    };
  };
}
