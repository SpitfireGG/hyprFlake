{ config, ... }:
{
  imports = [
    #hardware-configuration
    ./hardware-configuration.nix

    # cisco-packet-tracer
    ../../modules/packetTracerByp.nix

    #system configurations
    ../../modules/nixos/system/boot.nix
    ../../modules/nixos/system/hardware.nix
    ../../modules/nixos/system/networking.nix
    ../../modules/nixos/system/services.nix
    ../../modules/nixos/system/nixSetting.nix
    ../../modules/nixos/system/nixpkgs.nix

    #desktop configurations
    ../../modules/nixos/desktop/user.nix
    ../../modules/nixos/desktop/fonts.nix
    ../../modules/nixos/desktop/programs.nix
    ../../modules/nixos/desktop/session.nix
    ../../modules/nixos/desktop/timezone.nix

    # programs & packages
    ../../modules/nixos/programs/default.nix

    # overlays
    # ../../overlays/waybar.nix

    #miscs
    ../../modules/nixos/misc/default.nix

    ../../modules/nixos/system/gaming.nix

    #styling

    #    ../../overlays/firefox-nightly.nix
  ];
  hardware.opengl.enable = true;
  gaming.enable = true;

  virtualisation.virtualbox.host.enable = true;
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # Add your user to libvirtd group

  users.users.archbishop.extraGroups = [ "libvirtd" ];
  users.extraGroups.vboxusers.members = [ "archbishop" ];
}
