{config, ...}: let
  unstable = import <nixos-unstable> {};
in {
  hardware = {
    pulseaudio.package = unstable.pulseaudioFull;
    pulseaudio.enable = false;
    bluetooth.enable = true;
    bluetooth.network = {
      General = {
        DisableSecurity = true;
      };
    };

    bluetooth.input = {
      General = {
        IdleTimeout = 50;
      };
    };
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false;

      powerManagement.finegrained = false;

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;

      prime = {
        offload = {
          enable = true;
          enableOffloadCmd = true;
        };
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
    };
  };
}
