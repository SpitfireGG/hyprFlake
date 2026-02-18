{pkgs, ...}: {
  boot = {
    extraModprobeConfig = ''
      options snd-intel-dspcfg dsp_driver=1
    '';
    kernel.sysctl = {
      # Network security
      "net.ipv4.tcp_syncookies" = true;
      "net.ipv4.tcp_rfc1337" = 1;
      # Memory management — desktop-optimized
      "vm.swappiness" = 10;         # Prefer RAM over swap on desktop
      "vm.dirty_ratio" = 15;
      "vm.dirty_background_ratio" = 5;
      "vm.vfs_cache_pressure" = 50; # Keep dentries/inodes in cache longer
      # Responsiveness
      "kernel.sched_autogroup_enabled" = 1;
      "kernel.nmi_watchdog" = 0;    # Disable NMI watchdog (saves power)
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "ibt=off"
      "splash"
      "usbcore.autosuspend=-1"
      "nvidia-drm.modeset=1"
      "ipv6.disable=1"
      "audit=0"
      "nvme_core.default_ps_max_latency_us=0"
      "threadirqs"              # Better IRQ threading for audio/latency
    ];
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 5; # Keep only last 5 generations
      efi.canTouchEfiVariables = false;
    };
    # Use tmpfs for /tmp — faster, cleared on reboot
    tmp.useTmpfs = true;
    tmp.tmpfsSize = "4G";
  };

  # zram swap — compressed RAM-based swap, much faster than disk swap
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
