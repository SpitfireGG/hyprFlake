{pkgs, ...}: {
  boot = {
    extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=1
    '';
    kernel.sysctl = {
      "net.ipv4.tcp_syncookies" = true;
      "net.ipv4.tcp_rfc1337" = 1;

      "vm.swappiness" = 10;
      "vm.dirty_ratio" = 15;
      "vm.dirty_background_ratio" = 5;
      "vm.vfs_cache_pressure" = 50;

      "kernel.sched_autogroup_enabled" = 1;
      "kernel.nmi_watchdog" = 0;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "ibt=off"
      "splash"
      "usbcore.autosuspend=-1"
      "nvidia-drm.modeset=1"
      "nvidia.NVreg_PreserveVideoMemoryAllocations=0"
      "nvidia.NVreg_TemporaryFilePath=/var/tmp"
      "ipv6.disable=1"
      "audit=0"
      "nvme_core.default_ps_max_latency_us=0"
      "threadirqs"
    ];
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5;
      efi.canTouchEfiVariables = false;
    };

    tmp.useTmpfs = true;
    tmp.tmpfsSize = "4G";
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  environment.systemPackages = with pkgs; [
    mesa-demos
    vulkan-tools
    clinfo
    intel-gpu-tools
  ];

  systemd.packages = [pkgs.uwsm];
}
