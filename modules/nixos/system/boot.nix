{pkgs, ...}: {
  boot = {
    extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=1
    '';
    kernel.sysctl = {
      "net.ipv4.tcp_syncookies" = false;
      "vm.swappiness" = 60;
      "vm.dirty_ratio" = 10;
      "vm.dirty_background_ratio" = 5;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "ibt=off"
      "CONFIG_DRM_SIMPLEDRM=y"
      "splash"
      "usbcore.autosuspend=-1"
      "nvidia-drm.modeset=1"
      "ipv6.disable=1"
      "audit=0"
      "nvme_core.default_ps_max_latency_us=0"
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

  systemd.packages = [pkgs.uwsm];
}
