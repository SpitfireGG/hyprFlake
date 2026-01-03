{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.gaming;
in {
  options.gaming.enable = mkEnableOption "a set of gaming-related optimizations";

  config = mkIf cfg.enable {
    hardware = {
      graphics = {
        extraPackages = with pkgs; [
          intel-vaapi-driver
          intel-media-driver
        ];
        enable32Bit = true;
      };
      xone.enable = true;
    };
    environment.systemPackages = [
      pkgs.vulkan-tools
      pkgs.gamemode
    ];
    boot.kernelModules = ["i8k"]; # module to enable fan controlling

    programs.gamemode.enable = true;
  };
}
