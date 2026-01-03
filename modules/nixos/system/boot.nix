{pkgs, ...}: {
  boot = {
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "i915.enable_guc=0"
      "i915.enable_fbc=-1"
      "i915.enable_psr=0"
      "i915.modeset=1"
      "intel_iommu=on"
      "acpi.battery_check=0"
      "acpi_battery_supress_warning=1"
      "quiet"
    ];
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = false;
    };
  };
  environment.systemPackages = with pkgs; [
    mesa-demos # glxinfo, glxgears
    vulkan-tools # vulkaninfo, vkcube
    clinfo # OpenCL info
    intel-gpu-tools # Intel GPU utilities
  ];
}
