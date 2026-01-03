{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "splash"
      "i915.enable_psr=0"
      "nvidia-drm.modeset=1"
      "ipv6.disable=1"
      "audit=0"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
  };
  environment.systemPackages = with pkgs; [
    mesa-demos
    vulkan-tools
    clinfo
    intel-gpu-tools
  ];
}
