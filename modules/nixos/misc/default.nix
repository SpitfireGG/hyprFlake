{pkgs, ...}: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-hyprland
      ];
    };
  };

  security.rtkit.enable = true;
  security.wrappers.gsr-kms-server = {
    owner = "archbishop";
    group = "archbishop";

    source = "${pkgs.gpu-screen-recorder}/bin/gsr-kms-server";
    capabilities = "cap_sys_admin+ep";
  };
  security.pam.services.login.enableGnomeKeyring = true;
  security.wrappers.dumpcap = {
    source = "${pkgs.wireshark}/bin/dumpcap";
    capabilities = "cap_net_raw,cap_net_admin+eip";
    owner = "root";
    group = "root";
    permissions = "u+rx,g+x";
  };
  users.users.archbishop.extraGroups = ["wireshark"];

  documentation = {
    nixos.enable = true;
    enable = true;
    man.enable = true;
    dev.enable = true;
  };

  system.stateVersion = "23.05";
}
