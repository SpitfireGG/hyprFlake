{pkgs, ...}: {
  environment.sessionVariables = {
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    MOZ_ENABLE_WAYLAND = "1";           # Firefox on Wayland
    QT_QPA_PLATFORM = "wayland";        # Qt apps on Wayland
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1"; # No Qt CSD decorations
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}/share/dotnet";

    # Electron apps — auto-detect Wayland
    ELECTRON_OZONE_PLATFORM_HINT = "auto";

    # SDL games on Wayland
    SDL_VIDEODRIVER = "wayland";
    CLUTTER_BACKEND = "wayland";

    # Hyprland / NVIDIA
    LIBVA_DRIVER_NAME = "nvidia";
    XDG_SESSION_TYPE = "wayland";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    # NVK (open-source NVIDIA Vulkan driver) — comment out if using proprietary
    # NVK_I_WANT_A_BROKEN_VULKAN_DRIVER = "1";
  };
}
