{pkgs, ...}: {
  environment.sessionVariables = {
    NIXOS_XDG_OPEN_USE_PORTAL = "1";
    MOZ_ENABLE_WAYLAND = "0";
    QT_QPA_PLATFORM = "xcb";
    DOTNET_ROOT = "${pkgs.dotnet-sdk_8}/share/dotnet";
  };
}
